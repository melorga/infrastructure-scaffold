terraform {
  backend "s3" {
    # TODO: replace with your bucket
    bucket = "REPLACE-ME-tfstate-bucket"
    key    = "infrastructure-scaffold/dev/terraform.tfstate"
    region = "us-east-1"

    # TODO: replace with your DynamoDB lock table
    dynamodb_table = "REPLACE-ME-tfstate-lock"
    encrypt        = true
  }
}
