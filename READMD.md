# Usage

## Pre-req's:
 - [Ansible](https://www.ansible.com/) - Configur machine
 - [Gatling.io 3.x](https://gatling.io/) - Load Test Tool
 - [Terraform](https://www.terraform.io/) - Provision machine


## Configurations
export PATH=$PATH:/path/to/gatling/bin/

## Execution

### Setup

cd ~/configs/{caching option of choice}
terraform init
terraform plan -out tf.plan
terraform apply -auto-approve tf.plan

### Test

JAVA_OPTS="-Dtarget=OUTPUT_IP_FROM_TERRAFORM" gatling.sh -sf ./ -rf ./results/no_cache -s HighLoadCMS

### Tear down

terraform destroy -auto-approve

## Notes
wordpress cache plugin used is [WP Fastest Cache](http://35.175.125.71/wp-admin/plugin-install.php?tab=plugin-information&plugin=wp-fastest-cache&TB_iframe=true&width=600&height=550)

35.175.125.71