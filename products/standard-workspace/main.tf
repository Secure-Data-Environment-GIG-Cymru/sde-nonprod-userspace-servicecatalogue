terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.26.0"
    }
  }
}

locals {
  region = "europe-west2"
  zone   = "europe-west2-a"

  project_short_name = trimprefix(var.project_id, "ndr-sde-nonprod-")

  network_name = "sde-nonprod-${local.project_short_name}-network"
  subnet_name  = "sde-nonprod-${local.project_short_name}-subnet"

  #network_name = "sde-nonprod-${var.project_name}-network"
  #subnet_name  = "sde-nonprod-${var.project_name}-subnet"

  service_account_email = "sde-nonprod-scdeployer-adn-sa@ndr-sde-nonprod-seedp.iam.gserviceaccount.com"

  workbench_name = "${local.project_short_name}-standard-workbench-${var.user_id}"

  machine_type = "n2-standard-4"

  image_project = "cloud-notebooks-managed"
  image_family  = "workbench-instances"

  boot_disk_size_gb = 150
  boot_disk_type    = "PD_BALANCED"

  idle_timeout_seconds = 3600

  labels = {
    environment   = "nonprod"
    service       = "sde"
    template      = "standard-workspace"
    owner         = lower(var.user_id)
    justification = substr(
      replace(lower(var.justification), " ", "-"),
      0,
      63
    )
  }
}

provider "google" {
  project = var.project_id
  region  = local.region
}

resource "google_workbench_instance" "standard_sde_workbench" {
  name     = local.workbench_name
  location = local.zone
  project  = var.project_id

  labels = local.labels

  gce_setup {
    machine_type = local.machine_type

    vm_image {
      project = local.image_project
      family  = local.image_family
    }

    boot_disk {
      disk_size_gb = local.boot_disk_size_gb
      disk_type    = local.boot_disk_type
    }

    disable_public_ip = true
    private_ip_google_access = true

    network_interfaces {
      network = "projects/${var.project_id}/global/networks/${local.network_name}"
      subnet  = "projects/${var.project_id}/regions/${local.region}/subnetworks/${local.subnet_name}"
    }

    service_accounts {
      email = local.service_account_email
    }

    metadata = {
      idle-timeout-seconds = tostring(local.idle_timeout_seconds)
    }
  }
}