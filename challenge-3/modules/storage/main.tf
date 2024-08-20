resource "aws_s3_bucket" "this" {
  bucket = "${var.system}-${var.environment}-${var.bucket_role}"

  tags = {
    Name        = "${var.system}-${var.environment}-${var.bucket_role}"
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.this]

  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.this.id
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_kms_key" "this" {
  description = "S3 assets encryption key"
  deletion_window_in_days = var.encryption_key_deletion_window_days
}