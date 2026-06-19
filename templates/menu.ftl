	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${config.site_host}/">Home</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <#list categorypages?sort_by("title") as page>
                <li><a href="${config.site_host}/${page.uri}" target="_blank">${page.title}</a></li>
                </#list>
              </ul>
            </li>
            <li><a href="${config.site_host}/all/">All Pages</a></li>
            <li><a href="${config.site_host}/tags">All Tags</a></li>
            <li><a href="${config.site_host}/${config.feed_file}">Subscribe (RSS)</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="search-container">
              <form class="navbar-form" role="search" onsubmit="return false;">
                <div class="input-group">
                  <input type="text" id="search-input" class="form-control" placeholder="Local Search..." autocomplete="off">
                  <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                </div>
              </form>
              <div id="search-results" class="search-results-dropdown"></div>
            </li>
            <!-- Use a localized Google search: pass "site:research.tedneward.org {search}" to Google -->
            <!-- 
            <li class="search-container">
              <form class="navbar-form" role="search" onsubmit="return false;">
                <div class="input-group">
                  <input type="text" id="google-search-input" class="form-control" placeholder="Google Search..." autocomplete="off">
                  <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                </div>
              </form>
            </li>
            -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    <div class="container">