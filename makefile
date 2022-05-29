ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ESSAYS_OUT_DIR=essays
ORG_ESSAYS_DIR=org-files/essays
ORG_FILES=$(ORG_ESSAYS_DIR)/%.org
# Using GNU Make-specific functions here
HTML_FILES = $(patsubst org-files/essays/%.org,$(ESSAYS_OUT_DIR)/%.html,$(wildcard org-files/essays/*/*.org))

.PHONY: all clean

all: essays-all

essays-all: $(ESSAYS_OUT_DIR) $(HTML_FILES)

$(ESSAYS_OUT_DIR):
	mkdir -v -p $(ESSAYS_OUT_DIR)

$(ORG_ESSAYS_DIR)/%.html: $(ORG_ESSAYS_DIR)/%.org
	emacs $< \
		--batch \
		--load=$(ROOT_DIR)/org-blog/ox-article.el \
		--funcall=org-blog-export-to-html \
		--kill

$(ESSAYS_OUT_DIR)/%.html: $(ORG_ESSAYS_DIR)/%.html
	mkdir -p $(@D) # create target dir
	cp $< $@ # copy generated html to target file path
	rm $<

clean:
	rm *.html
