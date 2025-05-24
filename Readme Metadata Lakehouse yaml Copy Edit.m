Readme Metadata Lakehouse
yaml
Copy
Edit
# Cloud-Native Lakehouse Using Azure + Databricks with Metadata-Driven Architecture

## 🚀 Project Overview
This project demonstrates a metadata-driven Lakehouse architecture using Azure Data Lake Gen2 and Databricks. The solution uses the Medallion architecture pattern (Bronze, Silver, Gold layers), emphasizes scalability to 500M+ records, and includes robust data quality (DQ) validation mechanisms.

---

## 🧪 Core Features
- Metadata-driven pipeline design for flexibility and scalability
- Full Medallion architecture: Bronze (raw), Silver (cleaned/enriched), Gold (business-ready)
- Support for CSV and complex JSON source files
- Data quality framework with null, range, regex checks and routing bad records
- Integration-ready for Power BI and SAP Datasphere reporting
- Use of Unity Catalog for centralized metadata and access control
- CI/CD pipeline via GitHub Actions for automated deployments
- Scalability from 1M to 500M+ records with partitioning and incremental loads

---

## 🔁 Future-Ready
- Easily extendable to new data sources or formats by updating metadata
- Support for incremental and full batch loads with delta processing
- Ready for ML and advanced analytics integration downstream
- DevOps and GitOps enablement for enterprise-grade deployment and governance

---

## 📈 Environments
- **Dev**: Development and initial testing of notebooks and utilities
- **QA**: Integration and user acceptance testing
- **Prod**: Production workloads with optimized data pipelines and governance

---

## 📁 Sample Data Models

### 1. `customer_master.csv` (~50,000 records)
customer_id,customer_name,country,customer_segment,email
100001,John Smith,USA,Retail,john.smith@example.com
100002,Mary Jones,Canada,Wholesale,mary.jones@example.com

shell
Copy
Edit

### 2. `sales_transaction.csv` (~1 million records)
transaction_id,customer_id,product_id,amount,currency,transaction_date,status
TXN0000001,100001,P001,120.50,USD,2023-10-01,Completed
TXN0000002,100002,P002,500.00,CAD,2023-10-02,Failed

pgsql
Copy
Edit

### 3. `product_master.json`
```json
[
  {
    "product_id": "P001",
    "product_name": "Laptop",
    "category": "Electronics",
    "price": 1000.00
  }
]
🗂 Folder Structure (Repo)
pgsql
Copy
Edit
root/
├── bronze/
│   ├── sample_data/
│   │   ├── customer_master.csv
│   │   ├── sales_transaction.csv
│   │   └── product_master.json
│   └── configs/
│       └── metadata.json
├── silver/
├── gold/
├── dq_logs/
├── notebooks/
│   └── generate_sample_data.ipynb       # Notebook to generate CSV and JSON sample data
├── utils/
│   ├── config_loader.py
│   └── common_functions.py
├── README.md
└── Project_Plan_Metadata_Lakehouse.md
🧾 metadata.json (DQ Rules Example)
json
Copy
Edit
{
  "tables": [
    {
      "name": "customer_master",
      "format": "csv",
      "path": "/bronze/sample_data/customer_master.csv",
      "primary_key": ["customer_id"],
      "dq_rules": [
        {"type": "null_check", "columns": ["customer_id", "customer_name", "email"]},
        {"type": "regex_check", "column": "email", "pattern": "^\\S+@\\S+\\.\\S+$"}
      ],
      "dq_error_path": "/dq_logs/customer_master/"
    },
    {
      "name": "sales_transaction",
      "format": "csv",
      "path": "/bronze/sample_data/sales_transaction.csv",
      "primary_key": ["transaction_id"],
      "dq_rules": [
        {"type": "null_check", "columns": ["transaction_id", "customer_id", "amount"]},
        {"type": "range_check", "column": "amount", "min": 0, "max": 1000000}
      ],
      "dq_error_path": "/dq_logs/sales_transaction/"
    }
  ]
}
🔧 Setup Steps
Upload sample data to Azure Data Lake Gen2 in bronze/sample_data/

Set up Databricks workspace (with Unity Catalog optional)

Mount ADLS Gen2 using dbutils.fs.mount or use external location via Unity Catalog

Create utility scripts:

utils/config_loader.py

utils/common_functions.py

Create Notebooks:

notebooks/bronze_load

notebooks/silver_load

notebooks/gold_load (optional/for future)

notebooks/generate_sample_data # To generate CSV and JSON sample files

Implement Data Quality rules as defined in metadata.json

Run and validate Bronze and Silver load pipelines

🛠️ GitHub Actions & DevOps Workflow
Step 1: GitHub Actions for CI/CD
Setup .github/workflows/databricks-deploy.yml

Use secrets to store Databricks PAT token and workspace URL

Deploy notebooks and utils to Databricks repo or workspace using CLI or API

Step 2: Dev → QA → Prod Deployment
Dev: Develop and test notebooks locally or in dev branch

QA:

Trigger GitHub Action manually or on PR merge to qa branch

Use parameterized deployment (e.g., mount paths, target schema)

Production:

Manual approval step before deployment to prod branch

GitHub Actions promote code + update Unity Catalog if needed

Step 3: Environment Variables
Use secrets and environment-specific config in GitHub or .env files:

yaml
Copy
Edit
ENVIRONMENT: DEV / QA / PROD
DATABRICKS_HOST: https://<your-workspace>.azuredatabricks.net
DATABRICKS_TOKEN: ${{ secrets.DATABRICKS_TOKEN }}
📅 Project Plan (Milestones)
See Project_Plan_Metadata_Lakehouse.md for detailed tasks, owners, and timelines.

🔁 Scalability
This project is designed to start with 1M transaction records and scale to 500M+ using batch partitioning and metadata configurations.

✅ Next Steps
 Set up Azure Data Lake folders and upload sample data

 Create Databricks workspace and repo

 Develop and run Bronze + Silver load pipelines

 Add GitHub Actions CI/CD

 Deploy to QA + Production

 Register tables to Unity Catalog

 Add Gold layer transformations

yaml
Copy
Edit

---

### **Project Plan Metadata Lakehouse.md**
