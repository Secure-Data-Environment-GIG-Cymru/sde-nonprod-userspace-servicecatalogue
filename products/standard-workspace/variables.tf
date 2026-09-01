variable "project_id" {
  description = "The GCP project ID in which the Workbench will be created. Must be in the format ndr-sde-nonprod-<project-name>, for example ndr-sde-nonprod-userproject4."
  type        = string

    validation {
    condition     = can(regex("^ndr-sde-nonprod-[a-z0-9-]+$", var.project_id))
    error_message = "project_id must be in the format ndr-sde-nonprod-<project-name>, for example ndr-sde-nonprod-userproject4."
    }
}

#variable "project_name" {
#  description = "The short name of the SDE user project, used when naming the Workbench."
#  type        = string
#}

variable "user_id" {
  description = "User identifier used to create the Workbench name and owner label."
  type        = string
}

variable "justification" {
  description = "Reason for requesting the Workbench. (please do not include punctuation such as commas in this field)"
  type        = string
}

