# Datastores

Different datastore implementations are supported.

| Name    | Details                                                                                                                                                                                                                             |
|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| inmem   | In-memory datastore implementation.️ This datastore implementation holds all items in memory for the lifetime of the process. There is no eviction, so growth is infinite with continued insertions. Do not use this in production. |
| mongodb | MongoDB datastore. This datastore implementation holds items in an external MongoDB instance. It requires configuration of the connection and authentication details for the MongoDB server.                                        |

## Configuration

Configuration can be set using the `DATASTORE_IMPL` environment variable in backend, which accepts one of `inmem`, `mongodb` as values.

    DATASTORE_IMPL=inmem

### MongoDB configuration

If the `mongodb` implementation is used, the following environment variables apply:

    DATABASE_URI=mongodb://code-metrics:changeme@localhost:27017
    DATABASE_NAME=code-metrics

### Caching

Certain metrics can be cached in the datastore, for rapid subsequent retrieval.

Whether the cache is enabled is controlled by this environment variable:

    LOOKUP_CACHE_ENABLED=true
