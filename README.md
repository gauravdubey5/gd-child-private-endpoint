# gd-child-private-endpoint: Azure Private Endpoint Terraform Module

This child module creates and manages Azure Private Endpoints with private service connections and optional Private DNS Zone Group associations.

Part of the **Azure Parent–Child Infrastructure Architecture** under GitHub account `gauravdubey5`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `private_endpoints` | Mapping of Private Endpoint configurations (`name`, `location`, `resource_group_name`, `private_connection_resource_id`, and `subnet_id` or `subnet_name`/`virtual_network_name`) | `any` | `{}` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `private_endpoints` | The created Private Endpoints |
