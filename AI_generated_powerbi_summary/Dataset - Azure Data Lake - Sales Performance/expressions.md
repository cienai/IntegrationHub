# Expressions — Dataset: Azure Data Lake - Sales Performance

Source: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/expressions.tmdl`

## Overview
- Defines parameter expressions and M functions used for data connections and retrieval.
- Mix of text parameters and Power Query (M) function bodies.

## Parameters
- `db_name`: Text (required). Example: `cien_cmirthhguabxxs2rt_db`.
- `db_server_sql`: Text (required). Example: `cien_dghyzcwxdptrmpqqt_db`.
- `db_type`: Text (required). Allowed: `{"PostgresSQL","SQL Server","Azure Data Lake"}`. Default: `Azure Data Lake`.
- `db_server_postgres`: Text (required). Example: `INVALID_HOST`.
- `file_server_data_lake`: Text (required). Example: `https://cienjobdataus.dfs.core.windows.net/`.
- `file_folder_data_lake`: Text (required). Example: `aceme24/export/`.

## Functions
- `getDBConnection()`: Returns a connection based on `db_type`.
  - Azure Data Lake: `AzureStorage.DataLake(file_server_data_lake & file_folder_data_lake)`.
  - SQL Server/Postgres branches are present but commented in this function.
- `getDBTable(tableName as text)`: Retrieves a table.
  - SQL Server: `getDBConnection(){[Schema="dbo",Item=tableName]}[Data]`.
  - Postgres: `getDBConnection(){[Schema="public",Item=tableName]}[Data]`.
  - Azure Data Lake flow:
    - Filters Data Lake folder items to `[coid]_[tableName]/`.
    - Excludes hidden files.
    - Applies `transformParquetFile` to each parquet file.
    - Expands columns from transformed tables.
    - If `_sys_doc_id` exists, filters out rows with blank/null `_sys_doc_id`.
- `getDBQuery(sql as text)`: Executes a query.
  - SQL Server: `getDBConnection(){[Schema="dbo", Item=sql]}[Data]`.
  - Postgres: `Value.NativeQuery(PostgreSQL.Database(db_server_postgres, db_name, [CommandTimeout=#duration(0, 0, 1, 0)]), sql, null, [EnableFolding=true])`.
  - Other types raise an error (Azure Data Lake not supported here).
- `transformParquetFile(Parameter1 as binary)`: Returns `Parquet.Document(Parameter1, ...)`; used by `getDBTable`.

## Notes
- Active default is Azure Data Lake via `db_type`.
- Some SQL/Postgres connection code is commented in `getDBConnection`, but referenced in `getDBTable`/`getDBQuery`.
- No changes are made to Power BI files; this is a documentation-only summary.
