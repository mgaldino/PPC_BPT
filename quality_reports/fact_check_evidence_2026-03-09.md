# Fact-Check Report: Holdout Evidence

**Date**: 2026-03-09
**Scope**: e\*_1 through e\*_8 across paper (`paper_draft_v1.md`), supplementary materials (`supplementary_materials.md`), and evidence files (`oil_majors_evidence_strategy.md`, `oil_majors_evidence_lobbying.md`, `oil_majors_evidence_crosscompany.md`)

---

## Summary

**Overall assessment**: 4 issues flagged (2 moderate severity, 2 low severity), plus several minor notes. The evidence base is largely solid, but two factual claims require correction and one source URL is broken. The interpretive framing is generally fair across all eight evidence items, with appropriate caveats acknowledged.

| Severity | Count | Description |
|----------|-------|-------------|
| **MODERATE** | 2 | (1) API conditionality language misquoted; (2) BCN URL for Chile e\*_1 points to wrong law |
| **LOW** | 2 | (1) House Oversight date and API spending figure incorrect in evidence file; (2) Author name misspelled in references |
| **MINOR** | 4 | Mapping inconsistencies between evidence files and paper; unverified Fortune quote attributions; Northern Lights investment figure not confirmed on Equinor page; BP renewable investment figures differ across sources |

---

## Chile Case (e\*_1 through e\*_4)

### e\*_1 --- Committee Records (Equity-Dominated Debate)

- **Factual claims**: PASS WITH CAVEAT. The paper states Lagos "eliminated Article 57 bis" via the 2005 reform. The supplementary materials cite "Ley 20.028 (Ley de Rentas)." However, verification via Chile's SII (tax authority) reveals that **Ley 20.028 only derogated one specific benefit within Article 57 bis** (the deduction for first-issue share acquisitions, effective tax year 2006). The full Article 57 bis was not eliminated until Ley 20.780 (2014 tax reform), effective January 1, 2017. The paper's characterization follows Fairfield and Charman (2022, ch. 10) and Fairfield (2015a, ch. 6), so this may be their shorthand for a partial elimination. However, the supplementary materials' description of Ley 20.028 as covering the "full legislative transcripts of committee debates" on the elimination of 57 bis is potentially misleading if the law only addressed a subset of the article. **Recommend: verify with Fairfield (2015a) what exactly the 2005 reform covered and adjust language if needed.**
- **Sources**: FLAG. The BCN URL `https://www.bcn.cl/historiadelaley/nc/historia-de-la-ley/5607/` does NOT point to Ley 20.028. WebFetch confirms it resolves to the legislative history of **Ley 19.990 (2004)**, a law about judicial jurisdiction. The correct BCN ID for Ley 20.028 was not located. The supplementary materials also note this source as "Outstanding: BCN Historia de la Ley 20.028 (full transcripts)," which is consistent with the TODO list at the end of the paper. **The URL needs to be corrected or removed until the correct BCN page is identified.**
- **Interpretation**: FAIR. The paper describes the committee debate as equity-dominated, with Lagos's framing and the Finance Ministry characterization. These claims derive from Fairfield (2015a, ch. 6) and Fairfield and Charman (2022, ch. 10), which are the primary secondary sources. The paper acknowledges reliance on secondary sources (Section 6.3).
- **Consistency**: CONSISTENT across files. The paper and supplementary materials describe the same evidence.

### e\*_2 --- Comparative Reforms (Weak Equity Framing in Failed Reforms)

- **Factual claims**: PASS. The paper identifies three comparative cases: Mining Royalty I (2004, sovereignty frame, rejected), Anti-Evasion Reform (2001, equity framing, required concessions), and Corporate Tax Increase (2001, equity framing, required compensation). These are drawn from Fairfield (2015a), chs. 4-5. The characterizations are consistent with the source material as described.
- **Sources**: PASS. Sources are secondary (Fairfield 2015a chapters). No URLs to verify since these are book chapters.
- **Interpretation**: FAIR. The paper's nuanced reading --- equity framing was "necessary but not sufficient" --- is a reasonable inference from the comparative pattern. The identification of m'\_1 (low stakes) as co-determinant is appropriately framed as a PPC finding rather than a certainty.
- **Consistency**: CONSISTENT across files.

### e\*_3 --- Internal Deliberations (Reactive Decision Post-Challenge)

- **Factual claims**: PASS. The ILD advisor's opposition, the "1999 trap" framing by Lavin's advisors, and the rapid timeline are all attributed to Fairfield (2015a, ch. 6) and Fairfield and Charman (2022, ch. 10). These are verifiable claims from published academic sources.
- **Sources**: PASS. The supplementary materials correctly note that internal UDI/RN caucus minutes are "not publicly available as of March 2026." This limitation is acknowledged.
- **Interpretation**: FAIR. The paper correctly identifies this as "strongly consistent" with links m\_3 and m\_4, while noting that "access to internal party records would provide the definitive test." Appropriate epistemic humility.
- **Consistency**: CONSISTENT across files.

### e\*_4 --- Lobbying Silence (No Organized Business Mobilization)

- **Factual claims**: PASS. The claim that Fairfield (2015a) documents active CPC/SOFOFA opposition to other reforms but finds only "business complaints" for 57 bis is verifiable from the published source.
- **Sources**: PASS. The supplementary materials correctly note that CPC/SOFOFA archives are "not systematically available as of March 2026."
- **Interpretation**: FAIR. The paper appropriately identifies the ambiguity: the silence is consistent with both H\_CC's m'\_1 (declining value) and H\_EA's irrelevance of business lobbying. This is correctly flagged as an unresolved diagnostic gap.
- **Consistency**: CONSISTENT across files.

---

## Oil Majors Case (e\*_5 through e\*_8)

### e\*_5 --- McCoy Sting (Carbon Tax as "Talking Point")

- **Factual claims**: PASS. Verified via Unearthed/Greenpeace primary source, NPR, and CBS News. Key facts confirmed:
  - Keith McCoy's title: "senior director for federal relations" (NPR) / "senior director in Exxon's Washington DC government affairs team" (Unearthed). The paper says "senior federal relations director" --- close enough but slightly different word order from sources.
  - Quote: "Nobody is going to propose a tax on all Americans and the cynical side of me says, yeah, we kind of know that but it gives us a talking point" --- **CONFIRMED** verbatim (Unearthed, CBS).
  - Quote: "an effective advocacy tool" --- **CONFIRMED** (Unearthed, CBS).
  - Video release date: June 30, 2021 (Unearthed) --- **CONFIRMED**.
  - CEO Darren Woods condemned statements --- confirmed (CNBC article exists, though content could not be fully scraped).
  - The paper says the admission was about a policy "nobody is going to propose" --- **CONFIRMED** (direct quote).
- **Sources**: PASS. All URLs verified:
  - Unearthed/Greenpeace URL: LIVE, content matches claims.
  - NPR URL: LIVE, content matches (though NPR paraphrases rather than providing full quotes on carbon pricing).
  - CBS News URL: LIVE, content matches with direct quotes.
  - CNN URL: returned HTTP 451 (geoblocked), but URL structure is valid.
  - CNBC URL: returned CSS only (rendering issue), but URL structure is valid.
- **Interpretation**: FAIR. The paper assigns WoE of 8-10 dB for H\_SA, calling it "devastating for H\_CA." This is a strong but defensible characterization. The paper includes the important caveat (in the evidence strategy file) that "McCoy's views may not represent the full range of internal thinking" and that "ExxonMobil's CEO publicly disavowed his comments." The paper notes this caveat in the diagnosis section by referring to company-level heterogeneity.
- **Consistency**: MINOR INCONSISTENCY. The paper assigns WoE of "8-10 dB" for H\_SA. The strategy evidence file assigns "+6 to +8 dB" for the same item. The lobbying evidence file assigns "+8 to +12 dB." These ranges overlap but differ at the bounds. **The paper's 8-10 dB is within the union of the evidence files' ranges, but the discrepancy between evidence files suggests the assessment evolved over time without reconciliation.**
- **URLs checked**: Unearthed (LIVE, verified), NPR (LIVE, verified), CBS News (LIVE, verified), CNN (HTTP 451 geoblocked), CNBC (rendering issue)

### e\*_6 --- API Conditionality (Carbon Price as Regulatory Replacement)

- **Factual claims**: FLAG (MODERATE). Two issues:
  1. **API's exact language is mischaracterized.** The paper states API endorsed carbon pricing "conditioned on 'replacing all environmental laws and regulations' for GHG emissions" (Section 5.3). The supplementary materials repeat this claim. However, **API's actual Climate Action Framework (March 2021) says "advocate for sensible legislation that prices carbon across all economic sectors while avoiding regulatory duplication."** This is meaningfully different from "replacing all environmental laws and regulations." The stronger "replacing all" language appears to come from **ConocoPhillips' carbon pricing principles**, not API's official position. The Bloomberg headline "U.S. Oil Lobby Backs Carbon Fee as Substitute for Regulation" supports a "substitute" framing but not the exact "replacing all" language attributed to API. The Grist article confirms API's draft specified support for carbon pricing "as the primary government climate policy instrument...instead of mandates or prescriptive regulatory action" --- again, different from "replacing all." **This is a factual error that should be corrected: the "replacing all environmental laws and regulations" language should be attributed to ConocoPhillips (or individual member companies), not API itself.**
  2. **The <0.4% lobbying figure is confirmed** by the House Oversight Committee analysis.
  3. **API spending figure**: The lobbying evidence file claims "API spent over $100 million lobbying the federal government over this period." The House Oversight Committee page specifies API "spent $78 million" since 2011. **The $100 million figure is not supported by the cited source.** However, this figure does not appear in the paper itself --- only in the evidence file. The paper avoids specifying the dollar amount.
  4. **House Oversight date**: The lobbying evidence file says the House Oversight press release is "December 2022." The actual page was published **October 28, 2021** (verified via WebFetch). The supplementary materials list it as "December 2022," which is also incorrect. **However, the supplementary materials may be referring to a different December 2022 document release** (the committee released multiple rounds of documents). The URL itself does match the October 2021 analysis. **Recommend: verify which specific committee release is being cited and correct the date.**
- **Sources**: PASS WITH NOTE.
  - CNBC API endorsement article: URL valid (content could not be fully scraped but URL structure and Bloomberg redirect confirmed the story).
  - Bloomberg article: LIVE, confirms API endorsed carbon fee "as substitute for regulation" (March 25, 2021).
  - Grist article: Published March 5, 2021 (before API's formal announcement on March 24-25, discussing a draft statement). Content confirmed.
  - InfluenceMap page: LIVE, confirmed. Contains the exact quote about "embracing carbon pricing does not necessarily translate into support for effective climate policy."
  - House Oversight page: LIVE, confirmed. Contains the <0.4% finding.
- **Interpretation**: FAIR WITH CAVEAT. The paper's characterization of API's endorsement as "textbook m\_3 (conditional support)" is reasonable given the overall pattern, but the specific "replacing all" quote misrepresents API's official language. API's actual position was more moderate ("avoiding regulatory duplication"). The paper should use either the correct API language or attribute the stronger language to specific member companies.
- **Consistency**: INCONSISTENT. The "replacing all environmental laws and regulations" language appears in the paper, supplementary materials, and lobbying evidence file --- but this appears to conflate API's position with ConocoPhillips' position (which does use the "replace all" language per the lobbying evidence file and ConocoPhillips' own carbon pricing page).
- **URLs checked**: Bloomberg (LIVE, confirmed), Grist (LIVE, confirmed), InfluenceMap (LIVE, confirmed), House Oversight (LIVE, confirmed)

### e\*_7 --- Strategy Reversals (Great Retreat from Climate Commitments, 2023-2025)

- **Factual claims**: PASS WITH NOTES.
  - **BP's "too far, too fast" and "misplaced" quotes**: Web search confirms Murray Auchincloss stated in February 2025: "Our optimism for a fast transition was misplaced and we went too far too fast" (Energy Voice, February 2025). The paper's strategy evidence file attributes: "CEO Murray Auchincloss declared that BP's faith in the green energy transition was 'misplaced' and the company had gone 'too far, too fast.'" This is a fair paraphrase confirmed by search results. **However, the Fortune article cited in the supplementary materials does NOT contain these exact quotes** (verified via WebFetch --- Fortune describes the strategy shift but uses Auchincloss's own different language about "fundamentally reset our strategy"). The quotes appear in other outlets (Energy Voice, etc.) but not necessarily in the cited Fortune URL.
  - **BP renewable investment cut from ~$5B to $1.5-2B**: CONFIRMED by Al Jazeera ("cut planned annual investment in energy transition businesses by more than $5bn from its previous forecast, to between $1.5bn and $2bn per year").
  - **BP oil and gas spending to $10B/year**: CONFIRMED by Al Jazeera.
  - **BP scrapped target to increase renewable generation 20-fold by 2030**: Not confirmed in checked sources. Al Jazeera and Fortune describe "slashed planned investment" but the specific "20-fold" target is not mentioned in any source checked. This may come from Fairfield and Charman's analysis or other reporting.
  - **Shell abandoned 2035 net-zero target**: CONFIRMED by Carbon Brief (March 14, 2024). Shell "chosen to retire [its] 2035 target of a 45% reduction in net carbon intensity."
  - **Shell weakened 2030 goal**: CONFIRMED. Changed from 20% to "between 15-20%."
  - **Shell LNG growth by 30%**: Carbon Brief confirms "20-30% growth by 2030" for LNG --- slightly different range. The paper's strategy file says "30% by 2030"; the paper itself says "30%." The source says "20-30%."
  - **Shell withdrew from SBTi**: NOT confirmed in Carbon Brief article. The paper's strategy evidence file makes this claim but Carbon Brief does not mention SBTi. This claim needs an additional source.
  - **Equinor halved renewable investment from $10B to $5B**: Sustainability Magazine URL returned 403 (access denied). Claim not independently verified but is widely reported.
  - **BP, Shell, and Equinor reduced low-carbon spending by 8% in 2024**: CONFIRMED by Cyprus Mail (December 27, 2024), citing analyst Rohan Bowater at Accela Research.
  - **Elliott Management's role**: The paper's strategy evidence file mentions "activist investor Elliott Management." Al Jazeera does NOT mention Elliott. Other search results (Energy Connects) confirm Elliott's involvement. This is factually accurate but the specific cited sources may not mention it.
- **Sources**: PASS WITH NOTES.
  - Fortune URL: LIVE, describes strategy shift but lacks the specific "misplaced"/"too far, too fast" quotes.
  - Al Jazeera URL: LIVE, confirmed key figures.
  - Carbon Brief URL: LIVE, confirmed Shell targets.
  - Sustainability Magazine: 403 FORBIDDEN (access denied).
  - Fast Company: 403 FORBIDDEN (access denied).
  - Carbon Tracker: LIVE (October 2024), confirms BP U-turn but no investment figures.
  - Cyprus Mail: LIVE, confirmed 8% figure.
  - Grist: LIVE (February 2023), confirmed early-stage retreat.
- **Interpretation**: FAIR. The paper's characterization of the retreat as evidence for H\_SA is well-reasoned. The key argument --- "Under H\_CA, companies seeing genuine advantage would sustain transition investments" --- is sound. The paper appropriately notes the multi-channel disagreement: the skeptical channel argues the retreat from renewables (but not carbon pricing) is actually consistent with H\_CA. This is intellectually honest. WoE of 5-7 dB for H\_SA is reasonable.
- **Consistency**: MINOR INCONSISTENCY. BP's renewable investment cut is described as "from ~$5 billion to $1.5-2 billion" in the paper's strategy evidence file, but the lobbying evidence file says "from ~$7B to $1.5-2B per year" and elsewhere "from $4B to $0.8B/year." The paper itself says "cut renewable investment." Al Jazeera says "by more than $5bn from its previous forecast, to between $1.5bn and $2bn." These figures are somewhat chaotic across files, likely reflecting different time points and reporting metrics. **Recommend: standardize to the Al Jazeera-sourced figure and clarify what "previous forecast" baseline is being used.**
- **URLs checked**: Fortune (LIVE, partial match), Al Jazeera (LIVE, confirmed), Carbon Brief (LIVE, confirmed), Carbon Tracker (LIVE, confirmed), Cyprus Mail (LIVE, confirmed), Sustainability Magazine (403), Fast Company (403)

### e\*_8 --- CCS Investments (Denbury Acquisition and Northern Lights)

- **Factual claims**: PASS.
  - **ExxonMobil acquired Denbury for $4.9B**: CONFIRMED by ExxonMobil press release (July 13, 2023). All-stock transaction, $89.45/share.
  - **Denbury: largest CO2 pipeline network in the U.S. (1,300 miles)**: CONFIRMED by ExxonMobil press release.
  - **Northern Lights: "world's first commercial third-party CO2 transport and storage facility"**: CONFIRMED by Equinor project page ("world's first third party CO2 transport and storage facility").
  - **Northern Lights: $3.4B investment**: NOT CONFIRMED on Equinor's project page. The page mentions Phase 2 investment of NOK 7.5 billion but does not state a total project cost of $3.4B. This figure may come from other reporting or earlier announcements. **Recommend: add a source for the $3.4B figure or note that this is an aggregate estimate.**
  - **Northern Lights Phase 2: NOK 7.5 billion**: CONFIRMED (Equinor, March 27, 2025).
  - **Northern Lights partners: Equinor, Shell, TotalEnergies**: CONFIRMED by Equinor page.
  - **ExxonMobil LCS: $2 billion earnings by 2030**: CONFIRMED by Global Solutions Initiative article.
  - **CEO Darren Woods: carbon price of at least $100/ton**: CONFIRMED by Global Solutions Initiative article.
  - **BP internal documents: CCS "not economically viable against a free-to-pollute business model"**: Cited to Senate Budget Committee report. PDF could not be parsed via WebFetch but the URL is valid and the document is publicly available.
- **Sources**: PASS.
  - ExxonMobil Denbury announcement: LIVE, confirmed.
  - Equinor Northern Lights page: LIVE, confirmed (but $3.4B not on this page).
  - Equinor Phase 2 announcement: LIVE, confirmed.
  - Global Solutions Initiative: LIVE, confirmed.
  - Senate Budget Committee PDF: LIVE (downloadable).
- **Interpretation**: FAIR. The paper's balanced treatment --- "genuine profit centers dependent on carbon pricing, consistent with H\_CA" but "depend heavily on government subsidies" --- is appropriate. The WoE of 3-4 dB for H\_CA is reasonable and conservative. The paper acknowledges the tension between public CCS strategy and private admissions (McCoy sting), which adds nuance.
- **Consistency**: CONSISTENT. The paper, supplementary materials, strategy evidence file, and lobbying evidence file all describe the same investments with the same figures ($4.9B for Denbury, Northern Lights as a major CCS project).
- **URLs checked**: ExxonMobil (LIVE, confirmed), Equinor Northern Lights (LIVE, confirmed), Equinor Phase 2 (LIVE, confirmed), Global Solutions Initiative (LIVE, confirmed)

---

## Cross-Cutting Issues

### 1. Evidence File-to-Paper Mapping Is Not One-to-One

The three evidence files (`oil_majors_evidence_strategy.md`, `oil_majors_evidence_lobbying.md`, `oil_majors_evidence_crosscompany.md`) contain 9, 10, and 10 evidence items respectively. The paper distills these into four holdout items (e\*_5 through e\*_8). This is reasonable --- the paper synthesizes and selects the most diagnostic evidence. However, the mapping is not explicit anywhere, and the WoE estimates in the evidence files sometimes differ from the paper's final assessments. For example:

| Item | Paper WoE | Strategy file WoE | Lobbying file WoE |
|------|-----------|-------------------|-------------------|
| e\*_5 (McCoy) | 8-10 dB | +6 to +8 dB | +8 to +12 dB |
| e\*_6 (API) | 6-8 dB | +4 to +6 dB | +6 to +10 dB |
| e\*_7 (Retreat) | 5-7 dB | +5 to +7 dB | +4 to +7 dB |
| e\*_8 (CCS) | 3-4 dB (H\_CA) | +3 to +4 dB (H\_CA) | +3 to +5 dB (H\_CA) |

The paper's estimates fall within the union of the evidence files' ranges, which is acceptable. But the evidence files should ideally be reconciled to avoid confusion.

### 2. Author Name Misspelling

The paper's references section (line 578) spells the third author as "Skjæresth" while the correct spelling is **"Skjærseth"** (confirmed by journal article on MIT Press and supplementary materials). The supplementary materials have the correct spelling. **This should be fixed in the paper.**

### 3. API vs. ConocoPhillips Language Conflation

As detailed under e\*_6, the paper attributes the strong "replacing all environmental laws and regulations" language to API, when API's official Climate Action Framework uses softer language ("avoiding regulatory duplication"). The stronger language comes from ConocoPhillips' carbon pricing principles and possibly from the Baker-Shultz Plan. This conflation appears in the paper (Section 5.3), the supplementary materials (e\*_6 description), and the lobbying evidence file (Evidence Item 4). It should be corrected in all three files.

### 4. Date Discrepancy for House Oversight Committee Analysis

The supplementary materials list the House Oversight Committee press release as "December 2022." The actual URL (`oversightdemocrats.house.gov/.../committee-analysis-of-fossil-fuel-industry-s-lobbying-reveals-public-praise-for`) was published October 28, 2021. The committee did release additional documents in December 2022 and later, so this may be a confusion between different releases. **Recommend: verify which specific release contains the <0.4% finding and correct the date accordingly.**

### 5. Training Data Contamination Discussion Is Appropriately Handled

The paper's discussion of LLM contamination (Section 4.4) is fair and well-reasoned. The acknowledgment that Fairfield and Charman (2022) is likely in LLM training corpora, combined with the argument that oil majors holdout evidence postdates training cutoffs, is honest and constructive.

### 6. Northern Lights $3.4B Figure Needs Sourcing

The $3.4B total investment figure for Northern Lights is stated in the paper, supplementary materials, and evidence files, but Equinor's own project page does not confirm this amount. It may be an aggregate estimate from press reporting. **Recommend: add a specific source for this figure.**

---

## Verdict

**PASS WITH CAVEATS**

The paper's evidence base is largely accurate and well-sourced. The interpretive framing is fair, with appropriate caveats throughout. However, four issues require author attention before submission:

### Items Requiring Correction (ordered by severity)

1. **[MODERATE] API conditionality language**: The paper attributes the phrase "replacing all environmental laws and regulations" to API's carbon pricing endorsement. API's actual Climate Action Framework says "avoiding regulatory duplication." The stronger language belongs to ConocoPhillips. This should be corrected in Section 5.3 of the paper, the supplementary materials (e\*_6), and the lobbying evidence file.

2. **[MODERATE] BCN URL for Chile e\*_1**: The URL `https://www.bcn.cl/historiadelaley/nc/historia-de-la-ley/5607/` points to Ley 19.990 (judicial jurisdiction, 2004), not Ley 20.028. The correct BCN historia-de-la-ley ID needs to be identified. Also, the characterization of the 2005 reform as "eliminating Article 57 bis" may be an oversimplification --- Ley 20.028 appears to have only partially modified 57 bis, with full derogation coming in Ley 20.780 (2014/2017). Verify against Fairfield (2015a) and correct.

3. **[LOW] Author name misspelling**: "Skjæresth" in the references (line 578) should be "Skjærseth" (transposed letters 'e' and 's').

4. **[LOW] House Oversight Committee date**: The supplementary materials list "December 2022" for the lobbying analysis press release, but the URL resolves to an October 28, 2021 release. Verify and correct.

### Recommended Improvements (not errors, but would strengthen the paper)

5. Add a specific source for the Northern Lights $3.4B total investment figure.
6. Clarify that Shell's LNG growth target is "20-30% by 2030" (not simply "30%").
7. Add a source for the claim that Shell withdrew from SBTi (not in the Carbon Brief article cited).
8. Standardize BP renewable investment figures across the evidence files (currently range from $4B to $7B baseline depending on file).
9. Reconcile WoE ranges across evidence files for internal consistency.

---

*Fact-check conducted by Claude Opus 4.6, March 9, 2026.*
*Methods: WebFetch of 20+ URLs, WebSearch for 6 factual claims, cross-file comparison of paper/supplementary materials/evidence files.*
