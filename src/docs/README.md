# <img alt="Code Metrics logo" src="img/codemetrics_logo_small.png" width="384em"/>

As your codebase grows, so does the complexity of managing it. As an engineering leader overseeing many code repositories or multiple product teams it is challenging to know where to focus attention. At scale, it is especially hard to spot bad trends before they manifest as risks and identify areas for improvement.

## Problems at scale

Managing a large technical solution requires metrics from across the phases of the delivery lifecycle. Meaningful understanding of the quality and risk in your codebase includes metrics about your source code, your CI/CD pipeline and your delivery process and service (such as pull requests and bugs).

In most organisations, this poses common problems:

- Metrics sit across separate systems: your Code quality tool (Sonar), project management tool (Jira or Azure), and source hosting platform (GitHub, Bitbucket or Azure).
- You need to correlate the data from across sources to help identify issues or trends that are difficult to spot on a per-tool, or per-repository basis.
- There is no easy mechanism to aggregate and query this data for technical leadership.

## How Code Metrics helps

Code Metrics is a tool that aggregates and analyses engineering data across a large and distributed codebase. It provides engineering leaders with visibility of software health across teams and is used on top of existing software engineering tools.

At its core, Code Metrics provides a collection of whole project lifecycle code quality analysis tools. It enables you to combine sources to look for correlations, to answer questions over time such as:

- the bug to change ratio (related to change failure rate),
- which files are frequently implicated when bugs are fixed,
- how test coverage correlates to incidents,
- how complexity is changing with codebase size,
- how long pull requests take to review and merge,
- how much churn has there been in the codebase and
- custom combinations you create.

## Learn

- [Getting started](./getting_started.md)
- [Configuration guide](./configuration.md)

### Queries

- [Overview](./queries.md)
- [Build and deployment pipelines](./query_pipelines.md)
- [Repository churn](./query_repo_churn.md)
- [Bug culprit files](./query_bug_culprits.md)
- [Bugs and escaped bugs](./query_bugs.md)
- [Custom queries](./custom_queries.md)

### Configuration

- [Configuration guide](./configuration.md)
- [Datastores](./datastores.md)
- [Workloads](./workloads.md)
- [Secrets management](./secret_management.md)
- [Authentication](./authentication.md)

## Other

- [Architecture](./architecture.md)

## Design and build

- [Release process](./release.md)
- [Mocks](../backend/mocks/README.md)

## Feature support

See a list of [supported features](./features.md) for third party tools.
