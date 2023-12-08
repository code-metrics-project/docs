# Configuration

System configuration is defined via a combination of config files and environment variables.

These files model how your teams are organised (including rules and thresholds), and contain details to interact securely with the required data sources for Code Quality (e.g. SonarQube), Project Management (e.g. Jira) and Code Management (e.g. ADO).

> ### File format
> Configuration files can be in JSON or YAML format. For example, `remote-config.yaml`, or `remote-config.yml` or `remote-config.json`.
> In this section we refer to the YAML filenames, but the same structure applies to JSON format files in line with its syntax.

## Remote Systems (remote-config.yaml)

Integration configuration with the various third party systems is defined in a file named `remote-config.yaml`. This file is structured by domain for each of the data sources.

Copy the file `remote-config.yaml.example` and name it `remote-config.yaml`, then update each application type relevant for your team's tooling setup.

> The path to the directory containing this file is set by the environment variable `CONFIG_DIR`. It defaults to the directory containing the `backend` component, such as `/backend` in the Docker container. [See below](#application-runtime).

Integrated applications currently supported or planned for future roadmap support include:

**ALM / Project Management**
- JIRA (Supported)
- Azure DevOps (Roadmap)

**Code Quality**
- SonarQube (Supported)

**Code Management**
- [Azure DevOps](#azure-devops-ado) (Supported)
- Bitbucket (Roadmap)
- GitHub (Planned)
- GitLab (Roadmap)


### Code Management
#### Azure DevOps (ADO)

1. Create an Azure Personal Access Token.  
   To call ADO you'll need to authenticate with a PAT. See instructions [here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page).  

2. Paste the result in your respective `remote-config.yaml` file configuration within a `codeManagement.azure` server object's `apiKey` field.

#### GitHub

1. Create a Personal Access Token.
   Navigate to [https://github.com/settings/tokens](https://github.com/settings/tokens) and create a token with the following scopes:
   - public_repo
   - read:org
   - read:project
   - repo:status

2. Paste the result in your respective `remote-config.json` file configuration within a `codeManagement.github` server object's `apiKey` field.

### Code Quality
#### Sonar

For Sonar, use the SonarQube server URL and token with api permissions generated from the instance.

1. Using a user with appropriate instance permissions, create an access token within Administration > Users. It is recommended a service user is created for this integration. [Further instructions](https://docs.sonarqube.org/latest/user-guide/user-token/).

2. Paste the result in your respective `remote-config.yaml` file configuration within a `codeAnalysis.sonar` server object's `apiKey` field.  

##### Component name prefix
In some environments, it may be required to prepend a string to component names when querying Sonar. For example, if your repository names are 'frontend' and 'backend' but your Sonar components are named 'projname_frontend' and 'projname_backend', you can set a `componentKeyPrefix` key in the `remote-config.yaml` for a given Sonar server.

### Project Management

#### Jira

For Jira set the server URL and authentication details, using either:

- The email address that you use to access JIRA and API token that you have generated (`"authType": "BASIC_AUTH"`), or
- The API token that you have generated (`"authType": "BEARER_TOKEN"`).

To call JIRA you'll need to authenticate with either an API token, or a combination of email address and API token. See instructions [here](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).  

Add the JIRA token (and email address if used) to your `remote-config.yaml` file configuration within a `projectManagement.jira` server object.

## Workload Teams & Projects (workload-config.yaml)

Workload configuration is held in a file named `workload-config.yaml`.

> The path to the directory containing this file is set by the environment variable `CONFIG_DIR`. It defaults to the directory containing the `backend` component, such as `/backend` in the Docker container.

To configure your workloads, copy the file `workload-config.yaml.example` and name it `workload-config.yaml`.

This file contains the structure and hooks used to organise and map the data produced within the remote systems to each team. The information gathered can be aggregated and filtered based on the options provided, [see more about features within the other docs](./README.md#learn). 

## User authentication

See the [user authentication](./authentication.md) section.

## Custom queries

You can define custom queries using a JSON file. See [custom queries](custom_queries.md) for details.

## Application Runtime

A number of runtime application features are configurable via use of the application environment variables `.env` file in the working directory. Do this by copying the file `.env.template` and name the copy `.env`.

Hopefully these are fairly self-explanatory from the variable names provided, with scope of the current settings (non-exhaustive):

- Configuration (To define file location & Auto-Reload options) 
- CORS
- Data Caching, see [datastores](./datastores.md)
- Logging (Levels, Response Output)
- System Login (Setting the application `admin` root user login, also see [users](#user-authentication))
