# source bucket
resource "aws_s3_bucket" "source_bucket" {
    bucket = "${var.source_bucket}"   
}

# making the s3 bucket private 
# resource "aws_s3_bucket_acl" "source_bucket_acl" {
#   bucket = aws_s3_bucket.source_bucket.id
#   acl    = "PUBLIC"
# }

resource "aws_s3_bucket_cors_configuration" "source_bucket_cors" {
  bucket = aws_s3_bucket.source_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}


# destinition bucket
resource "aws_s3_bucket" "destination_bucket" {
    bucket = "${var.destination_bucket}"   
}

# making the s3 bucket private 
resource "aws_s3_bucket_acl" "destination_bucket_acl" {
  bucket = aws_s3_bucket.destination_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "destination_bucket_cors" {
  bucket = aws_s3_bucket.destination_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}