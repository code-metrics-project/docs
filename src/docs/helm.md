# HELM Chart

There are 3 charts to this build:
1. code-metrics-api
2. code-metrics-ui
3. code-metrics

The chart code-metrics is an umbrella chart to deploy and confiure the api and ui as a 
single deployemt as in 90% of cases they would be deployed together. The inclusion of the 
API and UI as subcharts is to enable individual deployments where required.

## LIMITATIONS / TODO
1. All config is currently in `code-metrics-api/template/configmap.yaml` this needs to be moved to be more dynamic as it currently requires modification of the chart for the purpose of configuration.
2. Passwords etc are stored in ENVVARS and Configmap. This should be moved to secrets.
3. Options for precreated secrets / configmap names unmanaged by helm should be allowed.
4. Naming template is awful at the moment to improve to prevent deployments of <realease-name>-component.
5. Backend readiness healthcheck is the same as the liveness check this should be updated to check dependancies. 


## Deploying on Rancher desktop

Due to the UI being 'local' and the backend being remote there are some extra steps requried to make it work locally
Once deployed the front end with a url using `code-metrics.127.0.0.1.sslip.io` the backend should be port forwarded to localhost on port 3000.
This will allow the UI to talk to the API. In a normal deployment the API would have an ingress that would be used for this purpose but due to DNS and local routing the above workaround is required.
Alternatively editing your computers `/etc/hosts` file with the name and IP may also work but is less 'nice'.

## Deploying in Prod.
