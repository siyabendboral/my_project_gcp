data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}


resource "random_string" "random" {
  length           = 16
  special          = false
  override_special = "/@£$"
  numeric = false 
  lower = true 
  upper = false
}

resource "google_project" "testproject" {
	name = "testproject"
	project_id = random_string.random.result
	billing_account = data.google_billing_account.acct.id
}