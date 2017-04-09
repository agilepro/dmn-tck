<#-- @ftlvariable name="vendor" type="org.omg.dmn.tck.Vendor" -->
<#-- @ftlvariable name="cbl" type="org.omg.dmn.tck.ReportChart" -->
<#-- @ftlvariable name="header" type="org.omg.dmn.tck.ReportHeader" -->
<#-- @ftlvariable name="tByLabels" type="org.omg.dmn.tck.ReportTable" -->
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <!-- PatternFly Styles -->
    <link href="bower_components/patternfly/dist/css/patternfly.min.css" rel="stylesheet" media="screen, print">
    <link href="bower_components/patternfly/dist/css/patternfly-additions.min.css" rel="stylesheet" media="screen, print">
    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- PatternFly -->
    <script src="bower_components/patternfly/dist/js/patternfly.min.js"></script>
    <!-- c3 -->
    <script src="bower_components/c3/c3.min.js"></script>
    <!-- c3 -->
    <script src="bower_components/d3/d3.min.js"></script>
    <!-- jquery max height -->
    <script src="bower_components/matchHeight/dist/jquery.matchHeight-min.js"></script>

    <!-- site libs -->
    <script src="js/lib.js"></script>
    <link href="css/lib.css" rel="stylesheet" media="screen, print">

    <!-- chart js -->
    <title>DMN TCK results overview for ${vendor.name} ${vendor.version}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="header">
        <nav class="navbar navbar-default navbar-pf" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">
                    <img src="images/logo.png" alt="PatternFly Enterprise Application"/>
                </a>
            </div>
            <div class="collapse navbar-collapse navbar-collapse-1">

                <ul class="nav navbar-nav navbar-primary">
                    <li class="active">
                        <a href="index.html">Submitters</a>
                    </li>
                    <li>
                        <a href="glossary.html">Glossary</a>
                    </li>
                    <li>
                        <a href="tests.html">Tests</a>
                    </li>

                </ul>
            </div>
        </nav>
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li>
                    <a href="index.html">Home</a>
                </li>
                <li class="active"><strong>${vendor.product} ${vendor.version}</strong></li>
            </ol>
        </div>
    </div>
    <div class="content">
        <div class="container">
            <div class="report-header ">
                <div class="row">
                    <div class="col-md-12">
                        <h1>DMN TCK Results Overview for ${vendor.product} ${vendor.version}</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <small>
                            <p><strong>Date:</strong> ${.now?date}</p>
                        </small>
                    </div>
                    <div class="col-md-2">
                        <small>
                            <p><strong>Tests:</strong> ${header.totalTests}</p>
                        </small>
                    </div>
                    <div class="col-md-2">
                        <small>
                            <p><strong>Labels:</strong> ${header.totalLabels}</p>
                        </small>
                    </div>
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
                var ${cbl.name}_data = {
                    labels: [
                        <#list cbl.labels as lbl>"${lbl}"<#if lbl_has_next>,</#if></#list>
                    ],
                    datasets: [
                        {
                            label: "Succeeded",
                            backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
                            borderColor: window.chartColors.green,
                            borderWidth: 1,
                            data: [
                            <#list cbl.dataset as dp>
                                ${dp.data[0]}<#if dp_has_next>,</#if>
                            </#list>
                            ]
                        },
                        {
                            label: "Skipped",
                            backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
                            borderColor: window.chartColors.yellow,
                            borderWidth: 1,
                            data: [
                                <#list cbl.dataset as dp>
                                ${dp.data[1]}<#if dp_has_next>,</#if>
                                </#list>
                            ]
                        },
                        {
                            label: "Failed",
                            backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                            borderColor: window.chartColors.red,
                            borderWidth: 1,
                            data: [
                                <#list cbl.dataset as dp>
                                ${dp.data[2]}<#if dp_has_next>,</#if>
                                </#list>
                            ]
                        }
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

            </script>

            <div id="container" style="width: 100%;">
                <h3>Tests Overview</h3>
                <canvas id="${cbl.name}"></canvas>
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
                            <th class="text-nowrap text-small" scope="row"><a onclick="labelDetail('detail_${vendor.fileNameId}.html', 'tb${row_index}','${row.text[0]}')">${row.text[0]}</a></th>
                            <td align="center">
                                <span class="glyphicon ${row.icons[1]}" aria-hidden="true"><br/><small>${row.text[1]}</small></span>
                            </td>
                        </tr>
        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
            <blockquote>
                <p><small><em><strong>DISCLAIMER:</strong> This report is automatically generated from the results
                    of the TCK tests execution provided by each vendor. The accuracy of
                    the results is under the responsibility of the respective vendors.</em></small></p>
            </blockquote>
        </div>
    </div>

    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel-heading">
                        <h3 class="panel-title">The DMN TCK is supported by:</h3>
                    </div>
                    <div class="panel-body">
                        <div style="display: flex; justify-content: space-around; flex-wrap: wrap;">
                            <div style="display:inline-block; margin-top:10px;">
                                <a href="http://www.redhat.com" target="_newtab">
                                    <img alt="redhat" class="img-thumbnail" src="images/redhat3.png" style="height: 60px"/>
                                </a>
                            </div>
                            <div style="display:inline-block; margin-top:10px;">
                                <a href="http://http://methodandstyle.com/" target="_newtab">
                                    <img alt="methodandstyle" class="img-thumbnail" src="images/MSlogo4x.jpg" style="height: 60px"/>
                                </a>
                            </div>
                            <div style="display:inline-block; margin-top:10px;">
                                <a href="http://www.trisotech.com" target="_newtab">
                                    <img alt="trisotech" class="img-thumbnail" src="images/trisotech3.jpg" style="height: 60px"/>
                                </a>
                            </div>
                            <div style="display:inline-block; margin-top:10px;">
                                <a href="http://www.camunda.com" target="_newtab">
                                    <img alt="camunda" class="img-thumbnail" src="images/camunda_logo.png" style="height: 60px"/>
                                </a>
                            </div>
                            <div style="display:inline-block; margin-top:10px;">
                                <a href="http://openrules.com/" target="_newtab">
                                    <img alt="openrules" class="img-thumbnail" src="images/openruleslogo.jpg" style="height: 60px"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->

</div>
</body>
</html>