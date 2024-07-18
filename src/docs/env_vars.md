# Environment variables

Some application features are configured using environment variables.

## Configuration variables

| Variable Name              | Description                                                                                       | Default           | Example value                                     |
|----------------------------|---------------------------------------------------------------------------------------------------|:------------------|---------------------------------------------------|
| AEID_CLIENTID              | Azure Entra ID client ID - see [Authentication](./authentication.md)                              |                   | `2222-2222-222-2222`                              |
| AEID_TENANTID              | Azure Entra ID tenant ID - see [Authentication](./authentication.md)                              |                   | `111-1111-1111-1111`                              |
| AEID_SCOPE                 | Azure Entra ID scope - see [Authentication](./authentication.md)                                  |                   | `https://graph.microsoft.com/.default`            |
| API_RETRY_LIMIT            | Number of API retries on error                                                                    | `5`               | `10`                                              |
| ACCESS_TOKEN_SECRET        | Access token secret - see [Authentication](./authentication.md)                                   |                   | `changeme`                                        |
| AUTHENTICATOR_IMPL         | Authentication implementation - see [Authentication](./authentication.md)                         | `file`            | `cognito`                                         |
| AWS_REGION                 | AWS region containing DynamoDB or Secrets Manager                                                 |                   | `eu-west-1`                                       |
| CACHE_PIPELINE_BUILDS      | Whether to cache the pipeline builds from the pipelines provider                                  | `true`            |                                                   |
| CACHE_REPO_LIST            | Whether to cache the repository list from the VCS provider                                        | `true`            |                                                   |
| COGNITO_USER_POOL_ID       | Cognito authenticator settings                                                                    |                   |                                                   |
| COGNITO_CLIENT_ID          | Cognito authenticator settings                                                                    |                   |                                                   |
| CONFIG_DIR                 | Override for *-config.json files                                                                  | Current directory | `/path/to/config/dir`                             |
| CONFIG_AUTO_RELOAD         | Whether to auto-reload config from file - useful for development                                  | `false`           | `true`                                            |
| CONFIG_REFRESH_MS          | Requires `CONFIG_AUTO_RELOAD` - reload frequency in ms                                            | `5000`            | `30000`                                           |
| CORS_ORIGIN                | The CORS origin of the web UI                                                                     |                   | `https://code-metrics.localhost:3001`             |
| COVERAGE_THRESHOLD_DANGER  | Lower coverage threshold                                                                          | `30`              | `40`                                              |
| COVERAGE_THRESHOLD_WARNING | Upper coverage threshold                                                                          | `80`              | `90`                                              |
| DATABASE_NAME              | Prefix for DynamoDB tables or name of MongoDB database                                            |                   | `CodeMetrics`                                     |
| DATASTORE_IMPL             | Datastore implementation (one of: inmem, dynamodb, mongodb) - see [Datastores](./datastores.md)   | `inmem`           | `dynamodb`                                        |
| DATABASE_URI               | MongoDB database URI                                                                              |                   | `mongodb://code-metrics:changeme@localhost:27017` |
| KEYCLOAK_AUTH_METHOD       | Keycloak auth method - currently always `directgrant` - see [Authentication](./authentication.md) |                   |                                                   |
| KEYCLOAK_URI               | Keycloak URI - see [Authentication](./authentication.md)                                          |                   |                                                   |
| KEYCLOAK_REALM             | Keycloak realm - see [Authentication](./authentication.md)                                        |                   |                                                   |
| KEYCLOAK_CLIENT_ID         | Keycloak client ID - see [Authentication](./authentication.md)                                    |                   |                                                   |
| LDAP_ADMIN_AUTH            | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_URI                   | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_BIND_DN               | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_BIND_PASSWORD         | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_USER_SEARCH_BASE      | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_ROOT_DN               | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_USERNAME_ATTRIBUTE    | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LDAP_TLS                   | LDAP authentication configuration - see [Authentication](./authentication.md)                     |                   |                                                   |
| LOG_LEVEL                  | Logging level. Set to 0 (OFF), 1 (DEBUG) or 2 (VERBOSE)                                           | `1`               | `2`                                               |
| LOG_RESPONSE_BODY          | Whether to log response bodies from external API calls                                            | `false`           | `true`                                            |
| LOOKUP_CACHE_ENABLED       | Whether the cache is enabled (requires datastore)                                                 | `false`           | `true`                                            |
| PRECACHE_REPO_LIST         | Whether to pre-cache the repository list from the VCS provider                                    | `true`            | `false`                                           |
| PORT                       | The port the backend listens on                                                                   | `3001`            | `3030`                                            |
| REPO_LIST_EXPIRY_SECONDS   | If `CACHE_REPO_LIST` is enabled - for how long the list is cached                                 | `21600`           | `10800`                                           |
| SECRET_RESOLVER_IMPL       | Secret resolver implementation - see [Secret management](./secret_management.md)                  | `file`            | `file`                                            |

## The `.env` file

As well as setting environment variables in the typical fashion, Code Metrics allows you to use an `.env` file in the working directory for the backend component.

To get started, copy the `.env.template` file and name the copy `.env`.
