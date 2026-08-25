variable "project_id" {
  description = "The GCP project ID in which the Workbench will be created."
  type        = string
}

variable "project_name" {
  description = "The short name of the SDE user project, used when naming the Workbench."
  type        = string
}

variable "user_id" {
  description = "User identifier used to create the Workbench name and owner label."
  type        = string
}

variable "justification" {
  description = "Reason for requesting the Workbench."
  type        = string
}

