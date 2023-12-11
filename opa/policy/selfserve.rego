package terraform.selfserve

import future.keywords.in
import future.keywords.contains
import input.plan as tfplan

# the allowed plans that can be used for resources
plans := ["startup-4"]

valid_resources = ["aiven_static_ip", "aiven_pg", "aiven_pg_database"]

# get any resources that are not on the allowed list
invalid_resources := [ r |
  r := tfplan.resource_changes[_]
  not r.type in valid_resources
]

# get the aiven_pg resources where the plan is not valid
invalid_aiven_pg := [ dbs |
  dbs := tfplan.resource_changes[_]
  dbs.type = "aiven_pg"
  not dbs.change.after.plan in plans
]

deny[msg]{
  # if there are any invalid pg resources deny
  count(invalid_aiven_pg) > 0

  # get the names of the invalid resources and write an error message
  names := [ n | n := invalid_aiven_pg[_].name ]
  msg := sprintf("Terraform plan contains aiven_pg resources with plan types that are out of policy: %v", names)
}

deny[msg] {
  # if there are any resources that are not on the allow list, deny
  count(invalid_resources) > 0
  
  names := [ n | n := invalid_resources[_].name ]
  msg := sprintf("Terraform plan contains resources that are out of policy: %v", names)
}