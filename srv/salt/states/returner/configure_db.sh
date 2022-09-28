#!/bin/bash
# Simple script to create a Salt Returner database into MySQL 

CREATE_DATABASE="create database salt"
CREATE_SCHEMA=$(cat /tmp/schema.sql)

echo ${CREATE_DATABASE}
echo ${CREATE_SCHEMA}