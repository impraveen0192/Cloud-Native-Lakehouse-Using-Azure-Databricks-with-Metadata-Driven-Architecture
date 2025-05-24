# 📅 Project Plan: Cloud-Native Lakehouse Using Azure + Databricks

## 🔰 Project Overview

This project aims to build a scalable, metadata-driven data pipeline using Databricks and Azure Data Lake with full Medallion architecture and DevOps automation.

---

## 🧱 Phase 1: Setup & Sample Data (Week 1)

| Task                           | Description                                                                | Owner   | Status | Target Date |
| ------------------------------ | -------------------------------------------------------------------------- | ------- | ------ | ----------- |
| Create Azure Storage Structure | Create folders: bronze, silver, gold, dq\_logs                             | Praveen | ✅      | Day 1       |
| Upload Sample Data             | Load `customer_master.csv`, `sales_transaction.csv`, `product_master.json` | Praveen | ✅      | Day 2       |
| Create Metadata File           | Create initial `metadata.json` with DQ rules                               | Praveen | ✅      | Day 2       |
| Setup Databricks Workspace     | Configure clusters, mount ADLS                                             | Praveen | ✅      | Day 3       |

---

## 🧪 Phase 2: Bronze & Silver Pipelines (Week 2)

| Task                    | Description                               | Owner   | Status | Target Date |
| ----------------------- | ----------------------------------------- | ------- | ------ | ----------- |
| Create Utility Scripts  | `config_loader.py`, `common_functions.py` | Praveen | ✅      | Day 4       |
| Develop Bronze Notebook | Load raw data into Bronze layer           | Praveen | ✅      | Day 5       |
| Develop Silver Notebook | Clean and transform data with DQ rules    | Praveen | ✅      | Day 6       |
| Validate DQ Rules       | Validate null, regex, and range checks    | Praveen | ⬜      | Day 7       |

---

## 🧰 Phase 3: DevOps & QA (Week 3)

| Task                 | Description                  | Owner   | Status | Target Date |
| -------------------- | ---------------------------- | ------- | ------ | ----------- |
| Create GitHub Repo   | Push code and notebooks      | Praveen | ✅      | Day 8       |
| Setup GitHub Actions | YAML for CI/CD               | Praveen | ⬜      | Day 9       |
| Environment Config   | Parameterize for Dev/QA/Prod | Praveen | ⬜      | Day 10      |
| Deploy to QA         | Validate pipeline in QA      | Praveen | ⬜      | Day 11      |
| Deploy to Prod       | Final approval and release   | Praveen | ⬜      | Day 12      |

---

## 🧠 Phase 4: Enhancements (Week 4)

| Task                      | Description                      | Owner   | Status | Target Date |
| ------------------------- | -------------------------------- | ------- | ------ | ----------- |
| Add Gold Layer Logic      | Build aggregated/semantic models | Praveen | ⬜      | Day 13      |
| Register to Unity Catalog | For governance and discovery     | Praveen | ⬜      | Day 14      |
| Add More Records          | Scale to 50M+ as batch           | Praveen | ⬜      | Ongoing     |

---

## ✅ Milestone Summary

* **M1**: Azure storage & sample data uploaded ✅
* **M2**: Bronze and Silver notebooks operational ✅
* **M3**: GitHub CI/CD setup ⬜
* **M4**: QA/Prod DevOps pipeline ⬜
* **M5**: Gold layer & Unity Catalog ⬜

---

## 📌 Notes

* Timeline is based on 5-day work weeks.
* Adjust target dates based on team availability.
* Use issues or project board in GitHub to track sub-tasks.
* Consider adding alerting/logging pipelines post-Phase 4.
