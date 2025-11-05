# 🛒 Amazon Sales Data Analysis — SQL Capstone Project

## 📘 Project Overview
This capstone project aims to gain insights into **Amazon sales data** to understand the various factors influencing sales performance across different branches.  
The project focuses on **product performance**, **sales trends**, and **customer behavior** using SQL for data analysis and feature engineering.

---

## 🎯 Project Objectives
The major goal of this project is to analyze Amazon’s sales transactions to:

- Understand **factors affecting sales** across branches.
- Identify **top-performing product lines** and those needing improvement.
- Discover **sales patterns and trends** across different time frames.
- Analyze **customer segments** and their contribution to overall revenue.

---

## 🧩 Dataset Description

The dataset consists of **1,000 records** and **17 columns**, covering transactions from **three Amazon branches** located in:
- **Mandalay**
- **Yangon**
- **Naypyitaw**

| Column Name | Description | Data Type |
|--------------|-------------|------------|
| invoice_id | Invoice of the sales made | VARCHAR(30) |
| branch | Branch at which sales were made | VARCHAR(5) |
| city | Location of the branch | VARCHAR(30) |
| customer_type | Type of customer | VARCHAR(30) |
| gender | Gender of the customer | VARCHAR(10) |
| product_line | Product line of the product sold | VARCHAR(100) |
| unit_price | Price of each product | DECIMAL(10, 2) |
| quantity | Quantity sold | INT |
| VAT | Tax on the purchase | FLOAT(6, 4) |
| total | Total cost of the purchase | DECIMAL(10, 2) |
| date | Date of purchase | DATE |
| time | Time of purchase | TIMESTAMP |
| payment_method | Method of payment | VARCHAR(30) |
| cogs | Cost of goods sold | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage | FLOAT(11, 9) |
| gross_income | Gross income | DECIMAL(10, 2) |
| rating | Customer rating | FLOAT(2, 1) |

---

## 🧱 Project Workflow

### 1️⃣ Data Wrangling
- Built a relational **database and table structure** using SQL.
- Ensured data integrity by setting `NOT NULL` constraints.
- Verified no missing or null values in the dataset.

### 2️⃣ Feature Engineering
Created three new columns:
- **timeofday:** Morning, Afternoon, Evening (based on purchase time)
- **dayname:** Day of week (e.g., Mon, Tue, Wed)
- **monthname:** Month of year (e.g., Jan, Feb, Mar)

### 3️⃣ Exploratory Data Analysis (EDA)
Performed SQL-based EDA to answer key business questions.

---

## 🧠 Key Business Questions Answered
1. Which product line generated the highest revenue?
2. Which city recorded the highest revenue?
3. Which customer type contributes the most revenue?
4. Which payment method occurs most frequently?
5. What time of day sees the highest sales volume?
6. Which branch exceeds the average number of products sold?
7. Which day and time get the highest customer ratings?

---

## ⚙️ Tools & Technologies Used
- **SQL (MySQL / PostgreSQL)** — Data querying & analysis  
- **DBMS** — Data storage and transformation  
- **Power BI** — Visualization of insights  
- **Excel / CSV** — Data import/export  

---

## 📊 Dashboard Overview

**Dashboard Pages:**
1. **Sales Overview** — KPIs, revenue by branch and city  
2. **Product Analysis** — Performance, VAT, and ratings  
3. **Customer Insights** — Gender, type, and payment trends  
4. **Time-based Analysis** — Sales patterns by time, day, and month  

📁 File: [`reports/amazon_sales_dashboard.pbix`](reports/amazon_sales_dashboard.pbix)

---

## 🧾 Reports

- **Insights Summary Report:** [`reports/insights_summary.pdf`](reports/insights_summary.pdf)
- **Dashboard Guide:** [`powerbi_dashboard_guide.md`](powerbi_dashboard_guide.md)
- **SQL Scripts:**  
  - `sql_scripts/create_table.sql`  
  - `sql_scripts/feature_engineering.sql`  
  - `sql_scripts/eda_queries.sql`  

---

## 📁 Repository Structure

```
📦 Amazon-Sales-Analysis
 ┣ 📂 data
 ┃ ┗ amazon_sales.csv
 ┣ 📂 sql_scripts
 ┃ ┣ create_table.sql
 ┃ ┣ feature_engineering.sql
 ┃ ┗ eda_queries.sql
 ┣ 📂 reports
 ┃ ┗ insights_summary.pdf
 ┣ 📄 powerbi_dashboard_guide.md
 ┗ 📄 README.md
```

---

## 🧩 Key Insights Summary
- **Yangon branch** generates the highest revenue (≈38%).
- **Electronic Accessories** product line performs best.
- **Afternoon** is the peak sales period.
- **E-wallet** is the most used payment method.
- **Members** spend more than normal customers.
- **Friday** receives the highest average customer ratings.

---

## 🧠 Recommendations
- Increase stock for high-demand categories like Electronics and Fashion.
- Promote weaker product lines (e.g., Sports & Travel).
- Expand loyalty programs for members.
- Launch targeted campaigns during afternoon hours.
- Focus feedback collection in evenings and weekends.

---

## 👨‍💻 Author
**Sai Teja Kamidi**  
📧 (saitejreddy1919@gmail.com)  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/saiteja1919)  
---

⭐ *If you found this project helpful, please consider giving it a star on GitHub!*
