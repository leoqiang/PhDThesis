-- SECTION 1. MySQL based statistics


-- QUERY 1: to check what (cDNA) platform is used as a single channel one in which exp
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


-- QUERY 2: check the platform associated with a experiment

SELECT DISTINCT experiment_access_id, GROUP_CONCAT(DISTINCT platform_access_id) 
FROM expdata_salmon.view_experiment_array_hybridization 
WHERE data_source = 'ArrayExpress' GROUP BY experiment_access_id;







-- SECTION 2. temporary parsing file based statistics

-- QUERY 1: count the number of samples rawvalues obtained from
--          supplemantary files

-- to check the content of 'rawdata_source'
grep 'rawdata_source' -A2 *.xml | grep -v '<' | cut -d" " -f10 | less

-- count one case: 'Supplefile' 'OriginAUTO', etc; 4 possible cases, check record.rb
grep 'rawdata_source' -A2 *.xml | grep -v '<' | grep 'Supplefile' | cut -d" " -f10 | wc -l




-- SECTION 3. raw data file checking

-- check raw data files in ArrayExpress ziped raw file 
find sente/ArrayExpress/rawdata/ -name "*raw*" -print0 | xargs -I{} -0 unzip -l {} | less