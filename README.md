[!WARNING]
**⚠️ This project has been archived and is no longer maintained. ⚠️**

Github has shown it does not respect its users. Other have said it better than I can.

- https://www.theregister.com/2022/06/30/software_freedom_conservancy_quits_github/
- https://www.andrlik.org/dispatches/migrating-from-github-motivation/
- https://techresolve.blog/2025/12/27/looking-to-migrate-company-off-github-whats-the/
- https://lord.io/leaving-github/
- https://dev.to/alanwest/how-to-actually-migrate-from-github-to-codeberg-without-losing-your-mind-33bf>
> Development has moved to Codeberg:
> **➡️ https://codeberg.org/DavidJEddy/high_load_cms_for_less_than_the_price_of_lunch**
>
> Please update your remotes:
> ```bash
> git remote set-url origin https://codeberg.org/DavidJEddy/high_load_cms_for_less_than_the_price_of_lunch
> ```

---
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

    JAVA_OPTS="-Dtarget=18.206.149.7" \
    gatling.sh \
    -sf ./testing/load/gatling \
    -rf ./testing/load/gatling/results/ \
    -s HighLoadCMS
    -rd 'no cache'

### Tear down

    terraform destroy -auto-approve

## Notes
wordpress cache plugin used is [WP Fastest Cache](https://wordpress.org/plugins/wp-fastest-cache/) with the following settings.

[IMG HERE]

## Report Reading
[Gatling.io](https://gatling.io/docs/current/general/reports/) has an explainatin of how to interprest the results output.