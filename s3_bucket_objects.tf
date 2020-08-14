data "aws_s3_bucket_object" "buckets" {
  for_each = toset(var.buckets)
  bucket = element(split(".", each.key), 0)
  key = element(split(".", each.key), 1)
}