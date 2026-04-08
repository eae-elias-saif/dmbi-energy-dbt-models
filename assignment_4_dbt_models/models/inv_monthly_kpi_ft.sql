{{ config(materialized='view') }}

SELECT
    -- Padding the integer zipcode to 5 digits and extracting the first two for the province
    LEFT(LPAD(zipcode, 5, '0'), 2) AS province_code,
    -- Calculating the average energy consumption
    AVG(energy_active_kwh) AS avg_energy_active_kwh
FROM {{ source('eae', 'inv_invoice_ft') }} AS i
INNER JOIN {{ source('eae', 'con_contract_dim') }} AS c
    ON i.contract_id = c.contract_id
GROUP BY 1