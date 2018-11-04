# Usage

## Pre-req's:
 - [Ansible](https://www.ansible.com/) - Configur machine
 - [Gatling.io 3.x](https://gatling.io/) - Load Test Tool
 - [Terraform](https://www.terraform.io/) - Provision machine


## Configurations
export PATH=$PATH:/path/to/gatling/bin/

### NO Caching

#### Setup
cd ~/configs/no_cahce
terraform init
terraform plan -out tf.plan
terraform apply -auto-approve tf.plan

#### Test

JAVA_OPTS="-Dtarget=OUTPUT_IP_FROM_TERRAFORM" gatling.sh -sf ./ -rf ./results/no_cache -s HighLoadCMS

#### Tear down
terraform destroy -auto-approve

### Wordpress (application) Caching
