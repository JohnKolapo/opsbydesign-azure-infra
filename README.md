# OpsByDesign: Terraform-Powered Full-Stack Azure Infra Blueprint

## Project Status: In Progress (May 2025)

This is a working, production-grade Azure infrastructure deployment project using Terraform, GitHub Actions, and Azure-native tooling.

The project is architected to simulate real enterprise environments across **networking, security, application delivery, AI tooling, cost management, and observability** — all defined as code.

---

## Objective

To build, secure, and automate a full Azure cloud environment from scratch using:

* Terraform (Infrastructure-as-Code)
* GitHub Actions (CI/CD + OIDC)
* Azure-native services: Functions, API Management, Cognitive Services, App Insights, Defender, Sentinel, CosmosDB, Key Vault, etc.

This project also serves as a proof-of-concept for:

* Enterprise-ready CI/CD pipelines
* Role-based access control (RBAC)
* Infrastructure modularization
* Secure cloud identity & monitoring

---

## Stack & Tools

| Layer             | Tool/Service                                    |
| ----------------- | ----------------------------------------------- |
| IaC               | Terraform (modularized)                         |
| CI/CD             | GitHub Actions + OIDC                           |
| Compute           | Azure App Services, Functions (serverless)      |
| Networking        | VNet, NSGs, Private DNS                         |
| Identity & Access | Azure AD, RBAC, Conditional Access              |
| API Management    | Azure API Gateway                               |
| Database          | CosmosDB, Azure SQL, PostgreSQL                 |
| AI Tooling        | Azure Cognitive Services (Vision, LUIS, OpenAI) |
| Observability     | App Insights, Log Analytics, Sentinel           |
| Secrets           | Azure Key Vault                                 |

---

## Structure


opsbydesign-azure-infra/
├── .github/workflows/terraform.yml         # GitHub Actions CI logic
├── environments/
│   ├── dev/                                # Main entrypoint for dev infra
│   └── prod/                               # Ready for production fork
├── modules/
│   ├── vnet/
│   ├── storage_account/
│   ├── dns_zone/
│   └── app_service/
└── README.md                               # This file
```

---

## Completed So Far

* Azure tenant provisioning
* Domain verification: `opsbydesign.ca`
* Backend storage + tfstate locking
* GitHub Actions with OIDC login (no SP secrets)
* DNS zone + A record module deployed
* VNet and NSG provisioning live
* CI pipeline with init, validate, and plan steps working

---

## Next Milestones

* [ ] Add App Service module with slot support
* [ ] Deploy API Management with versioning and rate-limiting
* [ ] Add Cognitive Services and OpenAI integration
* [ ] Cosmos DB + PostgreSQL deployment via TF
* [ ] Implement cost alerts + tagging policies
* [ ] Sentinel log pipelines + alert rules (Terraform)
* [ ] Finalize README, architecture diagram, and Medium post

---

Full Azure Infrastructure Architecture

This project sets up a full-stack Azure environment using Terraform and GitHub Actions (OIDC) — no secrets stored. The design spans core infrastructure, serverless compute, API management, databases, and AI tooling.

- Features Deployed

DNS Zones, Virtual Networks (VNets), Subnets, NSGs

GitHub Actions with Azure OIDC

Serverless compute (Azure Functions, Logic Apps)

API Gateway with versioning and rate-limiting

Databases: CosmosDB, PostgreSQL, Azure SQL

Azure Cognitive Services + App Insights

CI/CD pipeline, RBAC, and cost governance

Architecture Diagram

## Get in Touch

Author: [John Folorunso Kolapo] (https://www.linkedin.com/in/kolapo-folorunso)
Email: [john@opsbydesign.ca](mailto:admin@opsbydesign.ca)

