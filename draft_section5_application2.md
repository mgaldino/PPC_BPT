# 5. Application 2: Conservation Interventions and Deforestation in São Félix do Xingu

The first application (Section 4) demonstrated the qualitative PPC workflow on a compact case from the political science tradition of BPT. This section applies the same workflow to a case from the policy evaluation tradition --- Brandao, Befani, Soares-Filho, Rajao, and Garcia's (2023) Bayesian process-tracing analysis of conservation interventions in the Brazilian Amazon. The case differs from the Chilean tax reform in three important respects: it comes from the "Contribution Tracing" variant of BPT rather than the Fairfield-Charman weight-of-evidence tradition; it involves a substantially larger evidence base (31 items rather than 6); and it evaluates not one causal claim but six distinct intervention theories simultaneously. These differences allow us to examine how the PPC workflow performs at scale and across a different methodological tradition.


## 5.1 The Case: Conservation Interventions and Deforestation in São Félix do Xingu

### The empirical setting

São Félix do Xingu is a municipality in the southeastern corner of Pará state, in the heart of the Brazilian Amazon's "arc of deforestation." It is, by some measures, the single most important site for understanding Amazonian deforestation: between 2000 and 2019, it consistently ranked among the top three municipalities in absolute forest loss, and it has long hosted the largest bovine herd in the Brazilian Amazon, with approximately 2.4 million head of cattle. The municipality is enormous --- roughly 84,000 km², an area larger than Austria --- and encompasses a complex mosaic of land uses: indigenous territories (including the Kayapó and Apyterewa reserves), federal conservation units (the Terra do Meio Ecological Station, Serra do Pardo National Park), INCRA settlement projects, large and medium cattle ranches, and smallholder farms. The deforestation frontier in São Félix do Xingu has been driven primarily by cattle ranching, with secondary contributions from illegal logging and, to a lesser extent, soybean expansion in more recently consolidated areas.

Beginning in the mid-2000s, a series of overlapping policy interventions sought to curb deforestation in the municipality. In 2008, São Félix do Xingu was placed on the federal government's "lista suja" (blacklist) of municipalities with the highest deforestation rates --- a designation that triggered automatic credit restrictions, intensified enforcement, and reputational pressure. The municipality subsequently became a site of intense activity by government agencies (IBAMA, ICMBio, the Pará state environmental agency SEMA), international NGOs (The Nature Conservancy, which launched its Sustainable Landscapes Pilot Program there in 2009), and market-based initiatives (the TAC da Carne cattle agreements, the Soy Moratorium). By the time Brandao et al. (2023) conducted their analysis, at least six distinct types of intervention had been deployed in the municipality over more than a decade.

### The original BPT analysis

Brandao, Befani, Soares-Filho, Rajao, and Garcia (2023) apply Bayesian process tracing --- specifically, Befani's "Contribution Tracing" variant --- to assess the effectiveness of six categories of conservation interventions in São Félix do Xingu over the period 2006--2019:

1. **Institution of protected areas** --- the creation and demarcation of indigenous territories and conservation units as physical and legal barriers to deforestation.
2. **Environmental monitoring and enforcement** --- satellite-based detection of deforestation (via INPE's PRODES and DETER systems) coupled with field enforcement operations by IBAMA and ICMBio.
3. **Credit restrictions** --- the denial of subsidized agricultural credit to producers in blacklisted municipalities or on properties with environmental irregularities, implemented through Brazil's central bank regulations and the CAR (Cadastro Ambiental Rural) system.
4. **Commodity agreements** --- market-based instruments including the TAC da Carne (cattle conduct adjustment agreements negotiated between the Ministério Público Federal and major slaughterhouses) and the Soy Moratorium (an industry-led commitment to avoid purchasing soy from recently deforested areas).
5. **Multi-stakeholder initiatives** --- collaborative governance arrangements including the Programa Municípios Verdes (Green Municipalities Program) and municipal-level pacts involving local government, producers, and civil society organizations.
6. **Value chain projects** --- sustainable supply chain initiatives aimed at providing economic alternatives to deforestation-dependent livelihoods.

For each intervention, the authors decompose the theory of change into specific contribution claims --- statements of the form "intervention X contributed to outcome Y through mechanism Z" --- and test each claim against available evidence. This decomposition is characteristic of the Contribution Tracing approach (Befani and Stedman-Bryce 2017; Befani 2020), which adapts process tracing for policy evaluation by structuring the analysis around the causal links in a program's theory of change rather than around competing hypotheses in the Fairfield-Charman sense.

### Evidence and likelihood specification

The analysis draws on 31 individual pieces of evidence, assembled from a combination of quantitative data (satellite-derived deforestation statistics from PRODES, credit and economic records), qualitative data (semi-structured interviews with local stakeholders, policy documents), and mixed sources (administrative records from IBAMA and other agencies, field observations). Each piece of evidence is assessed for its bearing on the relevant contribution claim using two parameters:

- **Sensitivity** ($P(\text{evidence observed} \mid \text{claim is true})$): the probability that the evidence would be observed if the intervention did in fact contribute to the outcome as theorized. High sensitivity means the evidence is a reliable indicator --- if the claim is true, we would almost certainly see this evidence.

- **Specificity** ($P(\text{evidence not observed} \mid \text{claim is false})$), or equivalently, the Type I error rate ($1 - \text{specificity} = P(\text{evidence observed} \mid \text{claim is false})$): the probability of *not* observing the evidence if the claim is false. High specificity means the evidence is distinctive --- observing it would be surprising if the claim were false.

These two parameters are the diagnostic analogues of the likelihood ratios used in the Fairfield-Charman tradition, expressed in a format borrowed from medical diagnostic testing. The Bayes formula is then applied sequentially: starting from an uninformative prior of 0.5 (reflecting "no prior information" about whether each contribution claim is true), the posterior probability is updated as each piece of evidence is incorporated. [VERIFY: Confirm that the paper uses 0.5 as the prior for all contribution claims and that updating is sequential rather than simultaneous.]

### Key findings

The original analysis yields several substantive conclusions about the effectiveness of different intervention types in São Félix do Xingu [VERIFY: Confirm specific posterior values from the paper]:

- **Protected areas** received strong evidential support as effective barriers to deforestation, particularly in indigenous territories where community governance mechanisms reinforced the legal protection. The posterior probability for the contribution claim was high.

- **Environmental monitoring and enforcement** showed mixed results: satellite detection (PRODES/DETER) was assessed as highly effective at identifying deforestation, but the translation of detection into effective enforcement was hampered by resource constraints, institutional fragmentation, and --- especially after 2019 --- political interference. The posterior reflected this disjunction between monitoring capacity and enforcement outcomes.

- **Credit restrictions** were supported by evidence of reduced credit flows to blacklisted producers, but the causal link between credit denial and actual behavioral change was weaker, as producers found alternative financing channels or shifted to less credit-dependent activities.

- **Commodity agreements** (TAC da Carne, Soy Moratorium) showed evidence of effectiveness for large-scale, export-oriented producers but limited reach among smaller producers and those selling to domestic markets. The posterior was moderate.

- **Multi-stakeholder initiatives** received mixed evidential support: participation in the Green Municipalities Program was associated with reputational benefits and some institutional capacity building, but the evidence linking these processes to actual deforestation reductions was limited.

- **Value chain projects** received the weakest evidential support, with limited evidence that sustainable livelihood alternatives had been adopted at scale.

A cross-cutting finding was that intervention effectiveness varied across two dimensions: the type of deforestation frontier (active vs. consolidated) and the type of landholder (smallholder vs. medium-to-large). Regulatory interventions were more effective for large holders in consolidated areas, while combinations of regulatory and market-based interventions showed greater promise in active frontiers.


## 5.2 Applying the Qualitative PPC Workflow

We now apply the six-step PPC workflow developed in Section 3.2 to the Brandao et al. (2023) analysis. The goal is to ask: given the posteriors that emerge from 31 pieces of evidence across six intervention theories, does the model generate predictions about unexamined evidence that are coherent with domain knowledge about conservation policy in the Brazilian Amazon?

### Step 1 --- Starting from the posterior

The starting point is the completed Contribution Tracing analysis described above. For each of the six intervention theories, the researchers have:

- Specified contribution claims decomposing the intervention's theory of change.
- Assigned a prior of 0.5 to each claim.
- Collected and assessed 31 pieces of evidence across the six interventions.
- Specified sensitivity and Type I error values for each evidence-claim pair.
- Updated to posterior probabilities via Bayes' rule.

The posteriors serve as the foundation for the PPC. They reflect not just the evidence itself but the entire model specification --- the decomposition of theories of change, the choice of evidence items, and the calibration of sensitivity and specificity values. If any of these components are miscalibrated, the posteriors will be distorted, and the PPC is designed to make such distortions visible.

Two features of this case make the PPC especially interesting relative to the Section 4 application. First, the large evidence base (31 items) means that the posteriors are strongly driven by the likelihoods rather than the priors; with this much evidence, the prior of 0.5 is quickly overwhelmed. This makes the PPC primarily a check on the likelihood specification. Second, the six parallel intervention theories create opportunities for *cross-theory* predictions: the model's assessment of one intervention may generate implications for another, because the interventions interact in the real world even if they are analyzed separately.

### Step 2 --- Identifying potential unobserved evidence

We now identify evidence that was not incorporated into the original analysis but that could, in principle, be examined. Given the richness of the Amazon deforestation context, the set of potential evidence is large. We organize the items by evidentiary domain, following the guidance in Section 3.2 that cross-domain evidence is particularly diagnostic.

**Remote sensing and geospatial data:**

1. *High-frequency DETER alert response records.* INPE's DETER system generates near-real-time deforestation alerts. Records showing whether specific alerts in São Félix do Xingu triggered IBAMA enforcement visits would test the monitoring-to-enforcement causal link central to Intervention 2. [The original analysis uses aggregate deforestation data from PRODES; alert-level response data would provide a finer-grained test.]

2. *MapBiomas land-use transition data.* The MapBiomas project provides annual land-use and land-cover maps at 30-meter resolution for all of Brazil since 1985. Transition matrices showing the specific pathways of land-use change (forest-to-pasture, forest-to-agriculture, pasture-to-secondary-vegetation) in São Félix do Xingu would test whether the pattern of deforestation is consistent with the mechanisms posited by each intervention theory.

3. *Deforestation trajectories in buffer zones around protected areas.* Satellite-derived deforestation data for 5km and 10km buffer zones around indigenous territories and conservation units in São Félix do Xingu would test the "leakage" question: did protected areas genuinely reduce deforestation, or did they merely displace it to adjacent unprotected lands?

4. *Night-light imagery (VIIRS/DMSP) for the period 2006--2019.* Changes in nighttime luminosity in São Félix do Xingu and surrounding municipalities would provide an independent proxy for economic activity that could corroborate or challenge claims about the economic effects of credit restrictions and commodity agreements.

**Administrative and enforcement records:**

5. *IBAMA auto de infração (infraction notice) records for São Félix do Xingu.* IBAMA's enforcement database records individual fines, embargoes, and seizures. The volume, timing, and spatial distribution of enforcement actions would test whether monitoring actually translated into enforcement (Intervention 2) and whether the blacklisting (related to Intervention 3) was accompanied by genuine intensification of enforcement activity.

6. *CAR (Cadastro Ambiental Rural) registration data.* The proportion of rural properties in São Félix do Xingu registered in the CAR system, and the proportion of registered properties that subsequently complied with environmental regulations, would test the theory of change for credit restrictions (Intervention 3), since CAR registration was a prerequisite for access to credit.

7. *Court records from environmental prosecutions by the Ministério Público Federal (MPF) in Pará.* The number and outcomes of criminal and civil cases related to illegal deforestation in São Félix do Xingu would provide evidence about the enforcement chain that extends beyond IBAMA's administrative actions.

8. *Municipal budget records for environmental management.* The allocation and execution of São Félix do Xingu's municipal budget for environmental monitoring, enforcement, and sustainable development would test whether the Green Municipalities Program (Intervention 5) translated into genuine institutional commitment or remained largely symbolic.

**Economic and market data:**

9. *Agricultural credit disbursement data from Banco da Amazônia and BNDES for São Félix do Xingu, 2004--2019.* Detailed credit data --- broken down by loan type, borrower size, and compliance status --- would directly test the credit restriction mechanism (Intervention 3). If credit restrictions were effective, there should be a clear discontinuity in lending volumes after 2008 (when the municipality was blacklisted).

10. *Slaughterhouse purchasing records (SIF-registered establishments).* Data from the Serviço de Inspeção Federal on the origins of cattle processed at slaughterhouses serving São Félix do Xingu would test whether the TAC da Carne (Intervention 4) actually changed purchasing behavior or whether "cattle laundering" through intermediate properties undermined the agreement.

11. *Commodity price series for cattle and soy in the Xingu region.* Local price data for the main deforestation-linked commodities would help assess whether changes in deforestation rates were driven by policy interventions or by exogenous price shocks. This is relevant to the specificity of evidence attributed to the intervention theories: if deforestation declined during a period of low cattle prices, the evidence may be less specific to the intervention than assumed.

12. *INCRA (Instituto Nacional de Colonização e Reforma Agrária) settlement records.* Data on the number of families settled, the area allocated, and the deforestation rates within INCRA settlement projects in São Félix do Xingu would test an important confound: settlement projects have historically been significant drivers of deforestation in the region, and their dynamics may interact with the interventions being evaluated.

**Stakeholder testimony and qualitative sources:**

13. *Interviews with illegal loggers and cattle ranchers operating in São Félix do Xingu.* Direct testimony from the actors whose behavior the interventions sought to change would test the mechanisms posited by each theory of change. Specifically: did enforcement deter them (Intervention 2)? Did credit restrictions actually limit their operations (Intervention 3)? Did the TAC da Carne affect their market access (Intervention 4)? The original analysis includes interviews with local stakeholders, but it is unclear whether the interview sample included actors engaged in illegal deforestation, whose perspective is critical for assessing deterrence mechanisms. [VERIFY: Check whether the original study's interview sample includes deforestation actors or is limited to policy actors and civil society.]

14. *Interviews with indigenous community leaders in the Kayapó and Apyterewa territories.* Indigenous communities' assessments of whether protected area status actually reduced pressure on their lands --- and through what mechanisms (physical barriers, legal deterrence, community monitoring, or external enforcement) --- would test the theory of change for Intervention 1 from the perspective of those directly affected.

15. *Interviews with state-level environmental officials (SEMA-PA) and local IBAMA agents.* These actors are at the interface between policy design and field implementation. Their accounts of the constraints they faced, the interventions they considered most effective, and the interactions between different policy instruments would provide evidence on the mechanisms connecting interventions to outcomes.

16. *Reports and assessments by NGOs operating in the region (ISA, Imazon, TNC).* Instituto Socioambiental (ISA), Imazon, and The Nature Conservancy have all produced detailed analyses of deforestation dynamics and policy effectiveness in São Félix do Xingu. Their independent assessments would provide a cross-check on the interpretation of evidence in the original analysis.

17. *Minutes and records from Programa Municípios Verdes meetings and the municipal environmental council.* The internal documentation of multi-stakeholder processes (Intervention 5) would test whether these forums involved genuine deliberation and commitments or were primarily performative exercises undertaken to satisfy external requirements for de-listing from the blacklist.

**Comparative evidence:**

18. *Deforestation trajectories in neighboring municipalities with different intervention mixes.* Tucumã, Ourilândia do Norte, Altamira, and Novo Progresso are municipalities in the same region of Pará that experienced different combinations of the six interventions. Comparative deforestation data would help assess the specificity of the evidence: if a municipality that received enforcement but not commodity agreements showed the same deforestation trajectory as São Félix do Xingu, the evidence attributed to commodity agreements may be less specific than assumed.

19. *Analysis of municipalities that exited the blacklist versus those that remained.* Several municipalities were placed on the federal blacklist around the same time as São Félix do Xingu. Some subsequently met the criteria for de-listing; others did not. Comparing the intervention portfolios and deforestation trajectories of these two groups would provide quasi-experimental evidence on which interventions drove the observed outcomes.

### Step 3 --- Deriving model predictions

For each of the potential evidence items identified above, we now derive what the model --- as specified by the original Brandao et al. analysis --- predicts. The predictions follow from the posterior distribution across the six intervention theories combined with the logic of each theory of change.

We illustrate the process for a subset of the potential evidence items, chosen to span different intervention theories and evidentiary domains.

**Prediction 1: DETER alert response records (Item 5 above).**
The model's posterior for Intervention 2 (monitoring and enforcement) reflects mixed evidence: strong support for the monitoring component but weaker support for the enforcement component. If this posterior is well-calibrated, the model predicts that DETER alert response records would show *high detection rates* but *low enforcement response rates* --- that is, many alerts generated but relatively few followed by IBAMA field visits, fines, or embargoes. The predicted probability of finding a high enforcement response rate is low ($P(\text{high response} \mid \mathbf{e}_{\text{obs}}) \approx 0.2$--$0.3$) [VERIFY: Calibrate against actual posterior values], because the posterior already incorporates evidence of an enforcement gap. If, however, IBAMA records reveal that enforcement response rates were actually high --- that the majority of DETER alerts in São Félix do Xingu triggered field operations --- this would constitute a discrepancy, suggesting that the evidence used to arrive at the "weak enforcement" conclusion may have been given excessive weight, or that the sensitivity/specificity of that evidence was miscalibrated.

**Prediction 2: Agricultural credit data (Item 9).**
The model's posterior for Intervention 3 (credit restrictions) reflects moderate support --- credit restrictions were implemented but producers found workarounds. The model therefore predicts that credit disbursement data would show a *discontinuity* after 2008 (when the blacklisting occurred) that is *partially reversed* in subsequent years as producers adapted. Specifically, the model predicts: (a) a sharp decline in formal agricultural credit to São Félix do Xingu in 2008--2010; (b) a partial recovery by 2012--2015 as producers registered in the CAR and obtained compliance certificates, or as they accessed credit through intermediaries in non-blacklisted municipalities. If the credit data show no discontinuity at all --- suggesting that the blacklisting had no measurable effect on credit flows --- the model's posterior for Intervention 3 would be in tension with the data, and the sensitivity values assigned to the credit-related evidence in the original analysis would warrant re-examination.

**Prediction 3: Slaughterhouse records (Item 10).**
The model's moderate posterior for Intervention 4 (commodity agreements) predicts that slaughterhouse purchasing records would show *formal compliance* with the TAC da Carne among major export-oriented facilities but *extensive cattle laundering* through intermediate properties. This prediction follows from the model's assessment that commodity agreements were effective for large producers in the export chain but ineffective for smaller producers and domestic markets. If slaughterhouse records reveal that even major facilities routinely purchased cattle from properties with recent deforestation --- contrary to the model's prediction of formal compliance --- this would suggest that the sensitivity of the evidence supporting the TAC da Carne's effectiveness was overestimated.

**Prediction 4: Comparative trajectories in neighboring municipalities (Item 18).**
This prediction engages all six intervention theories simultaneously. If the model's posteriors are well-calibrated, they predict that municipalities receiving *similar combinations* of interventions should show *similar deforestation trajectories*, while municipalities receiving *different combinations* should show *different trajectories*. Specifically, the model predicts that:
- Municipalities with strong protected area coverage (like São Félix do Xingu, which borders the Terra do Meio complex) should show lower deforestation within protected areas than municipalities without such coverage.
- Municipalities that were blacklisted (like São Félix do Xingu, Altamira, and Novo Progresso) should show sharper deforestation declines after 2008 than non-blacklisted municipalities in the same region.
- Municipalities where the TAC da Carne was actively enforced should show greater reductions in pasture-driven deforestation than those where it was not.

If the comparative data reveal that blacklisted municipalities showed no differential decline relative to non-blacklisted ones, the model's attribution of deforestation reductions to the blacklisting mechanism (Interventions 2, 3, and 5) would be called into question.

**Prediction 5: Indigenous community testimony (Item 14).**
The model's strong posterior for Intervention 1 (protected areas) predicts that indigenous leaders in the Kayapó and Apyterewa territories would report that *legal protection and demarcation were important factors* in reducing deforestation pressure on their lands. But the model's specific theory of change also implies predictions about the *mechanism*: if protection works through legal deterrence, leaders should report that invaders fear legal consequences; if it works through community monitoring, leaders should report active patrolling and surveillance; if it works through physical barriers (remoteness, difficulty of access), leaders should report that the territory's geography itself is protective. The model's prediction about which mechanism is operative depends on the specific contribution claims it supports. If indigenous leaders report that protection was largely ineffective and that illegal incursions continued unabated despite demarcation --- a report that would be consistent with the well-documented invasion pressures on the Apyterewa territory specifically [VERIFY: Check the status of Apyterewa demarcation and invasion history] --- this would constitute a significant discrepancy with the model's strong posterior for Intervention 1.

**Prediction 6: Municipal budget records for environmental management (Item 8).**
The model's moderate posterior for Intervention 5 (multi-stakeholder initiatives) predicts that São Félix do Xingu's municipal budget would show *some increase* in environmental management spending after the municipality joined the Green Municipalities Program, but that the increase would be *modest and possibly unsustained*. This follows from the model's assessment that multi-stakeholder processes produced institutional changes but that the link to actual deforestation reduction was weak. If budget records show that environmental spending increased dramatically and was sustained over many years, this would suggest the model underweighted the institutional dimension of multi-stakeholder initiatives. If, conversely, environmental spending showed no change at all, this would reinforce the model's skepticism but might also suggest that the sensitivity of the evidence supporting even modest institutional change was overestimated.

### Step 4 --- Assessing qualitative coherence

The assessment of coherence draws on domain knowledge about conservation policy in the Brazilian Amazon. Several of the model's predictions can be evaluated against existing research and publicly available data, even without collecting the specific evidence items identified in Step 2.

**Assessment of Prediction 1 (enforcement response).** Existing research on IBAMA's enforcement capacity strongly supports the model's prediction of a gap between monitoring and enforcement. Assunção et al. (2013) document that DETER alerts in the Brazilian Amazon were associated with subsequent enforcement activity but that the response was geographically uneven, with remoter areas receiving less attention. For São Félix do Xingu specifically, given its enormous territorial extent and limited IBAMA staffing in the region, a low enforcement response rate is highly plausible. Moreover, budgetary data compiled by Observatório do Clima show that IBAMA's operational budget was cut by approximately 30% between 2013 and 2019, further reducing enforcement capacity. The model's prediction appears coherent with domain knowledge. **Assessment: no discrepancy detected.**

**Assessment of Prediction 2 (credit discontinuity).** Research by Assunção, Gandour, and Rocha (2015) provides evidence that the blacklisting mechanism was associated with reduced deforestation in listed municipalities, consistent with the existence of a credit restriction effect. However, Hargrave and Kis-Katos (2013) and others have documented the limits of credit restrictions, including the availability of informal credit channels and the use of nominees (*laranjas*) to circumvent restrictions. The model's prediction of a partial and eroding discontinuity appears coherent with this literature. **Assessment: no clear discrepancy detected, but the prediction of partial reversal deserves closer examination** --- if the reversal was faster and more complete than the model implies, the posterior for Intervention 3 may be too high.

**Assessment of Prediction 3 (cattle laundering).** This is where domain knowledge generates the most diagnostic information. A substantial body of investigative journalism and academic research --- including reports by Imazon, Repórter Brasil, and Greenpeace --- has documented extensive "cattle laundering" (*lavagem de gado*) in the Amazon, whereby cattle are raised on illegally deforested land, transferred to "clean" intermediate properties, and then sold to TAC-compliant slaughterhouses. In São Félix do Xingu specifically, the Triunfo do Xingu Environmental Protection Area --- where approximately 40% of the area has been converted to pasture --- has been identified as a major source of laundered cattle. This evidence is strongly consistent with the model's prediction and, indeed, may suggest that the model's posterior for Intervention 4 is, if anything, *too generous*: if cattle laundering is as pervasive as the investigative evidence suggests, the commodity agreements may have been even less effective than the model indicates. **Assessment: potential discrepancy --- the model may overestimate the effectiveness of commodity agreements.** This warrants a re-examination of the sensitivity values assigned to the evidence supporting the TAC da Carne's direct effect on deforestation.

**Assessment of Prediction 4 (comparative trajectories).** Data from PRODES and Global Forest Watch allow a rough check of the comparative prediction. Neighboring municipalities that were also blacklisted (Altamira, Novo Progresso, Cumaru do Norte) show broadly similar post-2008 deforestation trajectories, consistent with the model's prediction that the blacklisting mechanism had a common effect. However, non-blacklisted municipalities in the region also experienced deforestation declines during the same period, as part of the broader national trend known as the "PPCDAm effect" (Plano de Ação para Prevenção e Controle do Desmatamento na Amazônia Legal). This raises a concern about the specificity of the evidence attributed to São Félix do Xingu's specific interventions: if deforestation declined region-wide, the interventions' unique contribution may be smaller than the model suggests. **Assessment: potential discrepancy --- the model may overestimate the specificity of intervention effects by insufficiently accounting for region-wide trends.** The Type I error rates (false positive rates) for several evidence items may be set too low.

**Assessment of Prediction 5 (indigenous testimony).** The Apyterewa Indigenous Territory, located within São Félix do Xingu, has been the subject of extensive legal and political conflict. The territory's demarcation was challenged in court, and FUNAI's capacity to enforce exclusion of non-indigenous occupants has been severely limited. Reports from ISA and CIMI document continued illegal occupation and deforestation within the territory. This evidence is in tension with the model's strong posterior for Intervention 1 (protected areas), at least as applied to the Apyterewa case. Indigenous territories with stronger community governance and more effective enforcement --- such as the Kayapó territory --- may indeed be highly effective, but the model's aggregate treatment of "protected areas" may obscure important variation across types of protection. **Assessment: discrepancy detected --- the model may fail to distinguish between types of protected areas with different effectiveness levels.**

### Step 5 --- Diagnosis

The PPC reveals three potential issues with the original model specification:

**Diagnosis 1: Overestimation of commodity agreement effectiveness (Intervention 4).** The model's prediction about cattle laundering, combined with domain knowledge about the pervasiveness of this practice in São Félix do Xingu, suggests that the sensitivity values assigned to evidence supporting the TAC da Carne may have been set too high. Specifically, evidence of *formal compliance* by major slaughterhouses may have been treated as more strongly indicative of *actual behavioral change* than warranted. The appropriate revision is to reduce the sensitivity of compliance-related evidence items and re-update the posterior for Intervention 4. This is a **likelihood revision** --- the most common and least disruptive form of correction identified in Section 3.2.

**Diagnosis 2: Insufficient accounting for confounding regional trends.** The comparative analysis suggests that the Type I error rates for several evidence items may be too low --- that is, the evidence attributed to São Félix do Xingu's specific interventions may be less distinctive than assumed, because similar outcomes occurred in municipalities with different intervention portfolios. This diagnosis is more subtle than a simple likelihood revision, because it touches on the *specificity* parameter across multiple evidence items simultaneously. The appropriate response is to reassess the specificity of evidence items that involve temporal trends in deforestation (e.g., "deforestation declined after 2008"), asking: how likely is it that this evidence would be observed even if the intervention had no effect, given that a national-level policy (PPCDAm) was producing region-wide declines? If the answer is "quite likely," the specificity should be lowered, which will reduce the posterior for the corresponding intervention theory. This is a form of **likelihood revision** that operates at the level of the confound structure rather than at the level of individual evidence items.

**Diagnosis 3: Heterogeneity within protected areas (Intervention 1).** The discrepancy between the model's strong posterior for protected areas and the documented challenges facing the Apyterewa territory suggests a **structural issue**: the model treats "protected areas" as a single intervention category, but the effectiveness of protection varies dramatically across types (indigenous territories vs. conservation units), governance regimes (strong community governance vs. weak external enforcement), and political contexts (stable demarcation vs. contested boundaries). The appropriate response may be a **hypothesis revision** --- decomposing Intervention 1 into sub-types and re-evaluating the evidence for each sub-type separately. This is the most demanding form of revision, but it is also the most substantively informative: it pushes the analysis toward a more fine-grained understanding of how and where protected areas work.

### Step 6 --- Documentation

We record the PPC exercise in the format recommended in Section 3.2:

| Element | Record |
|---------|--------|
| **Posterior used** | Brandao et al. (2023), posterior probabilities for six intervention theories based on 31 evidence items with sensitivity/specificity likelihoods and prior of 0.5 |
| **Potential evidence items** | 19 items across five evidentiary domains (remote sensing, administrative records, economic data, stakeholder testimony, comparative evidence) |
| **Predictions derived** | 6 detailed predictions spanning Interventions 1--5 |
| **External information** | Published research on IBAMA enforcement (Assunção et al. 2013, 2015), cattle laundering (Imazon, Repórter Brasil, Greenpeace reports), comparative deforestation data (PRODES, Global Forest Watch), Apyterewa territory documentation (ISA, CIMI) |
| **Discrepancies identified** | 3: overestimation of commodity agreement effectiveness; insufficient accounting for confounding regional trends; heterogeneity within protected areas |
| **Revisions recommended** | Likelihood revision for Intervention 4 (reduce sensitivity of compliance evidence); likelihood revision across interventions (increase Type I error rates for trend-based evidence); hypothesis revision for Intervention 1 (decompose into sub-types) |

[TODO: If the author has access to the full paper and can extract exact posterior values, this table should be supplemented with quantitative predictions (e.g., "the model predicts P(high enforcement response) = 0.25") and precise specification of which evidence items' sensitivity/specificity values should be revised.]


## 5.3 What the PPC Reveals

### Added value relative to the original analysis

The PPC exercise yields three insights that would not have emerged from the original Brandao et al. analysis alone.

First, the PPC identifies a *confound problem* that the within-case design cannot address on its own. By asking what the model predicts about comparative evidence (Prediction 4), the PPC reveals that the specificity of several evidence items may be overstated because the same outcome --- declining deforestation --- occurred across the region for reasons that are not fully captured by the municipality-level analysis. This is not a critique of the original authors' work; it is a structural limitation of within-case evaluation that the PPC makes explicit. The Contribution Tracing framework, like all process-tracing approaches, operates within a single case. The PPC's comparative prediction pushes the analyst to confront the limits of within-case attribution.

Second, the PPC reveals a *heterogeneity problem* in the categorization of interventions. The model's treatment of "protected areas" as a single intervention type obscures the enormous variation in how different types of protection operate in São Félix do Xingu. The PPC makes this visible by generating predictions about specific sub-categories of protection (indigenous territories with strong governance vs. contested territories) and noting that the model's aggregate prediction is coherent with some sub-types but not others. This is a case where the PPC diagnoses a problem not with the likelihoods per se, but with the *hypothesis structure* --- the way the intervention theories are carved at the joints.

Third, the PPC highlights the importance of *evidence from the behavioral margins* --- testimony and data from the actors whose behavior the interventions sought to change (illegal loggers, cattle ranchers, cattle laundering intermediaries), as distinct from evidence about the interventions themselves (policy documents, enforcement statistics, satellite data). The original analysis draws primarily on the latter; the PPC's identification of slaughterhouse records and rancher interviews as high-value potential evidence suggests that the model's predictions are most uncertain precisely where the behavioral response to interventions is most contested.

### How the PPC operates at scale

The Brandao et al. case involves 31 evidence items across six intervention theories --- a substantially larger and more complex analysis than the Fairfield and Charman (2017) case examined in Section 4. How does the PPC workflow handle this additional complexity?

In one respect, the large evidence base makes the PPC *more powerful*. With 31 items of evidence, the posteriors are strongly determined by the likelihoods; the prior of 0.5 is effectively washed out. This means that any PPC-detected discrepancy is almost certainly attributable to the likelihood specification rather than to the prior --- which is exactly the target of the diagnostic. In a case with fewer evidence items, a discrepancy might reflect either a prior problem or a likelihood problem; here, the source is more clearly localized.

In another respect, the large evidence base makes the PPC *more necessary*. With 31 sensitivity and 31 specificity values to specify (at minimum), the opportunities for miscalibration are numerous. It is unrealistic to expect that all 62+ parameters will be precisely calibrated by subjective judgment alone. The PPC provides a structured way to check whether the aggregate implications of these many individual judgments are coherent. A researcher who has specified likelihoods for 31 items may not notice that, collectively, these specifications imply an implausible prediction about a 32nd observation. The PPC makes this aggregate implication visible.

However, the large evidence base also creates a practical challenge: the number of potential evidence items is correspondingly large (we identified 19, and could have identified many more), and deriving predictions for each one is labor-intensive. In practice, the analyst applying PPCs to a large-N BPT case will need to be *selective* about which predictions to derive. The criteria proposed in Section 3.2 --- mechanism-derived evidence, cross-domain evidence, discriminating evidence, and accessible evidence --- provide guidance for this selection. In this application, we prioritized predictions that spanned different intervention theories (to exploit cross-theory interactions) and that could be assessed against existing published research (to make the exercise feasible without new data collection).

### Contrast with Section 4

The two applications in Sections 4 and 5 illustrate the PPC's versatility across different BPT traditions and case structures. Several contrasts are instructive.

First, the *type of discrepancy* differs. In the Section 4 application [TODO: Cross-reference specific findings from Section 4 once drafted], the PPC identified issues with individual likelihood calibration in a compact model with few evidence items. Here, the most revealing discrepancies involve *structural* features of the model --- the treatment of protected areas as a single category, the insufficient attention to regional confounds, and the gap between formal compliance and actual behavioral change. This suggests that the PPC is especially useful for diagnosing structural misspecification in complex models, where the sheer number of individual likelihood judgments makes it difficult to see the forest for the trees.

Second, the *role of domain knowledge* differs. In the Chilean case, the PPC draws on specialized knowledge of Latin American political economy. Here, the PPC draws on a different body of expertise: environmental governance in the Amazon, remote sensing systems, land-use policy, and the political economy of cattle ranching. The PPCs' value in each case is directly proportional to the depth of domain knowledge available. This confirms the scope condition identified in Section 3.5: qualitative PPCs work best when the case is embedded in a rich empirical and policy literature.

Third, the *relationship between BPT traditions* is clarified. The Contribution Tracing framework used by Brandao et al. specifies likelihoods in a different format (sensitivity/specificity) than the Fairfield-Charman tradition (decibels / weight of evidence). Yet the PPC workflow applies identically to both. The posterior predictive formula (Section 3.1) is agnostic about the format in which likelihoods are expressed; it requires only that there be a posterior distribution and that the researcher can specify likelihoods for potential evidence under each hypothesis. This suggests that the PPC is a genuinely *cross-tradition* tool that can serve as a bridge between the political science and policy evaluation communities of BPT practice.


## 5.4 Comparative Lessons from Both Applications

Having applied the qualitative PPC workflow to two empirical cases from different BPT traditions, we can now draw comparative lessons about when and how the tool is most useful.

### Lesson 1: PPCs reveal different types of problems in different case structures

In the compact Fairfield and Charman (2017) case (Section 4), with six evidence items and three hypotheses, the PPC primarily diagnoses *individual likelihood calibration* issues. The model is small enough that each likelihood plays a visible role in determining the posterior, and the PPC can trace a discrepancy back to a specific evidence-hypothesis pair. In the large Brandao et al. (2023) case, with 31 evidence items and six intervention theories, the PPC primarily diagnoses *structural* issues: the categorization of hypotheses, the treatment of confounds, and the gap between formal and behavioral evidence. The individual likelihoods are too numerous for any one to be visibly responsible for an aggregate discrepancy; it is the *pattern* of predictions that reveals the problem.

This suggests a practical guideline: **in small-N BPT applications, focus PPC predictions on evidence that tests specific likelihood values; in large-N applications, focus PPC predictions on evidence that tests the model's structural assumptions** (hypothesis decomposition, conditional independence, confound structure).

### Lesson 2: Cross-domain predictions are the most diagnostic

In both applications, the most informative PPC predictions were those that drew on evidence from a *different domain* than the evidence used in the original analysis. In the Chilean case, [TODO: specify the cross-domain prediction from Section 4]. In the Amazon case, the most revealing predictions involved comparative evidence from neighboring municipalities (a domain not used in the original within-case analysis) and behavioral evidence from deforestation actors (a domain underrepresented in the original evidence base, which relied more heavily on policy documents and aggregate statistics).

This pattern is consistent with the logic outlined in Section 3.2: cross-domain predictions are harder for a misspecified model to "game," because errors in likelihood specification are less likely to be correlated across evidentiary domains. A model that overestimates the sensitivity of policy-document evidence may nonetheless generate accurate predictions about satellite data or stakeholder testimony --- but only if the likelihoods are well-calibrated. A model that generates inaccurate predictions *across* domains is more seriously misspecified.

### Lesson 3: The PPC is especially valuable when interventions interact

The Amazon case illustrates a feature that the Chilean case does not: the model evaluates *multiple interventions simultaneously*, and these interventions interact in the real world. Protected areas influence the effectiveness of enforcement; credit restrictions interact with commodity agreements; multi-stakeholder processes depend on the prior deployment of other interventions. The PPC is particularly useful in such settings because it can generate *cross-theory predictions*: the model's assessment of Intervention 1 (protected areas) has implications for what it should predict about Intervention 2 (enforcement), because enforcement within protected areas is a mechanism linking the two theories. When cross-theory predictions are incoherent --- when the model's positive assessment of protected areas implies one thing about enforcement patterns while its mixed assessment of enforcement implies another --- the PPC identifies an internal tension in the model that would be invisible from examining each intervention theory in isolation.

### Lesson 4: The contribution tracing format facilitates PPC application

The sensitivity/specificity format used in the Contribution Tracing tradition has a practical advantage for PPC application: sensitivity and specificity map directly onto the two questions the PPC asks. Sensitivity ($P(e \mid H)$) asks how likely the evidence is if the claim is true; this is exactly the likelihood the PPC uses to generate predictions. Specificity (or its complement, the Type I error rate) asks how likely the evidence is if the claim is false; this provides the baseline against which the prediction is assessed. The decibel format used in the Fairfield-Charman tradition requires a conversion step (from log-likelihood ratios to predicted probabilities) that, while straightforward, adds a layer of abstraction. This is a minor point, but it suggests that PPC application may feel more natural to practitioners working in the Contribution Tracing tradition.

### Lesson 5: PPCs complement rather than replace sensitivity analysis

Neither application suggests that the PPC should replace existing tools for evaluating BPT specifications. In both cases, prior sensitivity analysis (varying the prior and checking whether the posterior changes) remains a useful check on the prior's influence. The PPC adds a *different* type of check --- one focused on the likelihoods and on the model's aggregate coherence --- that prior sensitivity analysis cannot provide. The two tools operate on different model components and reveal different types of problems. A well-conducted BPT analysis should employ both.

### Lesson 6: Documentation is the mechanism of accountability

In both applications, the documentation step (Step 6) serves as the primary mechanism of transparency and accountability. The predictions are derived from explicit posteriors and explicit likelihood judgments; the external information used for assessment is recorded; the discrepancies and the recommended revisions are stated. A reader who disagrees with the analyst's assessment of a discrepancy can trace the reasoning and propose an alternative diagnosis. This is exactly the "structured disagreement" that Section 3.2 identifies as a key benefit of the PPC framework. Without documentation, the PPC degenerates into an informal judgment call; with documentation, it becomes an auditable step in the analytical workflow.

[TODO: The author may want to restructure Section 5.4 so that it serves as a natural transition to the paper's concluding section. If Section 6 is a general discussion/conclusion, then 5.4 can be more tightly focused on the comparative analysis; if there is no Section 6, then 5.4 should be expanded to include broader implications for BPT practice.]
