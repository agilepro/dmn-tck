<#-- @ftlvariable name="vendors" type="java.util.Map<String,Vendor>" -->
<!DOCTYPE html>
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
    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js"></script>

    <!-- site libs -->
    <script src="js/index.js"></script>
    <link href="css/lib.css" rel="stylesheet" media="screen, print">

    <!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
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
                <li class="active"><strong>Home</strong></li>
            </ol>
        </div>
    </div>
    <div class="content">
        <div class="container-fluid">

            <div class="list-group list-view-pf list-view-pf-view">

            <#list vendors?values as vendor>
                <!-- ${vendor.product} ${vendor.version} -->
                <div class="list-group-item">
                    <div class="list-group-item-header">
                        <div class="list-view-pf-actions">
                            <a href="overview_${vendor.fileNameId}.html" class="btn btn-default">Details</a>
                            <!--div class="dropdown pull-right dropdown-kebab-pf">
                                <button class="btn btn-link dropdown-toggle" type="button" id="dropdownKebabRight${vendor_index}" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="true">
                                    <span class="fa fa-ellipsis-v"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownKebabRight${vendor_index}">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div-->
                        </div>
                        <div class="list-view-pf-main-info">
                            <div class="list-view-pf-left">
                                <span class="fa fa-university list-view-pf-icon-sm"></span>
                            </div>
                            <div class="list-view-pf-body">
                                <div class="list-view-pf-description">
                                    <div class="list-group-item-heading">
                                        ${vendor.name}
                                    </div>
                                    <div class="list-group-item-text">
                                        ${vendor.product} ${vendor.version}
                                    </div>
                                </div>
                                <div class="list-view-pf-additional-info">
                                    <div class="list-view-pf-additional-info-item">
                                        Last Submission: <b>${.now?date}</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item-container container-fluid hidden">
                        <div class="close">
                            <span class="pficon pficon-close"></span>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                                <img src="images/60.png" alt="Submitted tests"/>
                            </div>

                            <div class="col-md-9">
                                <dl class="dl-horizontal">
                                    <dt>Last Submission: </dt>
                                    <dd>${.now?date}</dd>
                                    <dt>Tests: </dt>
                                    <dd>52</dd>
                                    <dt>Labels: </dt>
                                    <dd>25</dd>
                                    <dt>Info: </dt>
                                    <dd>${vendor.comment}</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
            </div>
        </div>
    </div>

    <#include "footer.ftl">
</div>
<!--wrapper -->

</body>
</html>