title=Byzer
tags=language, low-code, storage
summary=A low-code open-source programming language for data pipeline, analytics and AI.
~~~~~~

[Website](https://www.byzer.org/home) | [Source](https://github.com/byzer-org/byzer-lang) | [Docs](https://docs.byzer.org/#/)

## Examples
Process Github API as a table to get the information of Byzer Org
```
-- Get Github Organization Info

-- set API URL and params
SET org_name="byzer-org";
SET GITHUB_ORGANIZATION_URL="https://api.github.com/orgs/${org_name}";

-- Load Github Organization API as table
LOAD Rest.`$GITHUB_ORGANIZATION_URL` 
 where `config.connect-timeout`="10s"
 and `config.method`="GET"
 and `header.accept`="application/vnd.github.v3+json"
as github_org;


-- decode API response from binary to a json string
select string(content) as content from github_org as response_content;

-- expand the json string 
run response_content as JsonExpandExt.`` where inputCol="content" and structColumn="true" as github_org;

-- retrieve user infomation and process as a table
select content.* from github_org as org_info;

-- save the table to delta lake
save overwrite org_info as delta.`github_info_db.byzer_org`;
```