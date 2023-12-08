# Queries

Information about the different types of queries.

## Supported queries

### [Source code metrics](./query_source_code.md)

Data about the structure, complexity and health of your codebase.

Metrics include:

- Test coverage
- Cyclomatic complexity
- Codebase size (ncloc)

### [Build and deployment pipelines](./query_pipelines.md)

Duration, success percentage and outcomes of build and deployment pipelines.

Metrics include:

- Pipeline outcomes (successful/failed/aborted)
- Pipeline success percentage
- Pipeline execution duration

### [Repository churn](./query_repo_churn.md)

A metric showing the amount of change in a repository.

### [Bug culprit files](./query_bug_culprits.md)

Identifies files that are frequently changed in response to bug fixes. These are potential 'culprits' for code that needs attention.

### [Bugs and escaped bugs](./query_bugs.md)

Bugs/defects from the ALM tool, such as Jira. Helpful to correlate against other software quality metrics.

## Query builder

Code Metrics provides a custom query builder, which allows you to combine datasets from one or more query types, such as source code metrics, tickets etc.

The query builder supports timeseries datasets.

For example, you could chart the following:

- what is the bug to change ratio?
- how does test coverage correlate to escaped bugs?
- how has complexity changed with codebase size?
- how much churn has there been in the codebase (i.e. additions, edits, deletions)

![Query builder](img/query_builder.png)

### Custom queries

Custom queries are combinations of query types and default inputs that you can use to tailor the tool to a particular analysis, workload or repository.

You can define custom queries using a JSON file. See [custom queries](custom_queries.md) for details.

### Data points and rolling averages

You can choose to chart all data points, which is most accurate, but can be quite spiky for some datasets. You can also choose to add rolling averages (over 4 weeks or 12 weeks). 
