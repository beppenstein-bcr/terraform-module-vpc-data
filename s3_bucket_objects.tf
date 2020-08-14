data "aws_s3_bucket_object" "buckets" {
  for_each = var.buckets
  bucket = each.key
  key = each.value
}