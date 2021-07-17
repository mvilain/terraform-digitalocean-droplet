# Terraform Digitalocean droplet

Provides a DigitalOcean Block Storage volume which can be attached to a droplet in order to provide expanded storage.

forked from https://github.com/clouddrove/terraform-digitalocean-droplet

I removed the region lookup table. Use Digital Ocean region slug to specify this parameter.

I also added a domain parameter to allow for adding the droplet to the *pre-existing* DNS zone.  Be sure to add it to your Digital Ocean project before running this code to add droplets.


## Requirements

This module requires [Terraform 0.13](https://learn.hashicorp.com/terraform/getting-started/install.html)

and

clouddrove's [uniform labeling module](https://github.com/clouddrove/terraform-labels) for Terraform.


## Simple Example
Here is an example of how you can use this module in your inventory structure:
```hcl
    module "droplet" {
      source             = "clouddrove/droplet/digitalocean"
      name               = "droplet"
      application        = "test"
      environment        = "dev"
      label_order        = ["environment", "application", "name"]
      droplet_count      = 1
      region             = "sfo3"
      ssh_keys           =  [module.ssh_key.fingerprint]
      vpc_uuid           = module.vpc.id
      droplet_size       = "nano"
      monitoring         = false
      private_networking = true
      ipv6               = false
      floating_ip        = true
      block_storage_size = 5
      user_data          = file("user-data.sh")
    }
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application | Application for label module (e.g. `cd` or `cloud`) | `string` | `""` | no |
| backups | Boolean controlling if backups are made | `bool` | `false` | no |
| block\_storage\_enabled | (Optional) Boolean to control if more block storage is created | `bool` | `false` | no |
| block\_storage\_filesystem\_label | Initial filesystem label for the block storage volume | `string` | `"data"` | no |
| block\_storage\_filesystem\_type | Initial filesystem label for the block storage volume (xfs or ext4) | `string` | `"xfs"` | no |
| block\_storage\_size | (Required if block_storage_enabled=true) size of block storage in GiB. If updated, can only be expanded | `number` | `0` | no |
| createdby | CreatedBy in label module | `string` | `"terraform"` | no |
| custom\_image | Image is custom or not (an official image) | `bool` | `false` | no |
| delimiter | Delimiter to be used between label module parameters `name`, `application`, and `environment` | `string` | `"-"` | no |
| droplet\_count | number of droplets / other resources to create | `number` | `1` | no |
| droplet\_enabled | Flag to control the droplet creation | `bool` | `true` | no |
| droplet\_size | size of a droplet (s-1vcpu-1gb, s-1vcpu-2gb, s-2vcpu-4gb, s-4vcpu-8gb, m-2vcpu-16gb, c-2, c-4, g-2vcpu-8gb, gd-2vcpu-8gb) | `string` | `"s-1vcpu-1gb"` | no |
| environment | Environment for label module (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| floating\_ip | (Optional) Boolean to control whether floating IPs should be created | `bool` | `false` | no |
| floating\_ip\_assign | (Optional) Boolean controlling whether floating IPs are assigned to instances with terraform | `bool` | `true` | no |
| floating\_ip\_count | Number of floating IPs to create | `string` | `""` | no |
| image\_id | id of public or private image to use | `string` | `""` | no |
| image\_name | image name or slug to lookup | `string` | `"ubuntu-18-04-x64"` | no |
| ipv6 | (Optional) Boolean controlling if IPv6 is enabled | `bool` | `false` | no |
| label\_order | Label order for label module, e.g. `name`,`application` | `list(any)` | `[]` | no |
| monitoring | (Optional) Boolean controlling whether monitoring agent is installed | `bool` | `false` | no |
| name | Name for label module and DNS name (e.g. `app` or `cluster`) | `string` | `""` | no |
| private\_networking | (Optional) Boolean controlling if private networks are enabled | `bool` | `false` | no |
| region | region to create VPC (`ams2`, `ams3`, `blr1`, `fra1`, `lon1`, `nyc1`, `nyc2`, `nyc3`, `sfo1`, `sfo2`, `sfo3`, `sgp1`, `tor1`) | `"sfo3"` | no |
| resize\_disk | (Optional) Boolean controlling if increase disk size when resizing a droplet. Default: true. if false, only RAM and CPU will be resized. Increasing disk size is permanent. Increasing RAM and CPU is reversible. | `bool` | `true` | no |
| ssh\_keys | (Optional) list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API | `list(any)` | `[]` | no |
| user\_data | (Optional) A string of cloud init User Data to initialize droplet | `string` | `""` | no |
| vpc\_uuid | ID of VPC where the droplet will be located | `string` | `""` | no |
| domain | pre-existing DNS domain name used to add DNS record for created droplet | `string` | `"example.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the droplet |
| name | name of the droplet |
| urn | uniform resource name of the droplet |
