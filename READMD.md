# Usage

## Pre-req's:
 - [Ansible](https://www.ansible.com/) - Configur machine
 - [Gatling.io 3.x](https://gatling.io/) - Load Test Tool
 - [Terraform](https://www.terraform.io/) - Provision machine


## Usage

### Configurations / Setup
export PATH=$PATH:/path/to/gatling/bin/

cd ~/configs/{caching option of choice}
terraform init
terraform plan -out tf.plan

### Execution

terraform apply -auto-approve tf.plan

### Test
cd /path/to/root/of/this/project

JAVA_OPTS="-Dtarget=18.215.14.128" \
gatling.sh \
-sf ./testing/load/gatling \
-rf ./testing/load/gatling/results/wordpress_cache/ \
-s HighLoadCMS

### Tear down

terraform destroy -auto-approve

## Notes
wordpress cache plugin used is [WP Fastest Cache](http://35.175.125.71/wp-admin/plugin-install.php?tab=plugin-information&plugin=wp-fastest-cache&TB_iframe=true&width=600&height=550) with the following settings.

[IMG HERE]
