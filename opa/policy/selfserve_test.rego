package terraform.selfserve

import future.keywords

test_deny_with_invalid_plans_true if {
  # when using a message with deny, deny always evaluates to true as 
  # either a message is returned or a set
  # we need to test all cases using count to count the number of messages
  count(deny) > 0 with input as data.fixtures.invalid_plans
}

test_deny_with_invalid_resources_true if {
  count(deny) > 0 with input as data.fixtures.invalid_resources
}

test_deny_with_valid_data_false if {
  count(deny) == 0 with input as data.fixtures.valid_plans
}