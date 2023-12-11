policy "selfserve" {
  query             = "data.terraform.selfserve.deny"
  enforcement_level = "mandatory"
  description       = "OPA policy enabling developers to create their own resources"
}