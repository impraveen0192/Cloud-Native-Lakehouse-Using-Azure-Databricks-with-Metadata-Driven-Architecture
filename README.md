# Cloud-Native-Lakehouse-Using-Azure-Databricks-with-Metadata-Driven-Architecture
Cloud-Native Lakehouse Using Azure + Databricks with Metadata-Driven Architecture
📁 50,000 master records

📁 1 million transaction records

💡 Metadata-driven design

💾 CSV/JSON files 

🧱 Full Medallion architecture

🧪 Data quality rules

🔁 test after scaling to 500M records later

🧾 Step 1: Sample Data Models
1. customer_master.csv (Dimension - ~50,000 records to start)
csv
Copy
Edit
customer_id,customer_name,country,customer_segment,email
100001,John Smith,USA,Retail,john.smith@example.com
100002,Mary Jones,Canada,Wholesale,mary.jones@example.com
...
2. sales_transaction.csv (Fact - ~1 million records to start)
csv
Copy
Edit
transaction_id,customer_id,product_id,amount,currency,transaction_date,status
TXN0000001,100001,P001,120.50,USD,2023-10-01,Completed
TXN0000002,100002,P002,500.00,CAD,2023-10-02,Failed
...
3. product_master.json (Optional dimension – JSON format)
json
Copy
Edit
[
  {
    "product_id": "P001",
    "product_name": "Laptop",
    "category": "Electronics",
    "price": 1000.00
  },
  ...
]


Directory Structure in Azure Storage
pgsql
Copy
Edit
📁 bronze/
  ├── sample_data/
  │   ├── customer_master.csv
  │   ├── sales_transaction.csv
  │   └── product_master.json
  └── configs/
      └── metadata.json

📁 silver/
📁 gold/
📁 dq_logs/
