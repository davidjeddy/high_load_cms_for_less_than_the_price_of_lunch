# Usage

## Pre-req's:
 - [Ansible](https://www.ansible.com/) - Configur machine
 - [Gatling.io](https://gatling.io/) - Load Test Tool
 - [Terraform](https://www.terraform.io/) - Provision machine


## Configurations
### NO Caching

#### Setup
cd ~/configs/no_cahce
terraform init
terraform plan -out tf.plan
terraform apply -auto-approve tf.plan

#### Test
gatling ./test.scala

#### Tear down
terraform destroy -auto-approve
