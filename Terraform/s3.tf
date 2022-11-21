### **** source bucket ****
resource "aws_s3_bucket" "source_bucket" {
    bucket = "${var.source_bucket}"   
}

resource "aws_s3_bucket_acl" "source_bucket_acl" {
  bucket = aws_s3_bucket.source_bucket.id
  acl    = "public-read"
}

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

resource "aws_s3_bucket_notification" "source_bucket_notification" {
  bucket = aws_s3_bucket.source_bucket.id

  queue {
    # id            = "object-upload-event"
    queue_arn     = aws_sqs_queue.sqs_queue.arn
    events        = ["s3:ObjectCreated:*"]
    # filter_suffix = ".mp4"
    filter_suffix = ".png"
  }
}


# ****  destinition bucket ****
resource "aws_s3_bucket" "destination_bucket" {
    bucket = "${var.destination_bucket}"   
}

resource "aws_s3_bucket_acl" "destination_bucket_acl" {
  bucket = aws_s3_bucket.destination_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "destination_bucket_cors" {
  bucket = aws_s3_bucket.destination_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "GET", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}