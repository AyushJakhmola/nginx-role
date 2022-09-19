packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
      }
    }
  }
 source "amazon-ebs" "basic-ami" {
  ami_name = "nginx-ami"
  instance_type = "t3a.micro"
  ssh_username  =  "ubuntu"
  source_ami = "ami-0d70546e43a941d70"
  region         = "us-west-2"
}
build {

  sources = ["source.amazon-ebs.basic-ami"]

  provisioner "ansible" {
      playbook_file = "./playbook.yml"
    }
}