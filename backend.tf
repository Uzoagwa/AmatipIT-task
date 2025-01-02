
#  terraform block is useful for telling terraform the configurations to use. terraform  uses s3 as remote storage for the terraform state file.

terraform {
  backend "s3" {
    bucket = "uzoagwa"
    key    = "uzoagwa/terraform.tfstate"
    region = "eu-west-3"
  }
}


