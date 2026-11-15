# E-commerce Sales Analysis

A beginner-friendly portfolio project demonstrating how to organise a Data Analyst project using CSV data, SQL, Python and a dashboard preview.

> **Dataset note:** `data/sales_data.csv` is a synthetic educational dataset generated for this project. It contains 1,200 transaction rows and should not be described as real company data.

## Business problem
Explore sales performance and answer questions such as:
- How much revenue and profit were generated?
- Which categories and regions contribute most?
- How does revenue change month by month?
- Which products and customers have the highest revenue?

## Repository contents
```text
ecommerce-sales-analysis/
├── data/
│   └── sales_data.csv
├── sql/
│   └── analysis.sql
├── notebooks/
│   └── sales_analysis.ipynb
├── dashboard/
│   ├── dashboard_preview.png
│   └── create_dashboard.py
├── screenshots/
│   └── dashboard_preview.png
├── README.md
└── requirements.txt
```

## Tools
- PostgreSQL (SQL examples)
- Python, pandas, NumPy, Matplotlib
- Power BI can be used to recreate the dashboard interactively

## Key results from the included sample data
- Revenue: **$92,212.22**
- Profit: **$41,566.22**
- Orders: **1,200**
- Unique customers: **338**
- Profit margin: **45.08%**
- Highest-revenue month: **2025-02**
- Highest-revenue category: **Furniture**
- Highest-revenue product: **Office Chair**

These are calculated from the included synthetic CSV. Re-run the notebook or SQL queries to verify them.

## How to use the project

### 1. Download the data
Use `data/sales_data.csv`.

### 2. Run the Python notebook
Install the libraries:
```bash
pip install -r requirements.txt
```
Open `notebooks/sales_analysis.ipynb` in Jupyter Notebook or VS Code and run the cells from top to bottom.

### 3. Run the SQL
Create a PostgreSQL database and import `data/sales_data.csv` into a table named `sales`. Then run queries from `sql/analysis.sql`.

For a quick local practice session, you can also import the CSV into SQLite, but PostgreSQL-specific syntax such as `DATE_TRUNC` and `::numeric` will need adjustment.

### 4. View the dashboard
Open `dashboard/dashboard_preview.png`. It is a static preview generated with Python, not a Power BI `.pbix` file.

To make an interactive Power BI dashboard:
1. Open Power BI Desktop.
2. Select **Get data → Text/CSV**.
3. Select `data/sales_data.csv`.
4. Load the data.
5. Create cards for Revenue, Profit, Orders and Profit Margin.
6. Add a line chart for monthly revenue and bar charts for category and region.
7. Save your `.pbix` file in the `dashboard/` folder if you choose to share it.

## Limitations
This is a practice dataset, not a statistically representative sample of a real business. Findings are for demonstrating analysis workflow, not for making real business decisions.

## Author
Add your name and profile link here.
