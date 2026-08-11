# SDE Service Catalogue

Infrastructure as Code (IaC) for managing Service Catalogue products for the Secure Data Environment (SDE) in Google Cloud Platform (GCP).

---

## Purpose

The purpose of this repository is to:

- Define approved SDE analytical workspace offerings
- Create and maintain Service Catalogue products using Terraform
- Provide standardised Vertex AI Workbench configurations for SDE users
- Support consistent and repeatable provisioning of analytical workspaces

---

## Service Catalogue Products

The initial Service Catalogue will provide two defined workspace offerings:

### Standard Analytics Workspace

A lower-cost workspace intended for standard analytical workloads.

Typical users include:

- Analysts
- Information Analysts
- Researchers
- Business Intelligence Developers

Typical workloads include:

- Python notebooks
- SQL analysis
- BigQuery analysis
- Routine analytical workloads

### Advanced Analytics Workspace

A larger workspace intended for computationally heavier analytical workloads.

Typical users include:

- Data Scientists
- Advanced Analysts
- AI/ML Researchers

Typical workloads include:

- Larger datasets
- Complex analytical models
- Data science
- Machine learning workloads

---

## Standard Configuration

The Standard Analytics Workspace currently provides:

- Machine type: `n2-standard-4`
- 4 vCPU
- 16 GB RAM
- 100 GB balanced persistent disk
- No GPU
- Public IP disabled
- Approved SDE network and subnet
- Approved Workbench service account
- Idle shutdown configured

---

## Advanced Configuration

The Advanced Analytics Workspace provides:

- Machine type: `n2-highmem-8`
- 8 vCPU
- 64 GB RAM
- 250 GB balanced persistent disk
- No GPU
- Public IP disabled
- Approved SDE network and subnet
- Approved Workbench service account
- Idle shutdown configured.

---

## Repository Structure

```text
products/
├── standard-workspace/
└── advanced-workspace/