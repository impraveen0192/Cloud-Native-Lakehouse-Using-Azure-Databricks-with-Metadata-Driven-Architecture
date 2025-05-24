# Cloud-Native Lakehouse Using Azure + Databricks with Metadata-Driven Architecture

## 🚀 Project Overview

This project demonstrates a metadata-driven Lakehouse architecture using Azure Data Lake Gen2 and Databricks. The solution uses the Medallion architecture pattern (Bronze, Silver, Gold layers), emphasizes scalability to 500M+ records, and includes robust data quality (DQ) validation mechanisms.

---

## 📁 Sample Data Models

### 1. `customer_master.csv` (\~50,000 records)

```
customer_id,customer_name,country,customer_segment,email
100001,John Smith,USA,Retail,john.smith@example.com
100002,Mary Jones,Canada,Wholesale,mary.jones@example.com
```

### 2. `sales_transaction.csv` (\~1 million records)

```
transaction_id,customer_id,product_id,amount,currency,transaction_date,status
TXN0000001,100001,P001,120.50,USD,2023-10-01,Completed
TXN0000002,100002,P002,500.00,CAD,2023-10-02,Failed
```

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
```

---

## 📦 Directory Structure in Azure Storage

```
bronze/
  ├── sample_data/
  │   ├── customer_master.csv
  │   ├── sales_transaction.csv
  │   └── product_master.json
  └── configs/
      └── metadata.json
silver/
gold/
dq_logs/
```

---

## 🧾 metadata.json (DQ Rules Example)

```json
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
```

---

## 🔧 Setup Steps

1. **Upload sample data** to Azure Data Lake Gen2 in `bronze/sample_data/`
2. **Set up Databricks workspace** (with Unity Catalog optional)
3. **Mount ADLS Gen2** using `dbutils.fs.mount` or use external location via Unity Catalog
4. **Create utility scripts:**

   * `utils/config_loader.py`
   * `utils/common_functions.py`
5. **Create Notebooks:**

   * `notebooks/bronze_load`
   * `notebooks/silver_load`
   * `notebooks/gold_load` (optional/for future)
6. **Implement Data Quality rules** as defined in `metadata.json`
7. **Run and validate Bronze and Silver load pipelines**

---

## 🛠️ GitHub Actions & DevOps Workflow

### Step 1: GitHub Actions for CI/CD

* Setup `.github/workflows/databricks-deploy.yml`
* Use secrets to store Databricks PAT token and workspace URL
* Deploy notebooks and utils to Databricks repo or workspace using CLI or API

### Step 2: Dev → QA → Prod Deployment

1. **Dev**: Develop and test notebooks locally or in dev branch
2. **QA**:

   * Trigger GitHub Action manually or on PR merge to `qa` branch
   * Use parameterized deployment (e.g., mount paths, target schema)
3. **Production**:

   * Manual approval step before deployment to `prod` branch
   * GitHub Actions promote code + update Unity Catalog if needed

### Step 3: Environment Variables

Use secrets and environment-specific config in GitHub or `.env` files:

```yaml
ENVIRONMENT: DEV / QA / PROD
DATABRICKS_HOST: https://<your-workspace>.azuredatabricks.net
DATABRICKS_TOKEN: ${{ secrets.DATABRICKS_TOKEN }}
```

---

## 📅 Project Plan (Milestones)

See `Project_Plan.md` for detailed tasks, owners, and timelines.

---

## 🔁 Scalability

This project is designed to start with 1M transaction records and scale to 500M+ using batch partitioning and metadata configurations.

---

## ✅ Next Steps

*
