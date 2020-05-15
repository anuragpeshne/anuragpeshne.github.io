ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ESSAYS_OUT_DIR=essays
ORG_ESSAYS_DIR=org-files/essays
ORG_FILES=$(ORG_ESSAYS_DIR)/%.org
# Using GNU Make-specific functions here
FILES=$(patsubst org-files/essays/%.org,$(ESSAYS_OUT_DIR)/%.html,$(wildcard org-files/essays/*.org))

.PHONY: all clean

all: essays-all

essays-all: $(ESSAYS_OUT_DIR) $(FILES)

$(ESSAYS_OUT_DIR):
	mkdir -v -p $(ESSAYS_OUT_DIR)

$(ORG_ESSAYS_DIR)/%.html: $(ORG_ESSAYS_DIR)/%.org
	emacs $< \
		--batch \
		--load=$(ROOT_DIR)/org-blog/ox-article.el \
		--funcall=org-blog-export-to-html \
		--kill

$(ESSAYS_OUT_DIR)/%.html: $(ORG_ESSAYS_DIR)/%.html
	cp $< $(ESSAYS_OUT_DIR)
	rm $<

clean:
	rm *.html
