# Configuration: CI/CD Pipelines

This section is part of the `remote-config.yaml` configuration file. See the [configuration overview](./configuration.md) for further information.

## Azure DevOps (ADO)

> Note the same token value may also be used for retrieving VCS info within the [code management](./config_code_management.md) configuration if required and permission is provided within the token scope.

Within a `pipelines.azure` server object:

1. Add a unique `id` value for the target server.

2. Add the `url` endpoint of the ADO instance.

3. Create an Azure Personal Access Token.
   To call ADO you'll need to authenticate with a PAT. See instructions [here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page).

4. Add the PAT value to the object's `apiKey` field.

5. Add a list of `branches` you want to have the option to analyse for your projects (TODO: Align with Workloads)

## GitHub

Within a `pipelines.github` server object:

1. Add a unique `id` value for the target server.

2. Create a Personal Access Token.
   Navigate to [https://github.com/settings/tokens](https://github.com/settings/tokens) and create a token with the following scopes:

    - public_repo
    - read:org
    - read:project

3. Paste the result into the server object's `apiKey` field.

4. Add a list of `branches` you want to have the option to analyse for your projects (TODO: Align with Workloads)

```yaml
pipelines:
  github: 
    servers:
      - id: CodeMetrics 
        url: 'https://api.github.com'
        apiKey: ${secret.github_api_key}
        branches:
          - main
```

## Jenkins

Within a `pipelines.jenkins` server object:

1. Add a unique `id` value for the target server.

2. Add url and access credentials to the url field following the basic auth structure:
   https://`user`:`key`@`jenkins.server.url`

3. Add a list of `branches` you want to have the option to analyse for your projects (TODO: Align with Workloads)
