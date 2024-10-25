# Configuration: Project Management

This section is part of the `remote-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Azure DevOps (ADO)

### Access

> Note the same token value may also be used for retrieving VCS info within the [code management](./config_code_management.md) configuration if required and permission is provided within the token scope.

1. Create an Azure Personal Access Token.  
   To call ADO you'll need to authenticate with a PAT. See instructions [here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page).

2. Paste the result in your respective `remote-config.yaml` file configuration within a `projectManagement.azure` server object's `apiKey` field.

### Defaults

**Bugs**

A list of issue names to match for tickets considered within the instance overall to match to the classification of a 'Bug' or 'Defect' type of ticket (may consider escaped and caught issues in delivery to production).

**Incidents**

A list of issue names to match for tickets considered within the instance overall to match to the classification of an 'Incident' type of ticket (considers escaped tickets delivered to production only).

## Jira

### Access

For Jira set the server URL and authentication details, using either:

-   The email address that you use to access JIRA and API token that you have generated (`"authType": "BASIC_AUTH"`), or
-   The API token that you have generated (`"authType": "BEARER_TOKEN"`).

To call JIRA you'll need to authenticate with either an API token, or a combination of email address and API token. See instructions [here](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).

Add the JIRA token (and email address if used) to your `remote-config.yaml` file configuration within a `projectManagement.jira` server object.

### Defaults

**Bugs**

A list of issue names to match for tickets considered within the instance overall to match to the classification of a 'Bug' or 'Defect' type of ticket (may consider escaped and caught issues in delivery to production).

**Incidents**

A list of issue names to match for tickets considered within the instance overall to match to the classification of an 'Incident' type of ticket (considers escaped tickets delivered to production only).

**Ticket Priorities**

A list of string values to match for priority options available within the JIRA instance for each ticket type.

## ServiceNow

ServiceNow can be used as an issue provider for incidents.

### Access

To call ServiceNow you'll need to authenticate with a REST API key. See instructions [here](https://www.servicenow.com/community/developer-advocate-blog/inbound-rest-api-keys/ba-p/2854924).

The scope required is limited to read-only access to the Table API, specifically the `incident` table.

### Configuration

Configure the `remote-config.yaml` file configuration within a `projectManagement.servicenow` server object:

```yaml
projectManagement:
  servicenow:
    servers:
      - url: "https://<your-instance>.service-now.com"
        authMethod: "BEARER_TOKEN"
        apiKey: ${secret.SERVICENOW_API_KEY}
```

Set the `SERVICENOW_API_KEY` secret in your [secrets configuration](./config_secrets.md).
