Operations Data Warehouse: Gold Layer Transformations
Project Objective
The objective of this project is to build a Python-based dbt (data build tool) transformation layer. This project creates aggregated tables in the Gold Layer of the Data Warehouse specifically for the Operations team, enabling them to extract business insights with higher efficiency and less manual processing.

Data Models
1. Tariff Metrics (inv_tariff_metrics_ft)
Type: Table

Description: This model tracks financial performance across different tariff structures.

Content: * Calculates the total euros invoiced (total_import_euros).

Groups data by specific tariff codes (tariff_code).

Filter Logic: Includes only contracts categorized as "Individual".

2. Monthly KPI Tracker (inv_monthly_kpi_ft)
Type: Table

Description: Provides a high-level monthly overview of contract volume and revenue.

Content: * Count of distinct invoiced contracts.

Total euros invoiced (total_import_euros).

Granularity: Aggregated by the month of the invoice_date.

3. Province Energy Metrics (inv_province_metrics_ft)
Type: View

Description: An analytical view to understand regional energy consumption patterns.

Content: * Calculates the average active energy (kWh) invoiced per contract.

Grouping: Aggregated by Province.

Logic: Province is derived from the first two digits of the zipcode
