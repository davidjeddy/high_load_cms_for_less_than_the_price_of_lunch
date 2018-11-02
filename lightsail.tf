# Create a new GitLab Lightsail Instance
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "us-east-1"
  version                 = "~> 1.2.0"
}

resource "aws_lightsail_instance" "high_load_cms_example" {
  provider          = "aws"
  name              = "High_Load_CMS_Example"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_1_0"
  key_pair_name ="high_load_cms"

  # This is where we configure the instance with ansible-playbook
   provisioner "local-exec" {
       command = "sleep 60;  ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip_address}', -u ubuntu --private-key ./high_load_cms.pem ./configs/ansible/master.yml -vvv"
   }

  connection {
    type        = "ssh"
    host        = "${self.public_ip_address}"
    private_key = "${file("./high_load_cms.pem")}"
    user        = "ubuntu"
    timeout     = "15s"
  }
}

output "public_ip_address" {
  value = "${aws_lightsail_instance.high_load_cms_example.public_ip_address}"
}
