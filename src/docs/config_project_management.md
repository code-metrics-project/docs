# Configuration: Project Management

This section is part of the `remote-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Jira

For Jira set the server URL and authentication details, using either:

- The email address that you use to access JIRA and API token that you have generated (`"authType": "BASIC_AUTH"`), or
- The API token that you have generated (`"authType": "BEARER_TOKEN"`).

To call JIRA you'll need to authenticate with either an API token, or a combination of email address and API token. See instructions [here](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).

Add the JIRA token (and email address if used) to your `remote-config.yaml` file configuration within a `projectManagement.jira` server object.
