this is a use case of dbt and bigquery to process stock data
- https://koyaaarr.medium.com/dbt-and-bigquery-in-practice-transform-stock-data-1771e2393319

# prerequisites

- generate service_account.json and describe the path in profiles.yml
- prepare python environment and install dbt packages
- if you use poetry, run: `poetry add dbt-core dbt-bigquery`

# commands

- initiate: `dbt init`
- run query: `dbt run --full-refresh --profiles-dir .`
- run test: `dbt test --profiles-dir .`
- generate docs: `dbt docs generate --profiles-dir .`
- serve docs: `dbt docs serve --profiles-dir .`
