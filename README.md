## OPA policy

```shell
opa exec --decision terraform.selfserve.deny --bundle ./policy/opa ./policy/tfplan.json
```