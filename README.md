# IaC_with_GPC
This is IAC repository to provision on GPC cluster


## Terraform properties
- Immutable infrastructure paradigm
- Declarative code
- Masterless
  - Don't require any extra infrastructure
  - Use cloud provider API server as the master server
- Agentless
  - Dont't require to install any extra agent
  - Issue command and cloud provider's agents execute them
- Cutting edge
  - Youngest when compare with Ansible, Puppet, Chef


## Terraform files
| Files         | Purpose                        |
| :---------    | :----------------              |
| main.tf       | Primary entrypoint             |
| variables.tf  | The declarations for variables |
| output.tf     | The declarations for outputs   |

## State Management In Terraform
Every time we run `terraform apply`, it records information about infrastructure
it created in Terraform state file (`*.tfstate`)

## Ebook
https://learning.oreilly.com/library/view/terraform-up-and/9781491977071/ch02.html#idm140207906675184