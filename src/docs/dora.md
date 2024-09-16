# DORA metrics

CodeMetrics can measure the four metrics used in the [DORA State of DevOps Report](https://dora.dev/publications/) and [Accelerate](https://nicolefv.com/writing) that relate to software delivery performance.

The metrics are:

- Deployment frequency
- Lead time for changes
- Time to restore service
- Change failure rate

## Deployment frequency

Deployment frequency is the number of deployments to production per unit of time. This is a measure of how often you deploy code to production.

![Graph of deployment frequency for 3 job groups over time](img/deployment_frequency.png)

## Lead time for changes

Lead time for changes is the time it takes to go from code committed to code successfully running in production. This is a measure of how quickly you can get code into production.

![Graph of lead time for changes for a workload over time](img/lead_time_for_changes.png)

## Time to restore service

Time to restore service is the time it takes to restore service when a service incident occurs. This is a measure of how quickly you can recover from incidents.

![Graph of time to restore service for a workload over time](img/time_to_restore_service.png)

## Change failure rate

Change failure rate is the percentage of changes that result in degraded service and require remediation. This is a measure of how often your changes cause problems.

![Graph of change failure rate for a workload over time](img/change_failure_rate.png)
