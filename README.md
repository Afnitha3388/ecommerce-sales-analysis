# 🛒 E-Commerce Sales Performance Analysis 

## 📊 Project Overview
SQL analysis of TechHub electronics store sales data to identify customer patterns, 
product performance, and revenue trends to help management make strategic decisions.

## 🎯 Business Problem
TechHub Germany experienced an 18% sales decline in January 2025. 
Management needed to understand:
- Which customers are valuable vs at-risk?
- Which products are performing well or failing?
- Are discounts working or hurting profit?
- Where should we focus retention efforts?

## 🗄️ Database Structure
4 related tables:
- **customers** (30 records) - Customer demographics and segments
- **products** (15 records) - Product catalog with categories
- **orders** (50 records) - Order transactions with discount info
- **order_items** (67 records) - Individual items per order

## 📈 Analyses Performed
| # | Analysis | SQL Skills Used |
|---|----------|-----------------|
| 1 | Customer Value Segmentation | JOIN, GROUP BY, CASE WHEN |
| 2 | Product Performance Ranking | RANK() Window Function |
| 3 | Monthly Sales Trend | LAG() Window Function, CTEs |
| 4 | Discount Effectiveness | CASE WHEN Grouping |
| 5 | Customer Retention Analysis | MIN/MAX, PARTITION BY |
| 6 | City-wise Performance | RANK(), Aggregations |
| 7 | Product Category Analysis | Multiple CTEs, Percentages |
| 8 | Cross-sell Pattern Detection | STRING_AGG, Complex JOINs |

## 🔍 Key Findings
- **Top 11 customers (37%) generate 71% of revenue** - VIP program needed
- **Laptop Pro 15 = 57% of total revenue** - over-dependent on one product!
- **January sales dropped 18%** - seasonal pattern, needs promotion strategy
- **Medium discounts (6-10%) most effective** - cap large discounts
- **16.7% customers at risk of churning** - re-engagement campaign needed
- **Wireless Mouse naturally bundles with Laptops** - create bundle offers
- 
## 💡 Business Recommendations
1. Launch VIP program for top 11 customers
2. Create "Complete your setup" bundle (Laptop + Mouse + Keyboard)
3. January promotion to counter seasonal slump
4. Cap discounts at 10% maximum
5. Upsell accessories to low-value customers
6. Re-engagement campaign for at-risk customers

## 🛠️ Tools Used
- **Database:** PostgreSQL
- **Language:** SQL
- **Concepts:** Window Functions, CTEs, Subqueries, Aggregations, Date Functions

## 📁 Files
- `ecommerce_analysis.sql` - All 8 SQL queries with insights
- `README.md` - Project documentation

## 👤 About
Data analyst portfolio project.
Learning data analysis to transition into a data analyst role in Germany.
```


