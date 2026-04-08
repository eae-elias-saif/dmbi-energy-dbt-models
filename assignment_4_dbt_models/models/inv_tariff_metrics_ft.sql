{{ config(materialized='table') }}

SELECT
    c.tariff_code,
    SUM(i.total_import_euros) AS total_euros_invoiced
FROM {{ source('eae', 'inv_invoice_ft') }} AS i
INNER JOIN {{ source('eae', 'con_contract_dim') }} AS c
    ON i.contract_id = c.contract_id
INNER JOIN {{ source('eae', 'con_client_type_dim') }} AS ct
    ON c.client_type_id = ct.client_type_id
WHERE ct.client_type_description = 'Individual'
GROUP BY 1