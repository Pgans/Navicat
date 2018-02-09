SELECT * FROM ipd_reg WHERE ADM_DT >= CURDATE() -1;

SELECT * FROM opd_visits WHERE reg_datetime > CURDATE() -1 ;

*******************InsertData********************************
SELECT  *  FROM mb_accidents_fiscal WHERE  datetime_ae >= CURDATE()-2 ;
SELECT * FROM mb_visitsdx WHERE REG_DATETIME > CURDATE();
SELECT * FROM mb_common_cold WHERE REG_DATETIME >CURDATE()-1 ;
SELECT * FROM mb_ipdreg_fiscal WHERE admit_date > CURDATE()-1;
SELECT * FROM mb_deatInHosp WHERE DEATH_DATE > CURDATE()-15 ;
SELECT * FROM mb_dmhit_fiscal WHERE REG_DATE > CURDATE() -3 ;
SELECT * FROM mb_opd_visits_fiscal WHERE REG_DATETIME > CURDATE() ;
SELECT * FROM mb_referout_ipd_fiscal WHERE RF_DT > CURDATE() -2  ;
SELECT * FROM mb_referout_opd_fiscal WHERE RF_DT > CURDATE() -1  ;
SELECT * FROM mb_materials WHERE IVS_DATE > CURDATE() -1;
SELECT * FROM mb_medicine WHERE ADM_DT > CURDATE()-1;
SELECT * FROM mb_newborn_fiscal WHERE BDATE > CURDATE()-20;
SELECT * FROM mb_nbb WHERE BDATE > CURDATE() -20;
SELECT * FROM mb_outstan WHERE MU_DATE >CURDATE() -2; 

*******************InsertDataBig*****************************
SELECT * FROM mb_dsc WHERE DSC_DATE >= '2018-02-07' ;
SELECT * FROM mb_dxopd WHERE REGDATE >='2018-02-06'; 
SELECT * FROM mb_ipddx WHERE ADM_DT > CURDATE() -2;
SELECT * FROM mb_oper_dent WHERE REG_DATETIME > CURDATE()-1 ;
SELECT * FROM mb_operation WHERE REG_DATETIME > CURDATE() -1;
SELECT * FROM mb_refer_ipd WHERE RF_DT > CURDATE() -2;
SELECT * FROM mb_visitsdx WHERE REG_DATETIME > CURDATE() -1;




