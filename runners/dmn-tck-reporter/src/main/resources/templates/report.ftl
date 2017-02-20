<#-- @ftlvariable name="cByLabels" type="java.util.Collection<org.omg.dmn.tck.ReportChart>" -->
<#-- @ftlvariable name="header" type="org.omg.dmn.tck.ReportHeader" -->
<#-- @ftlvariable name="tIndLabels" type="java.util.Collection<org.omg.dmn.tck.ReportTable>" -->
<#-- @ftlvariable name="tByLabels" type="org.omg.dmn.tck.ReportTable" -->
<#-- @ftlvariable name="tAllTests" type="org.omg.dmn.tck.ReportTable" -->
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>DMN TCK Report</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>
    <style>
        .report-header {
            padding-top: 60px;
            padding-bottom: 60px;
            font-size: 24px;
            text-align: left;
        }
        .report-header h1 {
            font-size: 60px;
            line-height: 1;
        }
        .icon-red {
            color: #c80f18;
        }
        .icon-yellow {
            color: #c87e18;
        }
        .icon-green {
            color: #0f820d;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="report-header ">
        <div class="container">
            <h1>DMN TCK Report Results</h1>
            <p><br/><p/>
            <p><strong>Date:</strong> ${.now}</p>
            <p><strong>Tests:</strong> ${header.totalTests}</p>
            <p><strong>Labels:</strong> ${header.totalLabels}</p>
            <p><strong>Products:</strong> ${header.totalProducts}</p>
            <p><br/><p/>
            <blockquote>
                <p><small><em><strong>DISCLAIMER:</strong> The following is an automatically generated report of the results
               of the TCK tests execution on the listed products from their individual
                vendors. These results were provided by the respective vendors. The accuracy of
                    the results is under the responsibility of the respective vendors.</em></small></p>
            </blockquote>
        </div>
    </div>

    <script>
        window.chartColors = {
            red: 'rgb(255, 99, 132)',
            orange: 'rgb(255, 159, 64)',
            yellow: 'rgb(255, 205, 86)',
            green: 'rgb(75, 192, 192)',
            blue: 'rgb(54, 162, 235)',
            purple: 'rgb(153, 102, 255)',
            grey: 'rgb(231,233,237)'
        };

        var color = Chart.helpers.color;
        var horizontalBarChartData = {
            labels: ["Drools v7.0.0.Beta6", "Drools v7.0.0.Final", "Trisotech 5.1.5.1"],
            datasets: [{
                label: 'Succeeded',
                backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
                borderColor: window.chartColors.green,
                borderWidth: 1,
                data: [
                    80,
                    100,
                    100
                ]
            }, {
                label: 'Ignored',
                backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
                borderColor: window.chartColors.orange,
                data: [
                    15,
                    0,
                    0
                ]
            }, {
                label: 'Failed',
                backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                borderColor: window.chartColors.red,
                data: [
                    5,
                    0,
                    0
                ]
            }]
        };
        window.onload = function() {
            var ctx = document.getElementById("chartByVendor").getContext("2d");
            window.myHorizontalBar = new Chart(ctx, {
                type: 'horizontalBar',
                data: horizontalBarChartData,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each horizontal bar to be 2px wide
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    },
                    title: {
                        display: true,
                        text: 'Overview by Vendor'
                    },
                    scales: {
                        xAxes: [{
                            stacked: true,
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    }
                }
            });
        };




        <#list cByLabels as cbl>

        var ${cbl.name}_data = {
            labels: [
                <#list cbl.labels as lbl>"${lbl}"<#if lbl_has_next>,</#if></#list>
            ],
            datasets: [
                <#list cbl.dataset as dp>
                    {
                        label: "${dp.label}",
                        backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
                        borderColor: window.chartColors.green,
                        borderWidth: 1,
                        data: [
                                <#list dp.data as data>${data}<#if data_has_next>,</#if></#list>
                        ]
                    }<#if dp_has_next>,</#if>
                </#list>
            ]
        };
        window.onload = function() {
            var ctx = document.getElementById("${cbl.name}").getContext("2d");
            window.${cbl.name} = new Chart(ctx, {
                type: 'horizontalBar',
                data: ${cbl.name}_data,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each horizontal bar to be 2px wide
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'right',
                    },
                    title: {
                        display: true,
                        text: 'Overview for ${cbl.title}'
                    },
                    scales: {
                        xAxes: [{
                            stacked: true,
                        }],
                        yAxes: [{
                            stacked: true
                        }]
                    }
                }
            });
        };
        </#list>

    </script>

    <div id="container" style="width: 75%;">
        <h3>Tests Overview</h3>
        <canvas id="chartByVendor"></canvas>
        <#list cByLabels as cbl>
        <canvas id="${cbl.name}"></canvas>
        </#list>
    </div>

    <div class="container">
        <h3>Test results by label</h3>
        <p>Results from all the tests sorted by label</p>

        <div class="table-responsive">
            <table class="table table-condensed table-bordered table-striped table-hover">
                <thead>
                <tr class="info">
<#list tByLabels.headers as head>
                    <th> ${head} <br/>
                        <small>${tByLabels.headerDetails[head_index]}</small>
                    </th>
</#list>
                </tr>
                </thead>
                <tbody>
<#list tByLabels.rows as row>
                <tr>
                    <th class="text-nowrap" scope="row"><a href="#lbl${row_index}">${row.text[0]}</a></th>
                    <#list row.icons[1..] as icon>
                    <td align="center"><span class="glyphicon ${icon}" aria-hidden="true"><br/><small>${row.text[1..][icon_index]}</small></span></td>
                    </#list>
                </tr>
</#list>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container">
        <h3>All tests in detail</h3>
        <p>Results from all the tests in the TCK</p>

        <div class="table-responsive">
            <table class="table table-condensed table-bordered table-striped table-hover">
                <thead>
                <tr class="info">
                <#list tAllTests.headers as head>
                    <#if head_index != 1>
                    <th style="vertical-align:middle"> ${head} <br/>
                        <small>${tAllTests.headerDetails[head_index]}</small>
                    </th>
                    </#if>
                </#list>
                </tr>
                </thead>
                <tbody>
                <#list tAllTests.rows as row>
                <tr>
                    <#if row.rowspan[0] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[0]}" style="vertical-align:middle">${row.text[0]}</th>
                    </#if>
                    <#if false && row.rowspan[1] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[1]}" style="vertical-align:middle">${row.text[1]}</th>
                    </#if>
                    <#if row.rowspan[2] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[2]}" style="vertical-align:middle">${row.text[2]}</th>
                    </#if>
                    <th class="text-nowrap" scope="row">${row.text[3]}</th>
                    <#list row.icons[4..] as icon>
                        <td align="center" style="vertical-align:middle"><span class="glyphicon ${icon}" aria-hidden="true"></span></td>
                    </#list>
                </tr>
                </#list>
                <tr class="success">
                    <th colspan="3" style="vertical-align:middle">Total</th>
                    <#list tAllTests.totals as total>
                        <td align="center" style="vertical-align:middle">${total}</td>
                    </#list>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <#list tIndLabels as tlbl>
    <div class="container">
        <h3 id="lbl${tlbl_index}">All tests for label: ${tlbl.title}</h3>

        <div class="table-responsive">
            <table class="table table-condensed table-bordered table-striped table-hover">
                <thead>
                <tr class="info">
                <#list tlbl.headers as head>
                    <#if head_index != 1>
                        <th style="vertical-align:middle"> ${head} <br/>
                            <small>${tlbl.headerDetails[head_index]}</small>
                        </th>
                    </#if>
                </#list>
                </tr>
                </thead>
                <tbody>
                <#list tlbl.rows as row>
                <tr>
                    <#if row.rowspan[0] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[0]}" style="vertical-align:middle">${row.text[0]}</th>
                    </#if>
                    <#if false && row.rowspan[1] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[1]}" style="vertical-align:middle">${row.text[1]}</th>
                    </#if>
                    <#if row.rowspan[2] gt 0 >
                        <th class="text-nowrap" scope="row" rowspan="${row.rowspan[2]}" style="vertical-align:middle">${row.text[2]}</th>
                    </#if>
                    <th class="text-nowrap" scope="row" style="vertical-align:middle">${row.text[3]}</th>
                    <#list row.icons[4..] as icon>
                        <td align="center" style="vertical-align:middle"><span class="glyphicon ${icon}" aria-hidden="true"></span></td>
                    </#list>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    </#list>

</div>
</body>
</html>