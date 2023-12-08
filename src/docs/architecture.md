# Architecture

## High level architecture

The tool integrates metrics from your ALM tooling (e.g. Jira), version control system, and code quality tooling (SonarQube).

![High level architecture](./architecture.png)

## Technology overview

The key technologies are Node.js/Express for the API server and Vue.js for the UI. TypeScript is the primary language. Some of the analyses use a backing store (MongoDB is a common choice, but by no means the only possibility).

The tool interacts with ALM tooling (Jira), Code quality tools (Sonar) and source control platforms (ADO/Bitbucket/GitHub). These sources provide the raw data for display or subsequent combined analysis.

Configuration is done via file and/or environment variables. These provide the details to interact securely with Sonar, Jira, source repository etc. Rules and thresholds are configurable.

Packaging is via Docker containers (`node:lts` for the API server and `nginx` for static hosting of the UI). Deployment is to anywhere Docker runs, or Node.js if desired.

## Components

See components:

- [backend](../backend)
- [ui](../ui)

## Repository groups

Queries use the concept of 'repository groups' (repoGroups).

Example repo groups:

- backend
- frontend
- mobile
- platform

Repo groups can be defined by either a set of SonarQube tags, or a set of regexes that match repository names.

When provided to an API that supports them, repo groups are resolved to a list of repository names. This is done via the sonar tag lookup mechanism, or by matching repository names to specified regexes defined in [workload configuration](./configuration.md).
