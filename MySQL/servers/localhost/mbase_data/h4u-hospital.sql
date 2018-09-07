SELECT
    a.offid as provider_code, b.HOSP_NAME as provider_name
    FROM gcoffice a , hospitals b
    WHERE a.offid = b.HOSP_ID 