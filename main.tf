provider "aws" {
    region = "us-west-2"
    access_key = ""
    secret_key ="" 
}

variable "mybucket_names" {
  type = list
  default = ["adventuretech-bucket-po", "datasumit-bucket-po", "codecarnival-bucket-po"]
}
resource "aws_s3_bucket" "mybuckets" {
  count = length(var.mybucket_names)
  bucket = var.mybucket_names[count.index]

  tags = {
    Name        = "My buckets"
    Environment = "Dev"
  }
}
