<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <title><#if (content.title)??><#escape x as x?xml>${content.title}</#escape><#else>Research</#if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="generator" content="JBake">

    <!-- Le styles -->
    <link href="${config.site_host}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${config.site_host}/css/asciidoctor.css" rel="stylesheet">
    <link href="${config.site_host}/css/base.css" rel="stylesheet">
    <link href="${config.site_host}/css/prettify.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="${config.site_host}/js/html5shiv.min.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
    <link rel="shortcut icon" href="${config.site_host}/favicon.ico">

    <!-- Search styles -->
    <style>
      .search-container {
        position: relative;
      }
      .navbar-form {
        margin: 8px 0;
        padding: 0;
      }
      .search-container .input-group {
        max-width: 250px;
      }
      .search-container .form-control {
        border-radius: 4px 0 0 4px;
      }
      .search-container .input-group-addon {
        border-radius: 0 4px 4px 0;
        cursor: pointer;
        background: #eee;
      }
      .search-results-dropdown {
        display: none;
        position: absolute;
        top: 100%;
        right: 0;
        width: 400px;
        max-height: 500px;
        overflow-y: auto;
        background: white;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        z-index: 1000;
        margin-top: 2px;
      }
      .search-results-dropdown.show {
        display: block;
      }
      .search-result-item {
        padding: 10px 15px;
        border-bottom: 1px solid #eee;
        cursor: pointer;
      }
      .search-result-item:last-child {
        border-bottom: none;
      }
      .search-result-item:hover,
      .search-result-item.focused {
        background-color: #f5f5f5;
      }
      .search-result-link {
        text-decoration: none;
        color: inherit;
        display: block;
      }
      .search-result-title {
        font-weight: 600;
        color: #333;
        margin-bottom: 4px;
      }
      .search-result-summary {
        font-size: 0.9em;
        color: #666;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .search-result-tags {
        font-size: 0.8em;
        color: #999;
        margin-top: 4px;
      }
      .search-result-title mark,
      .search-result-summary mark {
        background-color: #fff3cd;
        padding: 0 2px;
        border-radius: 2px;
      }
      .search-no-results,
      .search-error {
        padding: 15px;
        color: #666;
        text-align: center;
      }
      .search-error {
        color: #a94442;
      }
      @media (max-width: 768px) {
        .search-results-dropdown {
          width: 100%;
          left: 0;
        }
        .search-container .input-group {
          max-width: 180px;
        }
      }
    </style>
  </head>
  <body onload="prettyPrint()">
    <div id="wrap">
   