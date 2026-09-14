resource "aws_s3_bucket" "shazhaib-bucket" {
    bucket = "shazhaib-bucket-09091999"
}

resource "aws_s3_versioning" "shazhaib-bucket-versioning" {
    bucket = aws_s3_bucket.shazhaib-bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}