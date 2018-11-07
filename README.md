# Usage

## Pre-req's:
 - [AWS Account](http://aws.amazon.com)
 - [Ansible 2.5.1](https://www.ansible.com/) - Configur machine
 - [Gatling.io 3.0](https://gatling.io/) - Load Test Tool
 - [Terraform 0.11.8](https://www.terraform.io/) - Provision machine

## Usage

### Configurations / Setup

    export PATH=$PATH:/path/to/gatling/bin/

    cd ~/configs/CACHE_OPTION
    terraform init
    terraform plan -out tf.plan

### Execution

    terraform apply -auto-approve tf.plan

### Test
cd /path/to/root/of/this/project

    JAVA_OPTS="-Dtarget=TERRAFORM_OUTPUT_IP" \
    gatling.sh \
    -sf ./testing/load/gatling \
    -rf ./testing/load/gatling/results/CACHE_OPTION/ \
    -s HighLoadCMS

Exp:

     JAVA_OPTS="-Dtarget=35.170.196.248" ./gatling.sh -sf ./testing/load/gatling -rf ./testing/load/gatling/results/nginx_cache -s HighLoadCMS -rd 'nginx cache test 2'

### Tear down

    terraform destroy -auto-approve

## Notes
wordpress cache plugin used is [WP Fastest Cache](https://wordpress.org/plugins/wp-fastest-cache/) with the following settings.

[IMG HERE]

## Report Reading
[Gatling.io](https://gatling.io/docs/current/general/reports/) has an explainatin of how to interprest the results output.