SELECT SUBSTR(POLICY_DATA, LOCATE(";", POLICY_DATA, 27)+2, LOCATE(",", POLICY_DATA,27)
- LOCATE(";", POLICY_DATA, 27) -3)
FROM policy