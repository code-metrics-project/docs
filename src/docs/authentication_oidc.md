# OpenID Connect (OIDC) Authentication

## Introduction

CodeMetrics supports [OpenID Connect (OIDC)](https://openid.net/developers/how-connect-works/) for user authentication. This allows you to use OIDC providers such as Google, Microsoft, or GitHub to authenticate users.

This is a front-end authentication flow, where the user is redirected to an OIDC provider to authenticate.

## Setting the authenticator implementation

Set the authenticator implementation to use with the `AUTHENTICATOR_IMPL` environment variable.

```
AUTHENTICATOR_IMPL=oidc
```

Set the `UI_BASE_URL` environment variable to the base URL for the UI. This is used to compute the value of the `redirect_uri`, in the form: `<UI_BASE_URL>/oidc/callback`.

```
UI_BASE_URL=https://example.com
```

## Configuration

The following environment variables are used to configure the OIDC authenticator:

| Variable             | Purpose                                                                                                                                         | Default                                                                 | Example                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| OIDC_ISSUER_BASE_URL | The base URL for the OIDC server. This should be the base from which the discovery endpoint (`/.well-known/openid-configuration`) can be found. |                                                                         | `https://accounts.google.com`                                               |
| OIDC_CLIENT_ID       | The client ID.                                                                                                                                  |                                                                         | `000000000000-a1b2c3d4e5f6g7h8i9j10k11l12m13n14.apps.googleusercontent.com` |
| OIDC_CLIENT_SECRET   | The client secret.                                                                                                                              |                                                                         | `ABCDEF-ab12cd_aBcDeF12gH34-aB`                                             |
| OIDC_USER_CLAIM      | The name of ID token claim containing the user email address.                                                                                   | `sub`                                                                   | `sub` or `email`                                                            |
| OIDC_SCOPES          | The required scopes.                                                                                                                            | `openid email`                                                          | `openid email`                                                              |
| OIDC_AUDIENCE        | Optional - the desired value of the audience claim.                                                                                             |                                                                         | `000000000000-a1b2c3d4e5f6g7h8i9j10k11l12m13n14.apps.googleusercontent.com` |

---

## OIDC provider examples

Code Metrics supports any OIDC provider.

This section provides examples of how to configure Code Metrics to use specific OIDC providers.

### Google

To configure Code Metrics to use Google as an OIDC provider:

1. Create a new project in the [Google Cloud Console](https://console.cloud.google.com/).
2. Enable the Google Identity Platform API.
3. Create OAuth 2.0 credentials. Set the permitted redirect URI to `<UI_BASE_URL>/oidc/callback`.
4. Set the `OIDC_ISSUER_BASE_URL` environment variable to `https://accounts.google.com`.
5. Set the `OIDC_CLIENT_ID` and `OIDC_CLIENT_SECRET` environment variables to the client ID and client secret from the OAuth 2.0 credentials.
6. Set the `OIDC_SCOPES` environment variable to `openid email`.
7. Set the `OIDC_USER_CLAIM` environment variable to `email`.
8. (Optional) Set the `OIDC_AUDIENCE` environment variable to your client ID.

Example:

```shell
AUTHENTICATOR_IMPL=oidc
OIDC_ISSUER_BASE_URL=https://accounts.google.com
OIDC_CLIENT_ID=000000000000-a1b2c3d4e5f6g7h8i9j10k11l12m13n14.apps.googleusercontent.com
OIDC_CLIENT_SECRET=ABCDEF-ab12cd_aBcDeF12gH34-aB
OIDC_USER_CLAIM=email
OIDC_SCOPES=openid email
OIDC_AUDIENCE=000000000000-a1b2c3d4e5f6g7h8i9j10k11l12m13n14.apps.googleusercontent.com
UI_BASE_URL=https://example.com
```

---

### Keycloak

The following example is for Keycloak.

Set the following environment variable to use the OIDC authenticator:

```
AUTHENTICATOR_IMPL=oidc
```

Ensure the UI base URL is set to the address a user will see for the frontend application:

```
UI_BASE_URL=http://localhost:3001
```

The following environment variables must match the configuration of your OIDC provider:

```
OIDC_ISSUER_BASE_URL=http://localhost:8086/realms/codemetrics
OIDC_CLIENT_ID=codemetrics
OIDC_CLIENT_SECRET=changeme
```

#### Additional OIDC configuration

Additional OIDC configuration can be set:

```
OIDC_USER_CLAIM=sub
OIDC_SCOPES=openid profile email
OIDC_AUDIENCE=codemetrics
OIDC_USE_PKCE=true
```

#### Keycloak configuration

Ensure the [Keycloak Realm/Client](https://www.keycloak.org/docs/latest/server_admin/#assembly-managing-clients_server_administration_guide) has OIDC enabled.

#### Example

See the [oidc example](../examples/keycloak) for a working example of OIDC authentication with CodeMetrics and Keycloak.
