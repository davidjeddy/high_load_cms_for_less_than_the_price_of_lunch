# Create a new GitLab Lightsail Instance
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region     = "us-east-1"
  version = "~> 1.2.0"
}

resource "aws_lightsail_instance"  "high_load_cms_example" {
  provider = "aws"
  name              = "High_Load_CMS_Example"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_1_0"
  user_data ="./setup_system.sh"

 # This is where we configure the instance with ansible-playbook
  provisioner "local-exec" {
    //command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./davidjeddy.pem -i '${aws_lightsail_instance.high_load_cms_example.public_ip},' ./config/ansible/master.yml"
command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${aws_lightsail_instance.high_load_cms_example.default.pem}' -i '${aws_lightsail_instance.high_load_cms_example.ip},' ./config/ansible/master.yml"
  }
}
