// required variables
variable "name" {
  type        = string
  description = "this name will be used as the project name"
}

variable "project_id_prefix" {
  type        = string
  description = "this will be the prefix for the project_id, project id will be generated like <prefix>-<453322>"
}

variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account this project belongs to. The user or service account performing this operation with Terraform must have at minimum Billing Account User privileges (roles/billing.user) on the billing account."
}

variable "folder_id" {
  type        = string
  description = "The numeric ID of the folder this project belongs to. Changing this forces a new project to be created. Only one of org_id or folder_id may be specified. If the org_id is specified then the project is created at the top level. Changing this forces the project to be migrated to the newly specified organization."
}

// optional variables
variable "auto_create_network" {
  type        = bool
  description = "Create the 'default' network automatically. Default false. If set to false, the default network will be deleted. Note that, for quota purposes, you will still need to have 1 network slot available to create the project successfully, even if you set auto_create_network to false, since the network will exist momentarily."
  default     = false
}

variable "service_apis" {
  type        = list(string)
  description = "The list of apis to be enabled in the project"
  default     = []
}

variable "is_host_project" {
  type        = bool
  description = "Set to true if this project should be a host project; both this and is_service_project cannot be true"
  default     = false
}

variable "is_service_project" {
  type        = bool
  description = "Set to true if this project should be a service project; both this and is_host_project cannot be true"
  default     = false
}

variable "host_project_id" {
  type        = string
  description = "the host project id; only needed when is_service_project is set to true"
  default     = ""
}