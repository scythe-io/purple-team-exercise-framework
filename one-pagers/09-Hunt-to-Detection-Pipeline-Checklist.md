# Hunt-to-Detection Pipeline Checklist

Use this checklist to convert a threat hunt finding into a production detection rule. This pipeline applies to findings from purple team exercises, ad-hoc hunts, CTI-driven hunts, or anomaly investigations. Complete each phase before moving to the next.

---

## Finding Information

| Field | Value |
|-------|-------|
| Hunt ID / Ticket | |
| Hunt Analyst | |
| Date Finding Identified | |
| Trigger Source | Purple Team Exercise / CTI Report / Anomaly / Ad-hoc Hunt |
| ATT&CK Technique ID | |
| Technique Name | |
| Summary of Finding | |

---

## Phase 1: Hypothesis Formation

- [ ] Define the hunt hypothesis in a single testable statement
  - Template: "An adversary performing [technique] will generate [observable] in [data source] that can be distinguished from legitimate activity by [differentiator]."
  - Example: "An adversary using Pass-the-Hash will generate Event ID 4624 with Logon Type 9 from a non-standard source process."
- [ ] Identify the trigger that initiated this hunt:
  - [ ] Purple team exercise gap (reference exercise ID and TTP)
  - [ ] New CTI report (reference report or intel source)
  - [ ] Detection gap from previous exercise
  - [ ] Anomalous behavior observed during monitoring
  - [ ] Other: _______________
- [ ] Map the hypothesis to an ATT&CK technique and tactic
- [ ] Identify the data sources needed to test the hypothesis (reference [ATT&CK Data Sources](https://attack.mitre.org/datasources/))
- [ ] Confirm the required data sources are available and ingesting

**Methodology reference:** [PEAK Framework](https://www.splunk.com/en_us/blog/security/peak-hypothesis-driven-threat-hunting.html) (Prepare, Execute, Act, Knowledge) or [SANS Hypothesis-Driven Hunting](https://www.sans.org/white-papers/37172)

---

## Phase 2: Query Development

- [ ] Write an initial query against available telemetry to test the hypothesis
- [ ] Document the query details:
  - [ ] Platform (SIEM, EDR console, hunting tool)
  - [ ] Query language (SPL, KQL, EQL, Lucene, SQL)
  - [ ] Data sources and index/table names
  - [ ] Key fields and filtering logic
  - [ ] Time range searched
- [ ] Run the query against historical data (minimum 30 days where possible)
- [ ] Record the results:
  - [ ] Total events returned
  - [ ] True positives identified (if any)
  - [ ] False positives / benign matches
  - [ ] No results (refine hypothesis or query)
- [ ] Iterate on the query if initial results are too noisy or too narrow

---

## Phase 3: Validation and Refinement

- [ ] If the hunt was triggered by a purple team exercise or CTI report, coordinate with the Red Team to execute the TTP in a controlled setting
- [ ] Confirm the query detects the TTP execution
- [ ] Execute variations of the TTP to test query breadth:
  - [ ] Different tools or utilities
  - [ ] Different parameters or flags
  - [ ] Different user contexts (standard user, admin, service account)
  - [ ] Different target systems (workstation, server, cloud)
- [ ] Refine the query to distinguish malicious behavior from legitimate activity
- [ ] Document the differentiators (what makes this malicious vs. benign)
- [ ] Measure the false positive rate against baseline activity
- [ ] Record sample events: at least 2 true positive examples and 2 false positive examples (if any)

**Gate:** The query must reliably detect the TTP with a manageable false positive rate before proceeding. If the query cannot distinguish malicious from benign, document why and close the finding as "not automatable" (it remains a hunt playbook only).

---

## Phase 4: Detection Candidate Submission

- [ ] Package the finding as a detection candidate with the following:

| Field | Value |
|-------|-------|
| **ATT&CK Technique ID** | |
| **Technique Name** | |
| **Tactic** | |
| **Query Logic** | (paste or link to query) |
| **Data Source Requirements** | |
| **Target Platform** | SIEM / EDR / NDR / Cloud-native |
| **Expected False Positive Rate** | |
| **Sample True Positive Events** | (attach or link) |
| **Sample False Positive Events** | (attach or link) |
| **Recommended Alert Severity** | Critical / High / Medium / Low |
| **Robustness Assessment** | (Pyramid of Pain level or Summiting the Pyramid score) |
| **Hunt Analyst Notes** | |

- [ ] Submit the candidate to the detection engineering backlog (JIRA, GitLab Issues, shared backlog, or equivalent)
- [ ] Tag the submission with the source trigger (exercise ID, CTI report, hunt ID)

---

## Phase 5: Detection Engineering Review and Deployment

This phase is owned by the Detection Engineering team. The hunt analyst supports as needed.

- [ ] Detection engineer reviews the candidate and accepts or returns with questions
- [ ] Author the detection rule in the appropriate format:
  - [ ] Sigma 2.0 (preferred for portability)
  - [ ] Platform-native rule
  - [ ] YARA (for file/memory patterns)
- [ ] Follow the [Detection Lifecycle Checklist](./08-Detection-Lifecycle-Checklist.md) from Phase 2 (Design) onward:
  - [ ] Peer review
  - [ ] Validation against TTP execution
  - [ ] False positive tuning
  - [ ] Production deployment
  - [ ] Regression test enrollment
- [ ] Create or update the SOC response playbook for this detection

---

## Phase 6: Knowledge Base Update

- [ ] Add the hunt finding and resulting detection to the team's knowledge base or wiki
- [ ] Update the ATT&CK Navigator coverage layer to reflect the new detection
- [ ] If the finding originated from a purple team exercise, update the exercise tracking system (PlexTrac, VECTR, JIRA) to mark the gap as addressed
- [ ] If the finding originated from a CTI report, link the detection back to the intelligence source
- [ ] Share the finding at the next joint Hunt / Detection Engineering review session
- [ ] Close the original hunt ticket with a summary:
  - [ ] Hypothesis (confirmed / refuted / partially confirmed)
  - [ ] Detection rule name and ID
  - [ ] Production deployment date
  - [ ] Regression test schedule

---

## Handoff Tracking

| Milestone | Date | Owner |
|-----------|------|-------|
| Hypothesis formed | | Hunt Analyst |
| Query validated | | Hunt Analyst |
| Candidate submitted to backlog | | Hunt Analyst |
| Detection engineer assigned | | Det. Eng. Lead |
| Rule deployed to production | | Detection Engineer |
| Regression test confirmed | | Detection Engineer |
| Knowledge base updated | | Hunt Analyst |
| Hunt ticket closed | | Hunt Analyst |

**Total Pipeline Duration:** ___ days (target: < 30 days from validated finding to production detection)

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
