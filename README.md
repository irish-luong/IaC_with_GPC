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
- Every time we run `terraform apply`, it records information about infrastructure
it created in Terraform state file (`*.tfstate`)

- The state file format is a private API that changes with every release and is meant only for internal use within Terraform. You should never edit the Terraform state files by hand or write code that reads them directly.


### 1. Problem with Terraform state file in a team

- Shared storage for state file: To be able to use Terraform to update your infrastructure, each of your team members needs access to the same Terraform state files. That means you need to store those files in a shared location.

- Locking the state file: As soon as data is shared, you run into a new problem: locking. Without locking, if two team members are running Terraform at the same time, you may run into race conditions as multiple Terraform processes make concurrent updates to the state files, leading to conflicts, data loss, and state file corruption.

- Isolating the state file: When making changes to your infrastructure, `it’s a best practice to isolate different environments. For example, when making a change in a testing or staging environment, you want to be sure that there is no way you can accidentally break production. But how can you isolate your changes if all of your infrastructure is defined in the same Terraform state file?


### 2. Why don't we use version control like Git to manage shared state files.

To be honest, this is the bad idea for infrastructe configurations for two reason:
- `Manual error`: It is easy to forget to pull down the latest change from version control before running or push the latest change to Github
- `Secret`: All data in Terraform state file is stored in plain text. This is a problem because certain Terraform resources need to store sensitive data


### 3. Materless but central state storage

Instead of using version control, the best way to manage shared storage for state files is to use Terraform’s built-in support for Remote State Storage

Several remote stores are supported, such as Amazon S3, Azure Storage, HashiCorp Consul, and HashiCorp’s Terraform Pro and Terraform Enterprise.

The reasons should we use cloud storage instead version control:
- It's managed service, so you don't have to deployed and manage extra infrastructure.
- Durability and availability
- Encryption
- Versioning `*` ([Use versioned objects](https://cloud.google.com/storage/docs/using-versioned-objects#prereq-cli]))
- It's inexpensive ???

Terraform back-end introduction: [link](https://github.com/hashicorp/terraform/pull/11286)


## Reusable Infrastructure with Terraform Modules

- How do you avoid duplication between the staging and production environments? 
- How do you avoid having to copy and paste all the code in stage/services/webserver-cluster into prod/services/webserver-cluster and all the code in stage/data-stores/mysql into prod/data-stores/mysql?
- As the way we apply in the programing language, we write a function for reusable purpose in mutiple places in project. With Terraform, we can put code inside Terraform module and reuse the module in multiple places

![Migrate from non-reuse to reuse structure](/static//reuse_migration.png)

## Ebook
https://learning.oreilly.com/library/view/terraform-up-and/9781491977071/ch02.html#idm140207906675184