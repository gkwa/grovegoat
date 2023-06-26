#!/usr/bin/env bash

. common.sh

[[ ! -d .terraform ]] && terraform init

terraform plan
terraform apply -auto-approve
