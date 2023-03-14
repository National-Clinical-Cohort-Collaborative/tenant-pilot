#!/bin/bash

# mssql
sed -f ./lc_tables.sed ../ExtractScripts/N3C_extract_omop_mssql.sql > ../ExtractScripts/N3C_extract_omop_mssql_lc.sql

sed -f ./lc_tables.sed ../PhenotypeScripts/n3c_clinical_omop_mssql.sql > ../PhenotypeScripts/n3c_clinical_omop_mssql_lc.sql

# bigquery
sed -f ./lc_tables.sed ../ExtractScripts/N3C_extract_omop_bigquery.sql > ../ExtractScripts/N3C_extract_omop_bigquery_lc.sql

sed -f ./lc_tables.sed ../PhenotypeScripts/n3c_clinical_omop_bigquery.sql > ../PhenotypeScripts/n3c_clinical_omop_bigquery_lc.sql
