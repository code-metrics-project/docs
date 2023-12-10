# Workloads

This section describes the `workload-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Overview

A workload represents one or more repositories, in one or more repository groups. With this concept, you can model a team, an application or a single component.

## Examples

### Grouping by layer

Here is how you might model a team with frontend and backend repositories:

```yaml
# a team with 'frontend' and 'backend' repositories

workloads:
- id: team-athena
  codeManagement:
    type: github
    serverId: example-github
    projectName: athena
    repoGroups:
      backend:
        repoNames:
          - example-api
          - another-api
      frontend:
        repoNames:
          - customer-web
          - admin-web
  codeAnalysis:
    type: sonar
    serverId: example-sonar
  projectManagement:
    type: jira
    serverId: example-jira
    project: ATH
```

> **Note**
> Repository group names, such as `backend` are arbitrary. You can name these groups whatever you like.

Here is how you might recreate the previous configuration, by using regular expressions to match repository names:

```yaml
# a team with 'frontend' and 'backend' repositories, matched using regular expressions

workloads:
- id: team-athena
  codeManagement:
    type: github
    serverId: example-github
    projectName: athena
    repoGroups:
      # match all repositories that end in '-api' using a regular expression
      backend:
        repoNames:
          - /.*-api/
      # match all repositories that end in '-web' using a regular expression
      frontend:
        repoNames:
          - /.*-web/
  codeAnalysis:
    type: sonar
    serverId: example-sonar
  projectManagement:
    type: jira
    serverId: example-jira
    project: ATH
```

Here is how you might recreate the previous configuration, by using Sonar tags to look up repository names:

```yaml
# a team with 'frontend' and 'backend' repositories, looked up via tags in Sonar

workloads:
- id: team-athena
  codeManagement:
    type: github
    serverId: example-github
    projectName: athena
    repoGroups:
      # determine the backend repos based on their tags in Sonar
      backend:
        sonarTags:
          - "be"
      # determine the frontend repos based on their tags in Sonar
      frontend:
        sonarTags:
          - "fe"
  codeAnalysis:
    type: sonar
    serverId: example-sonar
  projectManagement:
    type: jira
    serverId: example-jira
    project: ATH
```

### Grouping by application

Here is how you might model a team with multiple applications:

```yaml
# a team with multiple applications

workloads:
- id: team-hera
  codeManagement:
    type: github
    serverId: example-github
    projectName: hera
    repoGroups:
      account-app:
        repoNames:
          - accounts-web
          - accounts-api
          - accounts-infra
      sales-app:
        repoNames:
          - sales-portal
          - sales-api
          - sales-platform
  codeAnalysis:
    type: sonar
    serverId: example-sonar
  projectManagement:
    type: jira
    serverId: example-jira
    project: HER
```

## Workload summary

Each workload has a summary page, showing recent trends.

It provides a view of:

- all bugs
- test coverage
- pipeline success rate

![Summary of workload](./img/workload_dashboard.png)

You can also view a list of all workloads:

![List workloads](./img/workloads_list.png)
