-- QUREY 1: to check what (cDNA) platform is used as a single channel one in which exp
SELECT ac.*, platform_type 
FROM view_statistic_exp_array_count AS ac 
     JOIN platform AS pf ON (pf.platform_id = ac.platform_id)
WHERE platform_type != 'affymetrix';
-- Result:
--  GSE10308 (mayz)	in-house array	|	dual-channel reported as single channel ...
--  GSE12756 (mayz)	Agilent	 |	dual-channel reported as single channel ...
--  GSE7034  (mayz)	in-house array	|	Custom made spotted array, not clear why use one dye design
--
-- Conclusion: this happens only in rare cases, and can be detected
--   due to lack of sufficient raw data.  Not a big issue.