
# 🔍 Financial Transaction Reconciliation Analysis

## 📌 Project Overview
This portfolio project demonstrates reconciliation analysis between two financial systems (**System A** and **System B**).  
The goal is to identify **unmatched transactions, amount mismatches, posting delays, and exposure risks**, using **SQL, Excel, and Power BI–ready outputs**.

This project is designed to reflect **real-world reconciliation work** typically performed in banks and financial institutions.

---

## 🧠 Business Problem
Financial organizations process transactions across multiple systems. Differences between systems can occur due to:
- Missing transactions
- Amount mismatches
- Posting delays
- Data quality issues

This project answers:
- Which transactions are unmatched?
- Where do amount differences exist?
- How long are transactions delayed?
- What is the total financial exposure due to breaks?

---

## 🗂️ Dataset Description

| File Name | Description |
|----------|-------------|
| `System_a_records.csv` | Transaction data from System A |
| `system_b_records.csv` | Transaction data from System B |
| `Transactions.csv` | Master transaction reference |
| `Combined Tables.xlsx` | Excel-based analysis & pivots |
| `Reconciliation Analysis.sql` | SQL scripts for reconciliation |
| `Documentation - Reconciliation Analysis.docx` | Detailed project documentation |

---

## 🛠 Tools & Technologies Used
- **PostgreSQL / SQL**
- **Microsoft Excel**
- **GitHub (Version Control & Portfolio Hosting)**

---

## 🔄 Reconciliation Logic

### 1️⃣ Data Loading
- Imported CSV files into PostgreSQL tables
- Standardized data types (dates, numeric amounts)

### 2️⃣ Matching Logic
- Matched transactions using:
  - Transaction ID
  - Posted Date
  - Amount

### 3️⃣ Identified Breaks
- ❌ Unmatched transactions
- ⚠ Amount mismatches
- ⏳ Posting delays

### 4️⃣ Exposure Analysis
- Calculated total financial exposure
- Derived break percentages

---

## 📊 Key KPIs
- Total Transactions
- Unmatched Transactions
- Break Percentage
- Total Unmatched Exposure
- Average Posting Delay (Days)


---

## 📌 Key Insights
- Identified reconciliation breaks impacting financial exposure
- Highlighted delayed postings affecting settlement timelines
- Improved audit readiness through structured reconciliation

---

## 🚀 How to Run This Project
1. Clone the repository
2. Import CSV files into PostgreSQL
3. Execute `Reconciliation Analysis.sql`
4. Review Excel analysis in `Combined Tables.xlsx`

---

## 👤 Author
**Gaurang Kulkarni**  
Aspiring Data Analyst | SQL | Excel | Power BI  

---
