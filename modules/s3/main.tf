resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    "Name" = var.bucket_name
}

  }
resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.this]
}


resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:DeleteObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
  
  depends_on = [aws_s3_bucket_public_access_block.this]
}

locals {
  mime_types = {
    htm   = "text/html"
    html  = "text/html"
    css   = "text/css"
    ttf   = "font/ttf"
    json  = "application/json"
    png   = "image/png"
    jpg   = "image/jpeg"
    woff2 = "font/woff2"
    woff  = "font/woff"
    eot   = "application/vnd.ms-fontobject"
    js    = "text/javascript"
    otf   = "font/otf"
    svg   = "image/svg+xml"
    txt   = "text/plain"
    map   = "application/json"
    ico   = "image/x-icon"
  }
}
