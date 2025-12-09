

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "peter-mousses-homelab-tf-state"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_iam_user" "homelab_admin" {
  name = "homelab-admin"
}

resource "aws_iam_user_policy_attachment" "homelab_admin_admin" {
  user       = aws_iam_user.homelab_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "iam_user_name" {
  value = aws_iam_user.homelab_admin.name
}

resource "aws_sns_topic" "budget_alerts" {
  name         = "homelab-budget-alerts"
  display_name = "Homelab Budget Alerts"
}

resource "aws_sns_topic_subscription" "budget_alerts_email" {
  topic_arn = aws_sns_topic.budget_alerts.arn
  protocol  = "email"
  endpoint  = var.aws_budget_alert_email
}

resource "aws_budgets_budget" "monthly_cost_budget" {
  name              = "homelab-monthly-budget"
  budget_type       = "COST"
  limit_amount      = tostring(var.aws_monthly_budget_limit_usd)
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2025-12-01_00:00"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 50
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 100
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 80
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = [aws_sns_topic.budget_alerts.arn]
  }
}
