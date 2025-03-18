# Revisiting a Published Meta-Analysis: A Data Science Approach to Validity and Reproducibility

## Introduction
This report aimed to review, replicate, and extend the meta-analysis part of the journal article published in Clinical and Experimental Medicine (2024) 24:141, titled as “The potential role of serum amyloid A as biomarker of rheumatic diseases: a systematic review and meta‐ analysis”, by Arduino and Mangoni (2024). 

The meta-analysis was conducted to evaluate the effectiveness of serum amyloid A (SAA) as a biomarker for a range of autoimmune and autoinflammatory diseases/conditions collectively referred to as rheumatic diseases (RDs). The authors included studies that reported on SSA concentrations in patients with RDs compared to healthy controls, as well as in RD patients with active disease versus those who are in remission.

Overall results of this analysis concluded that the SSA as a potential biomarker for RDs, particularly in assessing disease activity and monitoring treatment responses. However, it also emphasized the need for further research to validate these results and investigate the specific function of SAA in different rheumatic conditions.

## Method

The authors detailed the inclusion-exclusion criteria that they utilised for systematic reviews and study selection workflow, supplemented by PRISMA guidelines, check lists, and PRISMA 2020 flow diagram. Additionally, they listed the variables extracted for their analysis.

32 studies were selected in this study where 38 group comparators were analysed, including 2365 RD patients and 1632 healthy controls. By examining characteristics presented in table 1, it is apparent that some of the effect sizes likely to be correlated as a result of using same control group in calculating effect for different disease types (de Seny et al. (a) and (b), Shen et al. (a), (b), (c)). This contradicts the meta-analysis assumption that effect sizes are independent (Cheung, 2019). However, including subgroup analyses that differentiate between disease types addresses the non-independence among effect sizes.

Disease activity was assessed for eight studies involving 500 RDs, including 274 with active disease and 226 in remission.

The software tool named “The Graph Data Extractor” was used to retrieve published medians and interquartile ranges. Moreover, the methods that they employed to calculate means and standard deviations from this data were included in reference. Stata 14 was employed in statistical analysis of this study.

Standardised mean difference (SMD) was chosen to measure SSA level between RD patients and healthy control groups, and RD patients with active disease and remission. The authors did not specify whether Cohen’s d or Hedges’ g was used in estimating the SMD. The Random Effects Model (REM) was applied in the meta-analysis, as illustrated by the forest plots. Furthermore, they did not indicate which estimator was used to calculate the between-study variance (τ2).

Heterogeneity was assessed with Cochran’s Q test where p < 0.10 was considered as statistically significant. To further explain the variability of meta estimate, univariate meta-regression and subgroup analysis was performed for range of study characteristic variables, while many of the variables were not included in data table where they reported that they were insignificant.

Leave-one-out forest plots were provided to illustrate sensitivity of each study involved. Funnel plot was used to visualise publication bias in addition to conducting Begg’s test and Egger’s test to support this claim.
Publication bias, meta-regression, and subgroup analysis were not performed for disease activity due to insufficient number of studies.

## Main findings
Authors provided meta-analysis part of their main findings in following order:

(i) Overall estimate of SMD of SAA level for RD patients compared to healthy control groups was a small effect and statistically significant (SMD = 1.61, 95% CI 1.24–1.98, p < 0.001; I2 = 95.9%, p < 0.001).

(ii) Sensitivity analysis identified two studies affecting the overall meta-analysis. Removal of those studies resulted in reducing the effect size (SMD = 1.06, 95% CI 0.85–1.28, p < 0.001, I2 = 87.7%, p < 0.001).

(iii) Funnel plot analysis illustrated publication bias. This observation was further complemented with Begg’s test (p = 0.001) and Egger’s test (p = 0.002).

(iv) Univariate meta-regression resulted significant association between the effect size and male to female ratio (t = 2.30, p = 0.03) as well as body mass index (BMI) (t = − 2.96, p = 0.02).

(v) Subgroup analysis was conducted and presented as forest plots for different disease types as well as for geographical areas. Moreover, SMD values along with the CI and p values for each category was reported under results.

(vi) SMD of SAA level for RD patients with active disease compared to those who are in remission was a small effect and statistically significant (SMD = 2.17, 95% CI 1.21– 3.13, p < 0.001; I2 = 94.7%, p < 0.001).


## Replication of main findings

The meta-analysis was initially carried out using metafor package in R. SMD was selected as the method to calculate effect sizes. However, REM with restricted maximum likelihood estimator (REML) (default in metafor) resulted a different meta estimate compared to those reported in their result and forest plots. Therefore, Sensitivity analysis was conducted to determine the between study variance estimator that was used (Table 1). The meta estimate and associated confidence interval obtained with DerSimonian-Laird (DL) estimator was closely matched to those reported in their results. Moreover, it is reasonable to assume that they have used DL method for random effect estimator given its popularity.


![Screenshot 2025-03-18 at 22 59 17](https://github.com/user-attachments/assets/a9c5ed18-8ce7-4bc5-a68f-8d5c717cfc07)


The SMD estimates calculated using both escalc {metafor} function and Stata 18 (cohen’s d) were closely comparable to SMD values, and 95% confidence interval (CI) values presented in forest plots. Stata 18 was utilised to replicate all the figures in this report due to its detailed and clear visualization features, which offer advantages over the metafor package in R. In addition, all analysis were conducted in R to cross-validate and inspect the replicated estimates and results.

Two main forest plots presented in this study was replicated along with their leave one out forest plots. (Figures 1, 2, 7, and 8).
Removal of two studies with SMD values over 5 resulted in reducing the effect size to SMD = 1.027 (95% CI 0.811–1.245, I2 = 88.05) and remained significant.

The funnel plot indicated significant publication bias (Figure 3) (Sterne et al., 2011). Removing the two studies with extreme effect sizes followed by Egger’s test further supported this finding (p = 0.0003). Notably, this replicated p-value for Egger’s test differs from the one reported in the original study (p = 0.002).

Meta-regression using male-to-female ratio as a moderator revealed a significant association (β = 0.695, 95% CI [0.016 –1.375]) (Figure 4). The t-value for this association was 2.01 (p = 0.045) (Thompson & Higgins, 2002). However, the authors of the original study reported a t- value of 2.3 (p = 0.03).

The association between effect size and the BMI moderator was not replicated due to the unavailability of data.

The results of the subgroup analyses and the corresponding forest plots for disease types and geographic areas were reproducible, with estimates and confidence intervals closely matching those reported (Figures 5 and 6).





![Fig_2](https://github.com/user-attachments/assets/34d2506e-a9e6-46ce-a5b9-f5f352eab774)

Figure 1: Replication of fig.2 of (Zinellu & Mangoni, 2024): “Forest plot of studies reporting serum amyloid A concentrations”




![Fig_3](https://github.com/user-attachments/assets/ccca031a-48b9-46cc-aa21-ce323d9d60cb)

Figure 2:Replication of fig.3 of (Zinellu & Mangoni, 2024): “Sensitivity analysis of the association between serum amyloid A concentrations and rheumatic diseases”




![Fig_4](https://github.com/user-attachments/assets/6defd09a-0606-4520-adbe-4efa8ea17873)

Figure 3: Replication of fig.4 of (Zinellu & Mangoni, 2024): “Funnel plot of studies investigating the association between serum amyloid A concentrations and rheumatic diseases”.




![Fig_6](https://github.com/user-attachments/assets/341628be-032d-4936-aa98-c7db43399063)

Figure 4: Replication of fig.6 (A) of (Zinellu & Mangoni, 2024): “Bubble plot reporting the univariate meta-regression analysis between the effect size and male to female ratio”.


![Fig_7](https://github.com/user-attachments/assets/e71a3734-45d7-467c-a27c-dfd0555cdfb4)

Figure 5: Replication of fig.7 of (Zinellu & Mangoni, 2024): “Forest plot of studies reporting serum amyloid A concentrations in patients with rheumatic diseases and healthy controls according to disease type”.




![Fig_8](https://github.com/user-attachments/assets/2c6a48ee-9414-4062-9967-36f131ccd163)

Figure 6:Replication of fig.8 of (Zinellu & Mangoni, 2024): “Forest plot of studies reporting serum amyloid A concentrations in patients with rheumatic diseases and healthy controls according to geographical area”.




![Fig_12](https://github.com/user-attachments/assets/d2d97562-a5ed-487f-b549-5bb8fe0f461b)

Figure 7: Replication of fig.12 of (Zinellu & Mangoni, 2024): “Forest plot of studies reporting serum amyloid A concentrations in patients with rheumatic diseases with active disease and patients in remission”.


![Fig_13](https://github.com/user-attachments/assets/35ba635e-0555-4e1c-a76b-e2bfea14f11f)

Figure 8: Replication of fig.13 of (Zinellu & Mangoni, 2024): “Sensitivity analysis of the association between serum amyloid A concentrations and the presence of active disease”.

## Limitations

For a meta-analysis comparing the means of two independent groups, a most common method involves using SMD for effect size. This approach assumes that the population variances of two arms are equal in every study. If the population variances differ, however, the validity of the meta-analysis may be compromised, and the interpretation of the meta-estimated effect could become unreliable (Prendergast & Staudte, 2016).
In order to test for this assumption, meta-analysis of log ratios of variances was conducted with REML estimator. The estimated log of ratio of variance is 3.434 with associated 95% confidence interval (2.509 – 4.360). This estimate is significantly different to zero. Therefore, we have statistical evidence to suggest that sample variances are significantly different in given studies. In addition, the test for heterogeneity (Cochrane’s Q) is significant (p-value < 0.001). Therefore, we have evidence of heterogeneity among studies. Given both pieces of evidence, use of SMD for meta-analysis in this scenario is not justifiable.

The sensitivity analysis presented in Table 1 reveals that the DL and Hunter-Schmidt (HS) estimators yield equivalent results, as do the Maximum Likelihood (ML), REML, and Hedge’s (HS) estimators for this study. Additionally, differences greater than 0.22 were observed in the meta-estimates, with the associated confidence intervals were being wider in latter group. Furthermore, the I2 value varied by more than 3.5% between these two groups of estimators.

Notably, REML estimator was preferred over DL estimator based on the simulated results reported by Viechtbauer (2005). Moreover, REML estimator is the default method in both the metafor package and Stata 18.

## Extensions

In an attempt to address the violation of the equal variance assumption, it is justifiable to employ less conventional effect size in meta-analysis, such as the log ratio of means (log RoM), where the equal variance assumption is not required (Prendergast & Staudte, 2016). Given that means of SAA concentration cannot be observed in negative domain, use of log RoM by replacing SMD is appropriate.

Meta estimate of log RoM (with REML estimator) for mean SAA level of RD patients compared to healthy control groups remained significant (log RoM = 1.403, 95% CI [1.084 – 1.722], Q = 33285.9618, p < 0.0001; I2 = 99.81) (Figure 9). Transformed into ratio scale, RoM resulted as 4.07 with 95% CI 2.96 – 5.59. However, the 95% prediction interval for the RoM ranged from 0.596 to 27.743 and included 1.


![logRoM plot](https://github.com/user-attachments/assets/edbf014b-c643-4c83-a461-3593476efaa3)

Figure 9: Forest plot of log Ratio of Means (log RoM) serum amyloid A concentrations between patients with rheumatic diseases and healthy controls.

## Conclusion
Forest plots, leave-one-out forest plots, and subgroup analysis presented in this study were successfully replicated, with closely matching meta-estimates and confidence intervals. However, the test statistic and p-value for the meta-regression analysing the association between SMD and the male-to-female ratio moderator were not replicated. Despite this, the statistical significance of the analysis remained unchanged.

The expected ratio of mean SAA levels between RD patients and healthy control groups was significant at the 95% confidence level. Therefore, the extension presented in this report was aligned with the results of original study, suggesting significantly elevated levels of SAA in RD patients compared to healthy controls. Moreover, the prediction interval of RoM suggested that the ratio of mean SAA levels between RD patients and healthy control groups for any randomly selected study was ranged from 0.596 to 27.743 for 95% of the time.


## References

Cheung, M. W.-L. (2019). A Guide to Conducting a Meta-Analysis with Non-Independent Effect Sizes. Neuropsychology Review, 29(4), 387–396. https://doi.org/10.1007/s11065-019- 09415-6

Prendergast, L. A., & Staudte, R. G. (2016). Meta-analysis of ratios of sample variances. Statistics in Medicine, 35(11), 1780–1799. https://doi.org/10.1002/sim.6838

Sterne, J. A. C., Sutton, A. J., Ioannidis, J. P. A., Terrin, N., Jones, D. R., Lau, J., Carpenter, J., Rucker, G., Harbord, R. M., Schmid, C. H., Tetzlaff, J., Deeks, J. J., Peters, J., Macaskill, P., Schwarzer, G., Duval, S., Altman, D. G., Moher, D., & Higgins, J. P. T. (2011). Recommendations for examining and interpreting funnel plot asymmetry in meta-analyses of randomised controlled trials. BMJ, 343(jul22 1), d4002–d4002. https://doi.org/10.1136/bmj.d4002

Thompson, S. G., & Higgins, J. P. T. (2002). How should meta‐regression analyses be undertaken and interpreted? Statistics in Medicine, 21(11), 1559–1573. https://doi.org/10.1002/sim.1187

Viechtbauer, W. (2005). Bias and Efficiency of Meta-Analytic Variance Estimators in the Random-Effects Model. Journal of Educational and Behavioral Statistics, 30(3), 261–293. https://doi.org/10.3102/10769986030003261

Zinellu, A., & Mangoni, A. A. (2024). The potential role of serum amyloid A as biomarker of rheumatic diseases: A systematic review and meta-analysis. Clinical and Experimental Medicine, 24(1), 141. https://doi.org/10.1007/s10238-024-01413-0
