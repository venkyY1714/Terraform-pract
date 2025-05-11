terraform {
  backend "s3" {

    bucket  = "statefilestorage8780"
    key     = "mystatefolder2/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
