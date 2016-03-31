function drawGraph() {
    var data = {
        labels: ["JSON", "acl", "actionscript", "ada95", "c", "c-winapi", "c-os2",
                 "csharp", "e", "eiffel", "escript", "euphoria", "falcon", "fortran",
                 "fortran90", "fortran95", "go", "groovy", "hugo", "java122",
                 "java13", "java14", "java14jsp", "javascript", "js20", "jscript",
                 "jsp", "lua", "lull", "maple", "modula", "modula2", "oracle11g",
                 "pascal", "perl", "php5", "pl1", "plsql", "python26", "python35",
                 "qbasic", "ruby", "rust", "sap", "schema", "scheme", "small",
                 "sql", "swift", "symbian", "tcl-tk", "turboc", "uniscript", "vb",
                 "vbdotnet", "vbscript", "verilog2001", "vhdl93", "yaml",
                 "zillions"],
        datasets: [
            {
                label: "Keywords Distribution",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [3, 17, 13, 69, 51, 50, 50, 54, 26, 53, 10, 24, 52, 54, 75,
                       9, 25, 52, 92, 49, 49, 55, 49, 52, 58, 64, 51, 16, 28, 48,
                       61, 48, 244, 34, 54, 87, 10, 243, 26, 33, 131, 47, 101, 307,
                       12, 85, 27, 180, 66, 92, 133, 39, 52, 113, 56, 54, 122, 97,
                       3, 137]
            }
        ]
    }
    var ctx = document.getElementById("keywordChart").getContext("2d");
    var myNewChart = new Chart(ctx).Line(data);
}
