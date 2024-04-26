# Configuration: Workloads

This section describes the `workload-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Overview

A workload represents one or more repositories, in one or more repository groups. With this concept, you can model a team, an application or a single component.

> **Note**
> See the [workload concept](./workloads.md) section.

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
        components:
          - repo: example-api
          - repo: another-api
      frontend:
        components:
          - repo: customer-web
          - repo: admin-web
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
        components:
          - repo: "/.*-api/"
      # match all repositories that end in '-web' using a regular expression
      frontend:
        components:
          - repo: "/.*-web/"
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
        components:
          - repo: accounts-web
          - repo: accounts-api
          - repo: accounts-infra
      sales-app:
        components:
          - repo: sales-portal
          - repo: sales-api
          - repo: sales-platform
  codeAnalysis:
    type: sonar
    serverId: example-sonar
  projectManagement:
    type: jira
    serverId: example-jira
    project: HER
```

## Repository and Sonar mappings

When Code Metrics looks up quality metrics about a repository, the query to Sonar uses the repository name as the component ‘key’ parameter.

It is possible to specify a different key for a given repository using the `repoMappings` section of the workload configuration file.

```yaml
repoMappings:
  - sonarProjectKey: petclinic
    vcsRepoName: spring-petclinic
```

In this example, the Code Metrics would use the Sonar component key `petclinic` for the repository named `spring-petclinic`. 
