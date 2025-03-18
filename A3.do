
*********************************************************************************
*********************************************************************************
*By Prasanthika Kumarasiri
*10/09/2024
*********************************************************************************
*********************************************************************************




* clear command
clear


*!! Define the global macro with the file directory containing .csv data files created in R 


global mydir "/Users/prasanthi/Desktop/MA/A3"




*********************************************************************************
* Replicate fig.2 "Forest plot of studies reporting serum amyloid A concentrations 
*in patients with rheumatic diseases and healthy controls"
*********************************************************************************



* read data
  
import delimited "${mydir}/table_1.csv", clear
 

* browse data 
br



* prepare data for meta analysis with cohen's d as an effect sizes and 
* random-effects meta-analysis with DerSimonian–Laird estimator

meta esize n1 mean1_rd sd1 n2 mean2_ctrl sd2,  esize(cohend) random( dlaird ) studylabel(study_name1)



* meta-analysis summary results display in a table
meta summarize

* forestplot
meta forestplot  _id  year _plot _esci _data _weight, esrefline nullrefline insidemarker columnopts(_data1, supertitle(RD)) cibind(parentheses) columnopts(_esci, format(%6.3f)) columnopts(_weight, mask(%6.1f%%) title(Weight) supertitle(""))

* save forestplot
graph save "Graph" "${mydir}/Fig_2.gph" ,replace


*********************************************************************************
*********************************************************************************



*********************************************************************************
* Replicate fig.3 "Sensitivity analysis of the association between 
* serum amyloid A concentrations and rheumatic diseases"
*********************************************************************************

meta forestplot, leaveoneout

* save forestplot
graph save "Graph" "${mydir}/Fig_3.gph", replace




*********************************************************************************
*********************************************************************************



*********************************************************************************
* PUBLICATION BIAS
*********************************************************************************


*********************************************************************************
* Replicate fig.4 "Funnel plot of studies investigating the association between 
* serum amyloid A concentrations and rheumatic diseases"
*********************************************************************************

  
* read data 
import delimited "${mydir}/table_1.csv", clear

* meta analysis
meta esize n1 mean1_rd sd1 n2 mean2_ctrl sd2,  esize(cohend) random( dlaird ) studylabel(study_name1)

* funnel plot
meta funnelplot


* save funnel-plot
graph save "Graph" "${mydir}/Fig_4.gph" ,replace

*********************************************************************************

*********************************************************************************
* Replicate Begg's test and Egger's test 
*********************************************************************************


* remove studies with meta estimate larger than 5

drop if _meta_es > 5

* Begg's test for publication bias
meta bias, begg

* Egger's test for publication bias
meta bias, egger



*********************************************************************************
*********************************************************************************



*********************************************************************************
* SUBGROUP ANALYSIS
*********************************************************************************

*********************************************************************************
* Replicate fig.8 "Forest plot of studies reporting serum amyloid A concentrations in patients with rheumatic diseases and healthy controls according to geographical area"
*********************************************************************************


* read data
  
import delimited "${mydir}/table_1.csv", clear

* meta analysis
meta esize n1 mean1_rd sd1 n2 mean2_ctrl sd2,  esize(cohend) random( dlaird ) studylabel(study_name1)

*forestplot with geographical area subgroup analysis 
meta forestplot _id  year _plot _esci _data _weight, subgroup(continent) esrefline nullrefline insidemarker columnopts(_data1, supertitle(RD)) cibind(parentheses) columnopts(_esci, format(%6.3f)) columnopts(_weight, mask(%6.1f%%) title(Weight) supertitle(""))


* save forestplot
graph save "Graph" "${mydir}/Fig_8.gph", replace




*********************************************************************************
*********************************************************************************



*********************************************************************************
* Replicate fig.7 Forest plot of studies reporting serum amyloid A concentrations 
*in patients with rheumatic diseases and healthy controls according to disease type
*********************************************************************************


*count the number of studies in each disease_type1 subgroup
bysort disease_type1 : egen num_studies = count(study_name1)

*create a variable to store subgroups with more than 1 studies
gen keep_group = num_studies > 1

*keep only the subgroups with more than 1 studies
keep if keep_group == 1

*forestplot with disease type subgroup analysis 
meta forestplot _id  year _plot _esci _data _weight, subgroup(disease_type1) esrefline nullrefline insidemarker columnopts(_data1, supertitle(RD)) cibind(parentheses) columnopts(_esci, format(%6.3f)) columnopts(_weight, mask(%6.1f%%) title(Weight) supertitle(""))

* save forestplot
graph save "Graph" "${mydir}/Fig_7.gph", replace



*********************************************************************************
*********************************************************************************




*********************************************************************************
* META REGRRESSION

* Replicate fig.6 (A)
*********************************************************************************


* read data
  
import delimited "${mydir}/table_1.csv", clear

* meta analysis
meta esize n1 mean1_rd sd1 n2 mean2_ctrl sd2,  esize(cohend) random( dlaird ) studylabel(study_name1)

* remove if male to female ratio is 0
drop if malefemale_ratiordctr == 0

* meta regression
meta regress malefemale_ratiordctr


* bubble plot
estat bubbleplot

* remove studies with meta estimate is over 5
drop if _meta_es > 5

* meta regression
meta regress malefemale_ratiordctr


* bubble plot
estat bubbleplot

* save plot
graph save "Graph" "${mydir}/Fig_6.gph" ,replace



*********************************************************************************
*********************************************************************************





*********************************************************************************
* Replicate fig.12 "Forest plot of studies reporting serum amyloid A concentrations in patients with rheumatic diseases with active disease and patients in remission"
*********************************************************************************


* read data from table 3
  
import delimited "${mydir}/table_3.csv", clear 

* browse and examine data set
br


*prepare data for meta analysis with cohen's d as an effect size and 
*random-effects meta-analysis DerSimonian–Laird estimator

meta esize n1_activerd mean1_activerd sd1_activerd n2_remissionrd mean2_remissionrd sd2_remissionrd,  esize(cohend) random( dlaird ) studylabel(study_name3)



* meta-analysis summary results display in a table
meta summarize

* forestplot
meta forestplot  _id  year _plot _esci _data _weight, esrefline nullrefline insidemarker columnopts(_data1, supertitle(RD)) cibind(parentheses) columnopts(_esci, format(%6.3f)) columnopts(_weight, mask(%6.1f%%) title(Weight) supertitle(""))



* save forestplot
graph save "Graph" "${mydir}/Fig_12.gph", replace




*********************************************************************************
* Replicate fig.13 "Sensitivity analysis of the association between serum amyloid A concentrations and the presence of active disease"
*********************************************************************************


meta forestplot, leaveoneout

* save forestplot
graph save "Graph" "${mydir}/Fig_13.gph" ,replace




*********************************************************************************
*********************************************************************************




*********************************************************************************
* EXTENSIONS
*********************************************************************************


* read data with log Rom effect sizes and associated variances.
  
import delimited "${mydir}/lg_rom_effects.csv", clear 

* prepare data for meta analysis

meta set yi se, studylabel(study_name1) eslabel(logRoM)



* obtain basic meta-analysis summary results and display them in a table:
meta summarize

*forestplot
meta forestplot  _id  year _plot _esci  _weight, esrefline nullrefline insidemarker  cibind(parentheses) columnopts(_esci, format(%6.3f)) columnopts(_weight, mask(%6.1f%%) title(Weight) supertitle(""))


*********************************************************************************
*********************************************************************************

log close

*********************************************************************************
*********************************************************************************
