# 🧱 SQL Data Warehouse Project

This project implements a multi-layered data warehouse solution using Microsoft SQL Server. It follows a classic **Bronze → Silver → Gold** architecture for handling raw data ingestion, transformation, and presentation for analytics.

---

## 🗂️ Project Layers

### 1. **Bronze Layer**  
- Raw data is ingested from CSV files using `BULK INSERT`.
- Stored in raw form with minimal/no transformation.

### 2. **Silver Layer**  
- Applies data cleaning, deduplication, formatting, and business logic.
- Transforms raw bronze data into structured, standardized datasets.

### 3. **Gold Layer**  
- Final star schema views for business intelligence.
- Includes fact and dimension tables for reporting and analytics.

---
EXEC Silver.load_silver;
```
(defined in `stored_procedure_silver.sql`)

Transformations include:
- Data cleaning (e.g., trimming strings, standardizing values)
- Null handling and date conversions
- Derived columns (e.g., `cat_id` from `prd_key`)

---

### Create Gold Views (Star Schema)
Creates business-ready views:
- `gold.dim_customers`
- `gold.dim_products`
- `gold.fact_sales`

These views support reporting tools and analytical queries.

---

### ✅ Data Quality Checks

### Silver Layer
Validates:
- Primary key uniqueness
- Nulls and invalid values
- Date range consistency
- String formatting
- Logical data rules (e.g., sales = price × quantity)

---

### Gold Layer
Validates:
- Surrogate key uniqueness
- Referential integrity between fact and dimension views
- Final data model consistency

---

### 🛠️ Stored Procedures

| Procedure | Description |
|----------|-------------|
| `Bronze.load_bronze` | Loads raw data into bronze tables from CSV files |
| `Silver.load_silver` | Transforms and inserts cleansed data into silver tables |

Defined in:
- `stored_procedure_ddl.sql`
- `stored_procedure_silver.sql`

---
