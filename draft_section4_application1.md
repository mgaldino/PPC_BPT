# 4. Application I: Reanalyzing Fairfield and Charman's (2017) Chilean Tax Reform

The qualitative posterior predictive check (PPC) framework proposed in Section 3 is only as valuable as its ability to illuminate features of a BPT analysis that would otherwise remain hidden. This section puts the framework to work on what is arguably the canonical application of explicit Bayesian process tracing: Fairfield and Charman's (2017) analysis of Chile's 2005 income tax reform, presented in the main text of their *Political Analysis* article and developed in detail in its Online Appendix A. The case is ideal for a first demonstration. The analysis is fully transparent --- priors, likelihoods in decibels, and posteriors are all reported. The case is substantively well-understood, thanks to Fairfield's (2015) book-length treatment of Chilean tax politics. And the number of evidence items is small enough (six) to permit a detailed walk-through of every step in the workflow.

The goal is not to "overturn" Fairfield and Charman's conclusions. It is to show that even a well-executed BPT analysis benefits from the discipline of posterior predictive checking --- and that the exercise can reveal features of the model specification that deserve further scrutiny.


## 4.1 The Case: Chile's 2005 Income Tax Reform

### Background

In 2005, the Chilean government under President Ricardo Lagos succeeded in eliminating Article 57 bis of the Income Tax Law --- a preferential tax regime that granted a 15% tax credit on net savings invested in financial instruments such as stocks, mutual funds, and time deposits. The subsidy had been introduced in 1993 (Law No. 19,247) with the stated purpose of incentivizing household savings, but in practice it overwhelmingly benefited high-income individuals with the capacity to invest in capital markets. Its elimination was a rare instance of progressive tax reform in a country where cohesive business elites, allied with right-wing parties (UDI and RN), had historically blocked attempts to increase direct taxation (Fairfield 2015).

The puzzle is why the reform succeeded in 2005 when similar efforts had failed in earlier periods. Fairfield's (2015) detailed case study, drawn from extensive fieldwork including interviews with policymakers, legislators, and business leaders, provides the evidentiary foundation for the BPT analysis. The Lagos government's strategy centered on framing the elimination of 57 bis as a matter of vertical equity --- arguing that it was indefensible for wealthy stock market investors to receive tax subsidies while ordinary workers paid the full rate. As Lagos himself later explained: "The key to a tax reform is to link it to the destination of the funds. I never wanted to discuss the tax reform; I discussed what I was going to do with the money" (cited in Fairfield 2014: 8). [VERIFY: exact page and source of Lagos quote]

### The BPT analysis

Fairfield and Charman (2017) use this case to illustrate their guidelines for explicit Bayesian analysis. The Online Appendix A presents the full analysis, which proceeds as follows.

**Hypotheses.** Three mutually exclusive hypotheses are evaluated: [VERIFY: confirm exact hypothesis labels and formulations against Appendix A]

- $H_{EA}$ (Equity Appeal): The reform succeeded because the government strategically framed it as a vertical equity issue, creating political costs for business and the right to oppose it openly. The equity frame resonated with the public and made opposition appear self-serving.

- $H_{CC}$ (Coalition Compromise): The reform was the product of a broader political bargain within the governing Concertacion coalition. The elimination of 57 bis was part of a package deal linking tax measures to social spending priorities of different coalition partners.

- $H_{BP}$ (Business Power): The reform succeeded because business power was attenuated or circumvented in this specific instance --- either because the business community was internally divided on the 57 bis issue, or because the government found a way to bypass the usual channels of business influence.

**Priors.** Fairfield and Charman begin with a relatively skeptical prior designed to assess the strength of the causal argument. The analysis tests the equity appeal hypothesis ($H_{EA}$) against the alternatives, starting from prior probabilities that do not privilege any single hypothesis. [VERIFY: exact prior values --- likely equal priors of 1/3 each, or a skeptical prior heavily weighted against $H_{EA}$]

**Evidence.** Six pieces of evidence ($E_1$ through $E_6$) are evaluated, drawn from Fairfield's (2015) case study. The evidence spans multiple domains: [VERIFY: exact characterization of each evidence item against Appendix A]

- $E_1$: Documentary and archival evidence regarding the government's explicit framing of the reform in equity terms --- including official communications, presidential speeches, and legislative messaging.
- $E_2$: Evidence about the political process and legislative dynamics --- how the bill moved through Congress, the sequencing of the reform, and the strategic timing of its introduction.
- $E_3$: Evidence about business reactions and lobbying efforts --- how the major business associations (CPC, SOFOFA) and individual firms responded to the reform proposal.
- $E_4$: Evidence about coalition negotiations and internal Concertacion dynamics --- whether the reform was discussed as part of a broader political bargain.
- $E_5$: Evidence about the role of technocrats and policy entrepreneurs --- particularly Finance Minister Nicolas Eyzaguirre and officials at the Servicio de Impuestos Internos (SII) --- in designing and advocating the reform.
- $E_6$: Evidence about public discourse and media framing --- how newspapers, opinion columns, and public debate characterized the reform and its rationale.

**Likelihoods in decibels.** For each evidence item and each pair of hypotheses, Fairfield and Charman assign a weight of evidence in decibels (dB), following the convention that $W(E : H_i \text{ vs. } H_j) = 10 \log_{10} \frac{P(E \mid H_i)}{P(E \mid H_j)}$. The decibel scale provides an intuitive metric: approximately 3 dB corresponds to "barely worth mentioning," 10 dB to "moderate" evidence, 20 dB to "strong" evidence, and 30 dB to "very strong" evidence (Fairfield and Charman 2017: 370). [VERIFY: exact dB thresholds and adjectives]

Key features of their likelihood assignments include: [VERIFY: exact dB values for each evidence item]

- $E_1$ (equity framing) and $E_3$ (business reactions) receive the strongest weights --- approximately 25--30 dB in favor of $H_{EA}$ relative to the alternatives. The equity framing evidence is interpreted as strongly predicted by $H_{EA}$ and much less expected under $H_{CC}$ or $H_{BP}$.
- Some evidence items do not discriminate well between certain pairs of hypotheses. For instance, $E_1$ may not strongly distinguish $H_{EA}$ from $H_{CC}$, since a coalition compromise might also involve equity framing as a public justification. [VERIFY]
- The cumulative weight of evidence across all six items strongly favors $H_{EA}$.

**Posterior.** After sequential updating, the posterior probability of $H_{EA}$ is very high --- Fairfield and Charman report that it reaches approximately 50 dB relative to any alternative, meaning that the alternatives are, in the paper's metaphor, reduced to a "pin-drop in the background" compared to the equity appeal hypothesis. [VERIFY: exact posterior values or dB figures] The analysis also includes sensitivity checks varying the prior, which confirm that the posterior conclusion is robust to alternative starting points.

**Summary.** The original analysis concludes that the equity appeal mechanism provides the strongest explanation for the success of the 2005 reform. The evidence is interpreted as strongly and consistently favoring $H_{EA}$, with business reactions and the equity framing itself providing the most powerful discriminating evidence.


## 4.2 Applying the Qualitative PPC Workflow

We now apply the six-step workflow from Section 3.2, treating Fairfield and Charman's posterior as the starting point and asking what that posterior implies about evidence not examined in the original analysis.

### Step 1: Starting from the posterior

The posterior from Fairfield and Charman's analysis assigns overwhelming probability to $H_{EA}$. For concreteness, we work with the approximate posterior distribution: $P(H_{EA} \mid \mathbf{e}_{obs}) \approx 0.99$, $P(H_{CC} \mid \mathbf{e}_{obs}) \approx 0.005$, $P(H_{BP} \mid \mathbf{e}_{obs}) \approx 0.005$. [VERIFY: reconstruct exact posteriors from the reported dB values, or use F&C's reported figures. The 50 dB figure implies a ratio of approximately 100,000:1, so 0.99 may be conservative; the actual posterior for $H_{EA}$ may be even higher.]

This posterior will serve as the weight vector in the posterior predictive formula. Because $H_{EA}$ dominates so strongly, the model's predictions about unobserved evidence will be driven almost entirely by what $H_{EA}$ implies. This is a feature, not a bug: if $H_{EA}$ is indeed the correct hypothesis, its predictions should be coherent with what we know about the case. If they are not, the dominance of $H_{EA}$ in the posterior may itself be a symptom of miscalibrated likelihoods.


### Step 2: Identifying potential unobserved evidence

We identify fourteen items of potential evidence that were not incorporated into the original BPT analysis but could, in principle, be observed or assessed. These items are drawn from multiple evidentiary domains and are selected to maximize diagnostic value according to the criteria in Section 3.2: mechanism-derived implications, cross-domain evidence, and discriminating predictions.

**Legislative and congressional records:**

1. **Congressional committee testimony transcripts ($e^*_1$).** The Chilean Congress maintains records of testimony presented before legislative committees (comisiones). During the deliberation on the 57 bis reform, business associations, government officials, and civil society actors would have presented formal arguments. The content and framing of these arguments --- particularly whether business representatives contested the equity frame or accepted it --- would provide evidence bearing on all three hypotheses.

2. **Roll-call votes and floor debate records ($e^*_2$).** The pattern of legislative voting on the 57 bis elimination --- whether it passed along strict coalition lines (supporting $H_{CC}$), with broad cross-party support (supporting $H_{EA}$), or with visible business-linked dissent (supporting $H_{BP}$) --- provides a structural test of the hypotheses.

**Elite interviews and private testimony:**

3. **Interviews with opposition legislators from UDI and RN ($e^*_3$).** Whether right-wing legislators privately acknowledged the political bind created by the equity frame --- conceding that opposition would be publicly costly --- or instead attributed their position to other factors (party discipline, coalition bargaining, or business pressure) would discriminate among the hypotheses.

4. **Interviews with Lagos's senior economic advisors ($e^*_4$).** Whether the equity frame was pre-planned as a deliberate strategy (supporting $H_{EA}$) or emerged ad hoc during the legislative process (weakening $H_{EA}$) could be assessed through testimony from key figures such as Finance Minister Nicolas Eyzaguirre and Budget Director Mario Marcel.

5. **Interviews with business leaders and lobbyists ($e^*_5$).** Direct testimony from CPC and SOFOFA leaders about their internal deliberations --- whether they perceived the equity frame as genuinely constraining their ability to mobilize opposition, or whether other factors (internal division, competing priorities) better explain their muted response.

**Institutional and documentary records:**

6. **Internal executive memoranda ($e^*_6$).** Presidential memos, cabinet minutes, or strategy documents from the Lagos government discussing the reform's design and political strategy. If the equity frame was strategically planned, such documents should contain explicit discussion of framing strategy.

7. **Servicio de Impuestos Internos (SII) technical reports ($e^*_7$).** Tax administration data on the distributional incidence of the 57 bis subsidy --- who benefited, by income decile --- would reveal whether the equity appeal had a strong empirical foundation or was primarily rhetorical.

8. **Business association (CPC/SOFOFA) internal meeting minutes ($e^*_8$).** Records of how business groups deliberated their response strategy to the reform. Were they divided? Did they consider and reject a public opposition campaign? Did they explicitly discuss the political risks of opposing an equity-framed reform?

**Media and public discourse:**

9. **Systematic media content analysis ($e^*_9$).** A structured coding of newspaper coverage (El Mercurio, La Tercera, La Nacion) during the legislative deliberation period, tracking the prevalence of equity framing versus alternative frames (economic efficiency, savings incentives, coalition politics).

10. **Public opinion data ($e^*_{10}$).** Survey data from Latinobarometro, CEP polls, or other sources on public attitudes toward tax fairness and the 57 bis subsidy around 2004--2005. If the equity appeal hypothesis is correct, public opinion should have been receptive to vertical equity arguments.

**Comparative and behavioral evidence:**

11. **Comparative evidence from failed reforms ($e^*_{11}$).** The Lagos government attempted other progressive tax reforms in 2001 and 2003 that met with more limited success. If equity appeals were the key mechanism in 2005, the earlier failures should be explicable by the absence or weakness of equity framing --- or by the presence of countervailing factors that the equity frame could not overcome.

12. **Stock market reactions around key legislative dates ($e^*_{12}$).** Observable financial market behavior --- whether share prices in sectors benefiting from 57 bis declined around the dates of key legislative events --- would provide behavioral evidence of business expectations. A strong market reaction would suggest that business actors did perceive a real threat, consistent with $H_{BP}$ being relevant; a muted reaction would suggest that the reform's scope was limited enough that business could absorb it.

13. **Subsequent behavior of key actors ($e^*_{13}$).** The post-reform careers, public statements, and political trajectories of key actors (Lagos, Eyzaguirre, business leaders, UDI/RN legislators) can provide retrodictive evidence. If the equity appeal genuinely constrained the right, we might expect right-wing politicians to subsequently adopt or co-opt equity language in later tax debates.

14. **International organization reports ($e^*_{14}$).** OECD, IMF, and World Bank reports on Chilean tax policy from the 2004--2006 period. These organizations routinely assess the rationale and politics of tax reforms. Their characterization of the 57 bis elimination --- whether they emphasized equity, efficiency, or political factors --- provides an independent assessment that is unlikely to be influenced by the model's assumptions.


### Step 3: Deriving the model's predictions

For each potential evidence item, we now derive what the posterior model predicts. The posterior predictive formula is:

$$P(e^*_k \mid \mathbf{e}_{obs}) = \sum_{i} P(e^*_k \mid H_i) \times P(H_i \mid \mathbf{e}_{obs})$$

Given that $P(H_{EA} \mid \mathbf{e}_{obs}) \approx 0.99$, the posterior predictive distribution is dominated by the likelihoods under $H_{EA}$. In effect, the model predicts that unobserved evidence should look like what we would expect *if the equity appeal mechanism were true*. The diagnostic question is whether these predictions are coherent with what domain knowledge and the wider case record suggest.

We organize the predictions into a **predictive narrative** --- a structured account of what the model expects across the fourteen evidence items.

**Prediction 1 (Committee testimony, $e^*_1$).** Under $H_{EA}$, business representatives testifying before congressional committees should have focused their arguments on the economic merits of savings incentives rather than directly challenging the equity frame --- since the equity frame made direct opposition politically costly. Government witnesses should have emphasized distributional fairness. We assign $P(e^*_1 = \text{equity-framed debate} \mid H_{EA}) \approx 0.85$ and $P(e^*_1 = \text{equity-framed debate} \mid H_{CC}) \approx 0.50$ (coalition compromise is compatible with equity framing as public justification), and $P(e^*_1 = \text{equity-framed debate} \mid H_{BP}) \approx 0.30$ (if business power was the mechanism, the framing of debate is less predictable). The posterior predictive probability is approximately $0.99 \times 0.85 + 0.005 \times 0.50 + 0.005 \times 0.30 \approx 0.85$. The model strongly predicts equity-framed committee debate. [TODO: Author should verify/adjust these illustrative likelihoods based on substantive expertise.]

**Prediction 2 (Roll-call votes, $e^*_2$).** Under $H_{EA}$, the reform should have passed with relatively broad support --- including some right-wing legislators who could not afford to be seen opposing an equity measure --- rather than along strict coalition lines. Under $H_{CC}$, we would expect strict coalition-line voting. Under $H_{BP}$, the pattern is less determinate. The model predicts broad legislative support ($P \approx 0.75$ under $H_{EA}$), which is distinguishable from coalition-line voting ($P \approx 0.80$ under $H_{CC}$). The posterior predictive probability of broad support is approximately 0.74.

**Prediction 3 (Opposition interviews, $e^*_3$).** Under $H_{EA}$, UDI/RN legislators should, in private, acknowledge the constraining effect of the equity frame. They should describe feeling caught in a bind: opposing the reform would expose them to charges of defending privileges for the wealthy. The model assigns high probability ($\approx 0.80$) to this pattern under $H_{EA}$, lower probability under $H_{CC}$ ($\approx 0.30$) and $H_{BP}$ ($\approx 0.20$). Posterior predictive probability of equity-constraint acknowledgment: $\approx 0.79$.

**Prediction 4 (Economic advisors, $e^*_4$).** Under $H_{EA}$, Lagos's advisors should report that the equity frame was a deliberate, pre-planned strategy --- not an afterthought. The model assigns $P(\text{pre-planned} \mid H_{EA}) \approx 0.85$, $P(\text{pre-planned} \mid H_{CC}) \approx 0.40$, $P(\text{pre-planned} \mid H_{BP}) \approx 0.25$. Posterior predictive: $\approx 0.84$.

**Prediction 5 (Business leader interviews, $e^*_5$).** Under $H_{EA}$, business leaders should report that the equity frame was a significant factor in their decision not to mount vigorous public opposition. Under $H_{BP}$, they should report internal division or strategic considerations unrelated to framing. The model predicts that business leaders attribute their restraint to the equity frame ($P \approx 0.75$ under $H_{EA}$, $\approx 0.20$ under $H_{CC}$, $\approx 0.35$ under $H_{BP}$). Posterior predictive: $\approx 0.74$.

**Prediction 6 (Executive memoranda, $e^*_6$).** Under $H_{EA}$, internal government documents should contain explicit strategic discussion of the equity frame as a tool for overcoming business opposition. The model predicts such documents with $P \approx 0.70$ under $H_{EA}$. However, governments do not always commit strategy to paper, especially when the strategy involves deliberately framing opponents. This is a case where the likelihood under $H_{EA}$ is notably uncertain.

**Prediction 7 (SII data, $e^*_7$).** Under $H_{EA}$, SII data should show that the 57 bis subsidy was heavily concentrated among high-income households. This is a near-certain prediction: $P \approx 0.95$ under $H_{EA}$ (the equity appeal only works if the subsidy is actually regressive). Under $H_{CC}$ and $H_{BP}$, this evidence is also likely but less strongly predicted ($P \approx 0.60$ for each). Posterior predictive: $\approx 0.94$.

**Prediction 8 (Business association minutes, $e^*_8$).** Under $H_{EA}$, internal business deliberations should reveal explicit discussion of the political risks of opposing an equity-framed reform. Under $H_{BP}$, the minutes should reveal substantive internal division on the merits of 57 bis. The model predicts equity-risk discussion ($P \approx 0.65$ under $H_{EA}$, $\approx 0.15$ under $H_{CC}$, $\approx 0.25$ under $H_{BP}$). Posterior predictive: $\approx 0.64$.

**Prediction 9 (Media content analysis, $e^*_9$).** Under $H_{EA}$, newspaper coverage should be dominated by equity framing rather than other frames. The model predicts equity-dominant coverage ($P \approx 0.80$ under $H_{EA}$, $\approx 0.45$ under $H_{CC}$, $\approx 0.30$ under $H_{BP}$). Posterior predictive: $\approx 0.79$.

**Prediction 10 (Public opinion, $e^*_{10}$).** Under $H_{EA}$, public opinion data should show that Chilean citizens supported the idea that wealthy investors should not receive tax subsidies. The model predicts supportive public opinion ($P \approx 0.85$ under $H_{EA}$, $\approx 0.50$ under $H_{CC}$, $\approx 0.50$ under $H_{BP}$). Posterior predictive: $\approx 0.84$.

**Prediction 11 (Comparative evidence, $e^*_{11}$).** Under $H_{EA}$, the earlier reform failures (2001, 2003) should be explicable by the absence or weakness of equity framing. The model predicts weak equity framing in failed reforms ($P \approx 0.70$ under $H_{EA}$, $\approx 0.40$ under $H_{CC}$, $\approx 0.40$ under $H_{BP}$). Posterior predictive: $\approx 0.69$.

**Prediction 12 (Stock market reactions, $e^*_{12}$).** Under $H_{EA}$, market reactions should be modest --- the equity appeal works through *political* channels, not by signaling a fundamental shift in the government's stance toward capital. Under $H_{BP}$, strong market reactions would be expected (markets would interpret the reform as evidence of weakened business influence). The model predicts muted market reactions ($P \approx 0.65$ under $H_{EA}$, $\approx 0.50$ under $H_{CC}$, $\approx 0.25$ under $H_{BP}$). Posterior predictive: $\approx 0.64$.

**Prediction 13 (Subsequent behavior, $e^*_{13}$).** Under $H_{EA}$, the success of the equity frame should have left traces in subsequent political behavior --- right-wing actors may have adapted their rhetoric to preempt future equity appeals, and the Lagos government may have attempted similar framing strategies for other reforms. The model predicts rhetorical adaptation by the right ($P \approx 0.55$ under $H_{EA}$, $\approx 0.25$ under $H_{CC}$, $\approx 0.20$ under $H_{BP}$). Posterior predictive: $\approx 0.54$.

**Prediction 14 (International reports, $e^*_{14}$).** Under $H_{EA}$, OECD/IMF reports should characterize the reform in distributional terms. Under $H_{CC}$, they might emphasize political-economy dynamics. Under $H_{BP}$, they might note business quiescence. The model predicts equity-focused international reports ($P \approx 0.60$ under $H_{EA}$, $\approx 0.35$ under $H_{CC}$, $\approx 0.40$ under $H_{BP}$). Posterior predictive: $\approx 0.59$.

Table 1 summarizes the posterior predictive probabilities for all fourteen evidence items. [TODO: Format as a proper table with columns for $e^*_k$, description, $P(e^* \mid H_{EA})$, $P(e^* \mid H_{CC})$, $P(e^* \mid H_{BP})$, and $P(e^* \mid \mathbf{e}_{obs})$.]


### Step 4: Assessing qualitative coherence

The task is now to compare the model's predictions against domain knowledge about Chilean politics and the specific context of the 2005 reform. We draw on the scholarly literature on Chilean tax politics (Fairfield 2015; Fairfield and Garay 2017), publicly available institutional records, and general knowledge of the Concertacion era.

**Predictions that appear coherent:**

Several of the model's predictions align well with what is independently known about the case.

*SII distributional data ($e^*_7$).* The model predicts with near-certainty that the 57 bis subsidy was regressive. This prediction is strongly supported: the subsidy was structured as a tax credit on financial market investments, which by definition favored higher-income households with investable savings. This is a "green flag" --- the prediction is both strong and well-supported.

*Public opinion ($e^*_{10}$).* The model predicts that public opinion would be receptive to equity arguments. This is consistent with broader evidence from the Latinobarometro surveys, which consistently show high levels of concern about inequality in Chile and support for redistributive policies. Another green flag.

*Economic advisors ($e^*_4$).* The model predicts that the equity frame was pre-planned. This is consistent with Lagos's own testimony (quoted above) about the strategic importance of linking tax measures to their distributive purpose. Fairfield's (2015) fieldwork also supports this interpretation. Green flag.

*Media framing ($e^*_9$).* Chile's media landscape in the mid-2000s was dominated by El Mercurio (center-right) and La Tercera. Under $H_{EA}$, we would expect the equity frame to pervade even critical coverage, since the frame's power lies in its public resonance. This is plausible but would benefit from systematic verification.

**Predictions where coherence is less clear:**

*Opposition legislator interviews ($e^*_3$).* The model predicts that UDI/RN politicians would privately acknowledge being constrained by the equity frame. However, Chilean right-wing politicians in the Concertacion era were known for ideological discipline and a strong preference for framing economic issues in terms of growth and efficiency rather than equity (Fairfield 2015). It is plausible that they would attribute their acquiescence to other factors --- tactical calculations about picking battles, skepticism about the subsidy's electoral salience, or internal party dynamics --- rather than granting that an equity appeal constrained them. This is a "yellow flag": the prediction is plausible but not unambiguously supported by domain knowledge.

*Comparative evidence from failed reforms ($e^*_{11}$).* The model predicts that the 2001 and 2003 reform attempts should have featured weaker equity framing. But the Lagos government used equity-adjacent arguments in earlier reforms as well --- notably the 2001 Anti-Evasion Reform, which was framed as targeting those who did not pay their fair share. If earlier reforms also used equity framing but still encountered greater difficulty, this would suggest that equity framing alone is insufficient and that other factors (timing, the specific policy instrument, the state of the economy) were important determinants. This is a yellow flag that deserves further investigation.

*Business leader interviews ($e^*_5$).* The model predicts that business leaders would attribute their restraint to the equity frame. But business elites might plausibly offer alternative explanations: the 57 bis subsidy was of limited economic significance to most large firms (it primarily benefited individual investors, not corporations), so business restraint may have reflected strategic triage rather than political constraint from the equity frame. If business leaders report that they simply did not care enough about 57 bis to mobilize, this would be mildly discrepant with the model's prediction --- suggesting that $H_{EA}$'s dominance may partly reflect an overestimate of how constraining the equity frame was for business, when the real story may involve an element of $H_{BP}$ (business power was not engaged because the stakes were too low).

**A potential discrepancy:**

*Stock market reactions ($e^*_{12}$).* The model predicts muted market reactions, since the equity appeal operates through political channels. But this prediction raises a subtle issue. If stock market reactions to the 57 bis elimination were indeed muted, this is consistent with $H_{EA}$ --- but it is *also* consistent with a version of $H_{BP}$ in which business power was not seriously threatened because the reform's scope was narrow. The muted reaction would not discriminate between "business was constrained by the equity frame" and "business was indifferent because the stakes were small." The model, by assigning near-certainty to $H_{EA}$, does not give adequate weight to this ambiguity. This is not a clear-cut discrepancy, but it highlights a potential weakness in the model's ability to distinguish $H_{EA}$ from a "low-stakes $H_{BP}$" variant.

*Roll-call votes ($e^*_2$).* The model predicts broad legislative support rather than coalition-line voting. Chilean legislative records from this period are publicly available [VERIFY]. If the vote did pass along strict coalition lines, with Concertacion members voting in favor and Alianza members voting against, this would be mildly discrepant with $H_{EA}$ (which predicts that the equity frame should have peeled off some right-wing votes) and more consistent with $H_{CC}$ (coalition discipline). [TODO: Author should verify the actual roll-call pattern for the 57 bis elimination.]


### Step 5: Diagnosis

The posterior predictive check does not reveal a stark, unmistakable discrepancy that would call for a fundamental revision of the model. The model's predictions are, on the whole, coherent with what domain knowledge suggests. This is itself an informative result: it suggests that the likelihood specification underlying the original analysis is broadly reasonable.

However, the check does surface three diagnostic observations that the original analysis does not address.

**Observation 1: The "low-stakes" alternative.** The model's predictions about business behavior ($e^*_5$, $e^*_8$, $e^*_{12}$) are consistent with $H_{EA}$, but they are also consistent with a scenario in which business simply did not regard the 57 bis elimination as a high-stakes battle. This "low-stakes" interpretation occupies the conceptual space between $H_{EA}$ and $H_{BP}$: business power was not overcome by the equity appeal but rather was never fully deployed because the policy stakes were modest. The original hypothesis set treats $H_{EA}$ and $H_{BP}$ as distinct, but the PPC suggests that a composite hypothesis --- "the equity appeal worked *in part because* business power was not strongly engaged" --- might better account for the pattern of evidence. This is an instance of the *hypothesis revision* diagnosis described in Section 3.2, Step 5.

If this composite mechanism is correct, the likelihoods originally assigned to the business-related evidence ($E_3$) under $H_{EA}$ may have been inflated. The equity appeal may have been moderately important rather than overwhelmingly decisive, and the strong likelihood ratios assigned to business behavior evidence may partly reflect the absence of the "low-stakes" hypothesis from the model rather than genuinely discriminating evidence.

**Observation 2: The comparative counterfactual.** The model's prediction about failed reforms ($e^*_{11}$) highlights a potential weakness in the equity appeal hypothesis. If equity framing was used in earlier reform attempts that nonetheless failed, the success of the 2005 reform cannot be attributed solely to the equity appeal --- other factors (the specific nature of 57 bis as a clearly regressive subsidy, Lagos's political capital in his final year, the broader macroeconomic context) must also have been important. The PPC does not tell us which factors mattered, but it identifies the comparative counterfactual as a point where the model's predictions deserve further scrutiny. This observation would call for *likelihood revision*: the likelihood of equity-framing evidence under $H_{EA}$ may need to be conditioned on contextual factors that are not currently part of the model.

**Observation 3: Discrimination between $H_{EA}$ and $H_{CC}$.** Several predictions ($e^*_1$, $e^*_2$, $e^*_9$) reveal that the model does not sharply discriminate between $H_{EA}$ and $H_{CC}$. Equity framing can serve as a public justification for a reform that was primarily motivated by coalition politics. The posterior predictive check makes this ambiguity visible: the model predicts equity-framed discourse with high confidence, but equity-framed discourse is also moderately probable under $H_{CC}$. If equity framing is compatible with both $H_{EA}$ and $H_{CC}$, then the strong likelihoods assigned to framing evidence in favor of $H_{EA}$ may be overstated --- some of the evidentiary weight attributed to $H_{EA}$ may actually be shared with $H_{CC}$. This is an instance of *likelihood revision*: the evidence may not be as discriminating as the original specification implies.


### Step 6: Documentation

We summarize the PPC cycle as follows.

| Element | Content |
|---------|---------|
| **Posterior** | $P(H_{EA} \mid \mathbf{e}_{obs}) \approx 0.99$; $H_{EA}$ overwhelmingly dominant |
| **Potential evidence** | 14 items across 5 evidentiary domains (legislative, elite interviews, institutional documents, media/public opinion, comparative/behavioral) |
| **Predictions** | The model predicts equity-consistent evidence across all 14 items, with posterior predictive probabilities ranging from 0.54 to 0.94 |
| **Coherence assessment** | Broadly coherent; no "red flags." Three "yellow flags" identified: (1) business behavior may reflect low stakes rather than equity constraint, (2) comparative evidence from earlier reforms may challenge $H_{EA}$'s sufficiency, (3) equity framing does not sharply discriminate $H_{EA}$ from $H_{CC}$ |
| **Diagnoses** | (1) Potential hypothesis revision: composite "equity + low stakes" hypothesis; (2) Likelihood revision: equity framing evidence may be less discriminating than specified; (3) Comparative evidence warrants further investigation |
| **Revision recommended?** | No fundamental revision warranted. The original analysis remains well-supported. But the PPC identifies specific points where the analysis could be strengthened by (a) considering a composite hypothesis, (b) examining whether business behavior evidence truly discriminates $H_{EA}$ from a low-stakes variant, and (c) confronting the comparative counterfactual more explicitly |


## 4.3 What the PPC Reveals

The application to Fairfield and Charman's analysis illustrates three features of the qualitative PPC framework that are worth highlighting.

**First, the PPC adds value even when the original analysis is well-executed.** Fairfield and Charman's analysis is a model of transparent, rigorous BPT. It is not "broken" in any obvious way. Yet the posterior predictive check surfaced diagnostic observations --- the low-stakes alternative, the comparative counterfactual, the $H_{EA}$/$H_{CC}$ discrimination problem --- that were not visible in the original analysis. These observations do not overturn the conclusion that the equity appeal was an important mechanism. But they suggest that the posterior's extreme confidence ($\approx 0.99$) may be partly an artifact of the hypothesis set's structure rather than a pure reflection of the evidence's discriminating power. A more nuanced posterior --- one that acknowledges the possible role of complementary mechanisms --- might be more appropriate.

This is precisely the kind of insight that posterior predictive checks are designed to generate. In quantitative Bayesian analysis, a well-fitting model can still produce implausible predictions when pushed to generate out-of-sample data, and those implausible predictions reveal features of the model that in-sample fit alone would not expose (Gelman et al. 2020). The same logic applies here: examining the evidence already in the analysis confirms that $H_{EA}$ is well-supported, but asking what *other* evidence the model expects reveals tensions that are invisible from the inside.

**Second, the PPC imposes discipline on the distinction between strong evidence and merely compatible evidence.** One of the persistent challenges in process tracing is distinguishing evidence that strongly *favors* a hypothesis from evidence that is merely *consistent* with it. The posterior predictive check sharpens this distinction by forcing the analyst to consider whether the evidence is also consistent with alternative hypotheses. The equity framing evidence ($E_1$) may have been treated in the original analysis as strongly favoring $H_{EA}$, but the PPC reveals that equity framing is also moderately expected under $H_{CC}$. This does not mean that $E_1$ is worthless --- it means that its discriminating power is less than the original likelihood assignment may suggest. The PPC provides a structured way to surface this issue.

**Third, the PPC generates a research agenda.** The diagnostic observations from Steps 4 and 5 do not just evaluate the original analysis; they point toward specific empirical investigations that could strengthen or refine it. Examining roll-call voting patterns ($e^*_2$), interviewing business leaders about their perception of the reform's stakes ($e^*_5$), and comparing the equity framing strategy across multiple reform attempts ($e^*_{11}$) are all tractable research tasks that the PPC directly motivates. In this sense, the posterior predictive check functions not only as a diagnostic tool but as a generator of productive research questions --- a feature that it shares with its quantitative counterpart (Gabry et al. 2019).

**Limitations of this demonstration.** We should be transparent about what this exercise does *not* establish. We have not collected the fourteen evidence items identified in Step 2; the coherence assessment in Step 4 relies on domain knowledge rather than new empirical observation. A fully realized PPC would involve actually seeking out at least some of the predicted evidence and comparing the findings to the model's predictions. What we have demonstrated is the *workflow* --- the structured process of deriving predictions, assessing coherence, and diagnosing potential problems. The substantive conclusions about the Chilean case are provisional and should be understood as illustrations of the method's diagnostic potential rather than as definitive findings about the reform.

[TODO: Author should decide whether to add a brief discussion of how this application informs the choice of discrepancy assessment criteria --- i.e., what constitutes a "red flag" vs. a "yellow flag" in practice. The three yellow flags identified here could serve as a pedagogical example of the judgment involved in Step 4.]

[TODO: Author should cross-reference with Section 5 (Application 2) to note what the comparative analysis across applications reveals about the framework's portability.]
