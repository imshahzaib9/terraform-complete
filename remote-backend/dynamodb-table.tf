resource "aws_dynamodb_table" "remote-lock-table" {
    name         = "my-remote-backend-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
