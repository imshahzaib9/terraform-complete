resource "aws_s3_bucket" "shahzaib-bucket" {
  bucket = "${var.environment}-${var.bucket_name}"
  #bucket = "${var.environment}-${var.bucket_name}"

  tags = {
    Name        = "${var.bucket_name}"
    Environment = var.environment
  }
}