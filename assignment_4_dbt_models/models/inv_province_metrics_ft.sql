{{ config(materialized='table') }}

SELECT
    -- Grouping by the month of the invoice date
    DATE_FORMAT(invoice_date, '%Y-%m-01') AS invoice_month,
    -- Number of distinct invoiced contracts
    COUNT(DISTINCT contract_id) AS distinct_contracts,
    -- Total euros invoiced
    SUM(total_import_euros) AS total_euros_invoiced
FROM {{ source('eae', 'inv_invoice_ft') }} 
GROUP BY 1