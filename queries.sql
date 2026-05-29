# Amazon Sales Data Pipeline

ETL pipeline and SQL analytics for Amazon e-commerce sales data.

## Project Overview

Pet project built as a portfolio piece for a Junior Data Engineer position.
Demonstrates core data engineering skills: ETL pipeline, database design, and SQL analytics.

## Dataset

- **Source:** [E-Commerce Sales Dataset](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data)
- **Size:** 128,975 orders
- **Domain:** Amazon India e-commerce sales

## Tech Stack

- **Database:** MySQL 8.0
- **Language:** Python 3.13
- **Libraries:** pandas, SQLAlchemy
- **Tools:** MySQL Workbench, VS Code, Git

## Database Schema

| Table | Description |
|-------|-------------|
| `staging_amazon` | Raw data loaded from CSV |
| `orders` | Cleaned orders table |
| `products` | Product dimension table (7,200 unique SKUs) |
| `shipping` | Shipping dimension table |

## ETL Pipeline

`adema_etl.py` implements ETL pipeline:

- **Extract:** Reads CSV with 128,975 rows
- **Transform:** Cleans columns, fixes data types
- **Load:** Loads into MySQL staging table

```bash
python adema_etl.py
```

## SQL Analytics

`queries.sql` contains 5 analytical queries:

1. Sales by product category (GROUP BY, aggregations)
2. Top-10 states by revenue (JOIN, filtering)
3. Order status distribution (window functions)
4. Cancellation rate by state (CTE)
5. Category report stored procedure

## Key Findings

- **Set** is top category: 39.2M revenue, 50,284 orders
- **60%** of orders successfully shipped
- **14%** cancellation rate — key metric to monitor
- **Kurta** avg order value: 455 INR