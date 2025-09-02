terraform {
  backend "s3" {
    bucket         = "venky-1234"             # 👈 new bucket
    key            = "venky123/terraform.tfstate"      # file name inside bucket
    region         = "ap-south-1"             # must match your AWS region
    dynamodb_table = "terraform-locks"        # optional (for state locking)
    encrypt        = true                     # recommended
  }
}
