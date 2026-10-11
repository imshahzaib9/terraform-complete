resource "aws_dynamodb_table" "remote-lock-table" {
    name         = "${var.environment}-my-remote-backend-lock-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "${var.environment}-My-Remote-Backend-Lock-Table"
        Environment = var.environment
    }
}
