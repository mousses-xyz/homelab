variable "aws_monthly_budget_limit_usd" {
  description = "Monthly budget limit in USD for AWS spending alerts"
  type        = number
  default     = 10
}

variable "aws_budget_alert_email" {
  description = "Email address to receive AWS budget alerts and notifications"
  type        = string
  default     = "peter@mousses.xyz"
}
