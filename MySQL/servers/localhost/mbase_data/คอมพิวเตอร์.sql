SELECT inventory.IVT_NAME, ivt_requests.IREQ_DATE
FROM ivt_requests, ivt_categories, inventory,ivt_req_details 
WHERE ivt_categories.ivc_id= inventory.ivc_id
AND ivt_req_details.ivt_id = inventory.ivt_id
AND ivt_requests.ireq_id = ivt_requests.ireq_id
AND ivt_categories.ivc_id = '04'
AND ivt_requests.ireq_date BETWEEN '20130101' AND '20140330'
GROUP BY inventory.IVT_NAME; 