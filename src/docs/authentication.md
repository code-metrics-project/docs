# User authentication

To use Code Metrics users require authentication. You configure how users authenticate using one of the supported authentication providers:

| Name         | Details                                                                                                                                         |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| file         | User configuration is represented as password hashes and usernames in a file named `users.json`.                                                |
| azureEntraId | Authenticate against Azure Entra ID using RPOC                                                                                                  |
| cognito      | AWS Cognito user store. This authenticator implementation holds items in an external Cognito instance. It requires appropriate AWS credentials. |
| ldap         | User is verified against LDAP/AD                                                                                                                |
| KeyCloak     | Direct Grant Keycloak Authetication                                                                                                             |

## Setting the authenticator implementation

Set the authenticator implementation to use with the `AUTHENTICATOR_IMPL` environment variable.

> For example:
>
> ```
> AUTHENTICATOR_IMPL=file
> ```

## Configuring the `ACCESS_TOKEN_SECRET`

Once a user has authenticated with one of the providers, Code Metrics issues them a time-limited token. This token is used by the user's browser when calling the Code Metrics backend APIs.

The token is generated based on an secret - the `ACCESS_TOKEN_SECRET`. This value is sensitive and should be protected, as it is used by the backend to determine whether to trust a token presented by the user's browser.

You can set the `ACCESS_TOKEN_SECRET` environment variable to any string.

> **Important**
> You must ensure that all instances of the backend (e.g. all container instances, or all Lambda instances) share the same value for the `ACCESS_TOKEN_SECRET`, so that they can validate the token issued to the user.

---

## Authentication providers

This section lists the supported authentication providers.

### File-based authenticator (default)

Set the environment variable:

```
AUTHENTICATOR_IMPL=file
```

This authenticator reads a file named `users.json` in your config directory.

The file is a simple key/value map.

```json
[
  {
    "name": "admin",
    "password": "1253509b718dbbeafa4e028afc9a5f667fe17881fdd222e31559ae452029c3a0fe24075565673a9d9ccfd4564bf1a2b9374243ee19b9846256a9b0e260ea0bc0",
    "salt": "0c62b823eb5b9699ff48c1d0c93816d0"
  }
]
```

Copy the example file `users.json.example` to get started.

#### The `userconfig` tool

You can generate entries for the `users.json` using the `userconfig` tool under `backend/tools`.

<details>
<summary>Usage instructions for `userconfig` tool</summary>

Usage:

```
npm run start -- --username <username> --salt <salt>
```

> Note the double dash (`--`) before the arguments when running using `npm`.

If a username and salt are provided, the tool prompts for a password:

```shell
$ npm run start -- -u jane -s somesaltvalue

Set password for jane:
```

Once you type the password, the configuration is generated as follows:

```json
{
  "name": "jane",
  "password": "0f7dee0b90c2e0c1342393153b319d79c421da0ec10248b90a24ea7b78265dc4480d0434fecd3d3b75e7ab7ad221a1f15290ba8b76cd3385ad28e847ecec69ac",
  "salt": "somesaltvalue"
}
```
</details>

### AWS Cognito authenticator

Set the environment variable:

```
AUTHENTICATOR_IMPL=cognito
```

This authenticator queries an [AWS Cognito UserPool](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html).

To use this authenticator:

1. Ensure the Code Metrics backend has the necessary AWS permissions (e.g. using IAM or AWS configuration files) to access the user pool.
2. Create a Cognito Client ID for Code Metrics to use.
3. Create users in the user pool (outside the scope of this documentation).

Configure the user pool and client ID using the following environment variables:

```
COGNITO_CLIENT_ID=ExampleCognitoClientId
COGNITO_USER_POOL_ID=ExampleCognitoUserPoolId
```

#### Architectural overview

```mermaid
    C4Deployment
    title Deployment Diagram for Code Metrics Cognito authenticator

    Deployment_Node(aws, "AWS account", "") {
        Deployment_Node(dn, "API backend", "Node.js") {
            Container(api, "API application", "", "Provides Code Metrics functionality to the frontend.")
        }
        Deployment_Node(cognito, "User store", "AWS Cognito") {
            Deployment_Node(pool, "User Pool", "AWS Cognito"){
                ContainerDb(users, "User accounts", "User Pool", "Holds user accounts.")
            }
        }
    }

    Rel(api, users, "Queries", "Cognito API")

    UpdateRelStyle(api, users, $offsetX="20", $offsetY="-40")
```

### Azure Entra ID (Formerly AzureAD)

Currently only:  OAuth 2.0 Resource Owner Password Credentials (ROPC) is supported.

Set the environment variable:

```
AUTHENTICATOR_IMPL=azureEntraId
```

Then configure the following Env Vars as needed

Set the following Env Vars:
```
AEID_TENANTID='111-1111-1111-1111'
AEID_CLIENTID='2222-2222-222-2222'
AEID_SCOPES='https://graph.microsoft.com/.default'
```

#### Azure Application Setup
 * Create users in [Azure Entra ID](https://portal.azure.com/?quickstart=true#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Overview)
 * [Register your App](https://portal.azure.com/?quickstart=true#view/Microsoft_AAD_RegisteredApps/CreateApplicationBlade/isMSAApp~/false)
 * Enter the App in Azure, then Click authentication on the left -> Supported account types -> Select: 	`Accounts in any organizational directory (Any Microsoft Entra ID tenant - Multitenant)`
 * Enter the App in Azure, then Click authentication on the left, then at the bottom, Advanced settings -> Allow public client flows -> Enable the following mobile and desktop flows: `YES`
 * Enter the App in Azure, then Click Api Permissions on the left, then `Grant admin consent for default directory`

Username is the user's principal name in Entra ID (Which may or may not be their email address)


### LDAP authenticator
Set the environment variable:

```
AUTHENTICATOR_IMPL=ldap
```

There are two supported methods of LDAP authentication:
1. Bind with Admin Account, search for user and if found attempt to bind as user
2. Attempt to bind with specified user account

Then configure the following Env Vars as needed

Set the following Env Vars for BOTH Methods:
```
LDAP_URI='ldap://localhost:1389'
LDAP_USER_SEARCH_BASE='ou=users,dc=example,dc=org'
LDAP_ROOT_DN='dc=example,dc=org'
LDAP_USERNAME_ATTRIBUTE='uid'
LDAP_TLS=false
```

To use method 1 (admin bind)
```
LDAP_ADMIN_AUTH=true
LDAP_BIND_DN='cn=admin,dc=example,dc=org'
LDAP_BIND_PASSWORD='admin'
```

To use method 2 (user bind)
```
LDAP_ADMIN_AUTH=false
```

### [KeyCloak](https://www.keycloak.org/)

Set the environment variable:

```
AUTHENTICATOR_IMPL=keycloak
```

This authenticator queries the specified Keycloak instance to authenticate the user.

Set the following Env Vars:
```
KEYCLOAK_URI='http://127.0.0.1:8086';
KEYCLOAK_REALM='CodeMetrics';
KEYCLOAK_CLIENT_ID='codemetrics';
```

Keycloak Realm/Client should be configured to have `Direct access grants` enabled for this to work.
