
* ALTER TABLE `person` ADD COLUMN `TELEPHONE`  varchar(15) NULL AFTER `D_UPDATE`, ADD COLUMN `MOBILE`  varchar(15) NULL AFTER `TELEPHONE`;

* ALTER TABLE `dhdc_tmp_person`ADD COLUMN `TELEPHONE`  varchar(15) NULL AFTER `D_UPDATE`, ADD COLUMN `MOBILE`  varchar(15) NULL AFTER `TELEPHONE`;

* ALTER TABLE address  DROP COLUMN telephone , mobile ;
* ALTER TABLE `address` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;
* ALTER TABLE `dhdc_tmp_address` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

* ALTER TABLE `death` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;
* ALTER TABLE `dhdc_tmp_death` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

* ALTER TABLE `chronic` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;
* ALTER TABLE `dhdc_tmp_chronic` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

ALTER TABLE `card` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

ALTER TABLE `dhdc_tmp_card` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

ALTER TABLE `disability` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

ALTER TABLE `dhdc_tmp_disability` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;

ALTER TABLE `women` ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_women`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `drugallergy`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_drugallergy`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `functional`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_functional`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `icf`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_icf`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `service`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_service`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `diagnosis_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_diagnosis_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `diagnosis_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_diagnosis_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `drug_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_drug_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `drug_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_drug_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `procedure_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_procedure_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `procedure_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_procedure_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `charge_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_charge_opd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `charge_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_charge_ipd`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `surveillance`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_surveillance`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `accident`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_accident`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `labfu`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_labfu`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `chronicfu`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_chronicfu`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `appointment`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_appointment`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dental`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_dental`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `rehabilitation`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_rehabilitation`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `ncdscreen`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_ncdscreen`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `fp`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_fp`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `prenatal`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_prenatal`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `anc`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_anc`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `labor`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_labor`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `postnatal`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_postnatal`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `newborn`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_newborn`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `newborncare`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_newborncare`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `epi`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_epi`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `nutrition`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_nutrition`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `specialpp`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_specialpp`
ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `community_service`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `dhdc_tmp_community_service`

ADD COLUMN `CID`  varchar(13) NULL AFTER `D_UPDATE`;



ALTER TABLE `admission`

ADD COLUMN `CID`  varchar(13) NULL AFTER `GROUPER_VERSION`;