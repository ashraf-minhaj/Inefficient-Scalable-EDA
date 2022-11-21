resource "aws_s3_bucket" "source_bucket" {
    bucket = "${var.source_bucket}"   
}

# making the s3 bucket private 
resource "aws_s3_bucket_acl" "source_bucket_acl" {
  bucket = aws_s3_bucket.source_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "destination_bucket" {
    bucket = "${var.destination_bucket}"   
}

# making the s3 bucket private 
resource "aws_s3_bucket_acl" "destination_bucket_acl" {
  bucket = aws_s3_bucket.destination_bucket.id
  acl    = "private"
}