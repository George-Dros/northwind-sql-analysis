# Business Insights Summary

This document summarizes key findings from the SQL analysis of the Northwind database. The analysis was structured around four core business themes: customer behavior, sales trends, product performance, and operational efficiency.

Each insight was derived using SQL queries that explored the relationships and patterns across multiple tables, simulating the tasks of an entry-level data analyst.

---

## Customer Behavior & Segmentation

- The top 5 customers by total spending include **B's Beverages**, **Hungry Coyote Import Store**, **Rancho grande**, **Gourmet Lanchonetes**, **Ana Trujillo Emparedados y helados**.
- The countries with the most customers are **USA**, with 13, **Germany** with 11, and **France** with 11 as well.
- The average number of orders per customer is approximately **175.08**.
- **100.0%** of customers have placed more than one order.
- The top 3 cities by total sales value are **London, UK**, **México D.F.**, and **Sao Paulo, Brazil**, indicating potential target regions.
---

## Sales Trends & Revenue Insights

- Monthly revenue trends show that **Month 8, (August)** was the highest performing, with **$41,515,922.35** in sales.
- The average order value per month ranges from **$28770.56 to $25891.52**, with notable peaks in **Month 8, (August)**.
- The month with the most orders was **Month 3, (March)**, with **1446** total orders placed.
- Yearly revenue shows that **Year 2015** was the strongest, while **Year 2012** had the lowest performance.
- The overall average order value across all orders is approximately **$27538.79**.
---

## Product & Category Performance

- The top 10 products by total revenue include **Côte de Blaye**, **Thüringer Rostbratwurst**, and **Mishi Kobe Niku**.
- The highest-revenue categories are **Beverages**, **Confections**, and **Meat/Poultry**.
- The average unit price per category ranges from **$37.98** to **$20.68**, with **Beverages** having the highest.
- The product with the highest quantity sold is **Louisiana Hot Spiced Okra**, with **206213** units sold.
- A total of **0** products sold fewer than 5 units.
---

## Operational Insights & Logistics

- **Peacock Margaret** processed the most orders, completing **1908** distinct orders.
- On average, it takes **7.84 days** between the order and shipment date.
- **United Package** handled the most deliveries, fulfilling **5486** orders.
- The shipper with the slowest delivery time **Speedy Express** averages a delay of **7.92 days**, while the fastest, **United Package** averages **7.78 days** of delay.
- The employee who generated the highest total revenue is **Peacock Margaret**, contributing approximately **$51,488,395.2** in sales.
---

## Conclusion

This analysis demonstrates how SQL can be used to extract actionable insights from raw transactional data. The Northwind database, though fictional, presents a realistic environment for analyzing customer trends, business performance, and operations through structured queries and data logic.

