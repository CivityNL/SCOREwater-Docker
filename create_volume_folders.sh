#!/bin/sh
# 
# Create folders in which Gravitee applications can persist their data

gravitee_folder="./volumes/gravitee"

mkdir -p "${gravitee_folder}"
mkdir -p "${gravitee_folder}/mongodb"
mkdir -p "${gravitee_folder}/mongodb/data"
mkdir -p "${gravitee_folder}/elasticsearch"
mkdir -p "${gravitee_folder}/elasticsearch/data"
mkdir -p "${gravitee_folder}/apim-gateway"
mkdir -p "${gravitee_folder}/apim-gateway/plugins"
mkdir -p "${gravitee_folder}/apim-gateway/logs"
mkdir -p "${gravitee_folder}/apim-management-api"
mkdir -p "${gravitee_folder}/apim-management-api/plugins"
mkdir -p "${gravitee_folder}/apim-management-api/logs"
mkdir -p "${gravitee_folder}/apim-management-ui"
mkdir -p "${gravitee_folder}/apim-management-ui/logs"
mkdir -p "${gravitee_folder}/apim-portal-ui"
mkdir -p "${gravitee_folder}/apim-portal-ui/logs"

postgis_folder="./volumes/postgis"
mkdir -p "${postgis_folder}"
