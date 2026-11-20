provider "aws" {
  region = "ap-south-1"
}

# 1. Create the IAM User
resource "aws_iam_user" "s3_user" {
  name = "s3-readonly-user-arvinder"
}

# 2. Create the IAM Policy using the variable from variables.tf
resource "aws_iam_policy" "s3_read_policy" {
  name   = "TerraformS3ReadPolicy"
  policy = var.s3_read_policy_json
}

# 3. Attach the Policy to the User
resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
