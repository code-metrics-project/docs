# Getting started

You can run Code Metrics in a number of ways:

- Docker or Docker Compose
- AWS Lambda
- Using Node.js directly
- Kubernetes

## Docker Compose

This method uses [Docker Compose](https://docs.docker.com/compose/install/).

To start, clone the repository then run:

    docker-compose up --build

(or `docker compose up --build` if you are using Compose CLI v2).

> Note: if you want to run with mocked backend services, amend the Compose command as follows:
> ```
> docker-compose -f docker-compose.yaml -f backend/mocks/docker-compose-mocks.yaml up --build
> ```

Access:

- Access the web UI at http://localhost:3001
- The API runs at http://localhost:3000

## Kubernetes

Helm instructions are here: [Helm.md](./helm.md)

## AWS Lambda

The AWS Lambda deployment can be found on the [Releases page](https://github.com/DeloitteDigitalUK/code-metrics/releases).

Download the `codemetrics-api.zip` file. See the example [template.yaml](../backend/lambda/template.yaml) for an example of how to deploy the Lambda function.

The frontend web UI is a static site, so can be hosted anywhere. You can find the latest version of the web UI on the [Releases page](https://github.com/DeloitteDigitalUK/code-metrics/releases).

Download the `codemetrics-ui.zip` file and host it on a static site. You will need to set the `apiBaseUrl` variable in `config.json` to point to the API endpoint.

## Using Node.js directly

To run the API and web UI directly, you will need to install Node.js v16 or later.

Download the `codemetrics-api.zip` file and unzip it.

To start the API, run:

    node index.js

The frontend web UI is a static site, so can be hosted anywhere. You can find the latest version of the web UI on the [Releases page](https://github.com/DeloitteDigitalUK/code-metrics/releases).

Download the `codemetrics-ui.zip` file and unzip it. You will need to set the `apiBaseUrl` variable in `config.json` to point to the API endpoint.

---

## Changing config path

To use a different configuration directory, under `backend/config`, set the `CONFIG_DIR` environment variable:

    CONFIG_DIR=/backend/config/somedir docker compose up --build

## CORS settings

If you need to adjust the origin of the web UI, edit the `CORS_ORIGIN` environment variable in the `backend` service in `docker-compose.yaml`.
