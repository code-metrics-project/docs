# Configuration: Code Quality

This section is part of the `remote-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Sonar

For Sonar, use the SonarQube server URL and token with api permissions generated from the instance.

1. Using a user with appropriate instance permissions, create an access token within Administration > Users. It is recommended a service user is created for this integration. [Further instructions](https://docs.sonarqube.org/latest/user-guide/user-token/).

2. Paste the result in your respective `remote-config.yaml` file configuration within a `codeAnalysis.sonar` server object's `apiKey` field.

### Component name prefix

In some environments, it may be required to prepend a string to component names when querying Sonar. For example, if your repository names are 'frontend' and 'backend' but your Sonar components are named 'projname_frontend' and 'projname_backend', you can set a `componentKeyPrefix` key in the `remote-config.yaml` for a given Sonar server.
