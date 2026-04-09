# ATT&CK Navigator Layer Cheat Sheet

Quick reference for creating, maintaining, and combining ATT&CK Navigator layers throughout the purple team exercise lifecycle.

**Navigator URL:** [mitre-attack.github.io/attack-navigator](https://mitre-attack.github.io/attack-navigator/enterprise/)

---

## The Four Purple Team Layers

| # | Layer Name | When to Create | Scored By | Owner |
|---|-----------|----------------|-----------|-------|
| 1 | Pre-Exercise Detection Coverage | During Blue Team preparation, before the exercise | Detection maturity (0-3) | Blue Team Lead |
| 2 | Threat Actor TTP Layer | During CTI phase, after adversary selection | Presence (0 or 1) | CTI Analyst |
| 3 | Exercise Results | During exercise execution, updated per TTP | Graded outcome (0-5) | Exercise Coordinator |
| 4 | Post-Remediation Coverage | After gap remediation is complete | Detection maturity (0-3) | Blue Team Lead |

---

## Scoring Scales

### Detection Coverage Scale (Layers 1 and 4)

| Score | Level | Color (suggested) |
|-------|-------|--------------------|
| 0 | **No Visibility** -- Telemetry not collected | Red `#ff6666` |
| 1 | **Telemetry Available** -- Logs collected, no detection rule | Yellow `#ffd966` |
| 2 | **Detection Deployed** -- Automated rule in place | Light Green `#a9d18e` |
| 3 | **Detection Validated** -- Rule confirmed to fire on test data | Dark Green `#6aa84f` |

### Threat Actor Scale (Layer 2)

| Score | Level | Color (suggested) |
|-------|-------|--------------------|
| 0 | Not a known TTP for this threat actor | (no color) |
| 1 | Known TTP attributed to the threat actor | Red `#c00000` |
| 1 | High-priority TTP (crown jewel access path) | Purple `#7030a0` |

### Graded Outcome Scale (Layer 3)

| Score | Level | Color (suggested) |
|-------|-------|--------------------|
| 0 | **No Visibility** -- TTP produced no observable data | Dark Red `#c00000` |
| 1 | **Telemetry Available** -- Logs found with manual query | Red `#ff6666` |
| 2 | **Hunt Capable** -- Hunt team found evidence via ad-hoc query | Yellow `#ffd966` |
| 3 | **Alert Generated** -- Automated rule fired, alert in SOC queue | Amber `#ffc000` |
| 4 | **Alert Triaged** -- Analyst picked up, classified, and escalated | Light Green `#a9d18e` |
| 5 | **Full Response** -- Complete chain: alert, triage, investigation, containment | Dark Green `#2e7d32` |

---

## Creating Layers

### From Scratch

1. Open the Navigator and select "Create New Layer" > "Enterprise"
2. Click the technique selection dropdown and begin scoring techniques
3. Use the gradient settings (gear icon) to match the scoring scale above
4. Add legend items matching the score levels for clarity
5. Export as JSON and save to your version-controlled repository

### From DeTT&CT

1. Run DeTT&CT scoring against your data sources and detections
2. Export the DeTT&CT output as a Navigator layer (JSON)
3. Import into the Navigator via "Open Existing Layer" > "Upload from local"
4. Use this as your Layer 1 (Pre-Exercise Detection Coverage) baseline

### From ATT&CK Groups Page

1. Navigate to the threat actor's page on [ATT&CK Groups](https://attack.mitre.org/groups/)
2. Click "ATT&CK Navigator Layers" in the sidebar
3. Download the layer JSON
4. Import into the Navigator as your starting point for Layer 2
5. Customize: highlight high-priority TTPs and add comments from your CTI analysis

---

## Creating Layers from Other Layers

The ATT&CK Navigator's "Create Layer from Other Layers" feature allows you to combine multiple layers using score expressions. This is useful for generating derived views without manually scoring techniques. When creating a new layer, assign each input layer a variable (a, b, c, d) and write a score expression that calculates the value for each technique in the output layer.

### How to Use

1. In the Navigator, click "Create Layer from Other Layers"
2. Add each of your four layers and assign it a variable letter (a, b, c, d)
3. Enter a score expression in the expression field (see Expression Reference below)
4. Click "Create"
5. Apply a gradient and legend that matches the output scale
6. Export as JSON for archival

### Variable Assignments

Using the four purple team layers as inputs:

| Variable | Layer |
|----------|-------|
| `a` | Pre-Exercise Detection Coverage (scored 0-3) |
| `b` | Threat Actor TTP Layer (scored 0 or 1) |
| `c` | Exercise Results (scored 0-5) |
| `d` | Post-Remediation Detection Coverage (scored 0-3) |

### Understanding the Scoring Scales

The Detection Coverage layers (a and d) use a four-level scale representing the maturity of detection for each technique:

| Score | Level | Meaning |
|-------|-------|---------|
| 0 | No Visibility | Telemetry is not collected for this technique |
| 1 | Telemetry Available | Logs are collected but no detection rule exists |
| 2 | Detection Deployed | An automated detection rule is in place |
| 3 | Detection Validated | The rule has been confirmed to fire correctly on known-good test data |

The Exercise Results layer (c) uses the Graded Outcome Scoring scale, which extends the coverage model to include the human response chain:

| Score | Level | Meaning |
|-------|-------|---------|
| 0 | No Visibility | No telemetry collected; the TTP produced no observable data |
| 1 | Telemetry Available | Raw logs are present and can be found with a manual query |
| 2 | Hunt Capable | The hunt team can find evidence through ad-hoc queries or documented playbooks |
| 3 | Alert Generated | An automated detection rule fires and creates an alert in the SOC queue |
| 4 | Alert Triaged | The alert is picked up by an analyst, correctly classified, and escalated |
| 5 | Full Response | The complete detection-to-response chain functions: alert, triage, investigation, and containment |

### Expression Reference

**Pre-Exercise Gap Analysis** -- Where does the threat actor overlap with weak coverage?

```
b * (3 - a)
```

This multiplies the threat actor layer by the inverse of the detection coverage score. Techniques where the threat actor is active and the organization has no visibility (a = 0) receive the highest score (3). Techniques where coverage is already validated (a = 3) receive a score of 0. The result highlights the most critical gaps to prioritize in the exercise scope.

*Example: If APT29 uses T1003 (b=1) and coverage is Telemetry Available (a=1), the gap score is 1 × (3-1) = 2 (high priority). If coverage is already validated (a=3), the score is 1 × (3-3) = 0 (no gap).*

**Coverage Improvement Delta** -- What changed after remediation?

```
d - a
```

Subtracts the pre-exercise score from the post-remediation score for each technique. Positive values indicate improvement. A value of 0 means no change. This layer is useful for executive reporting because it shows exactly where the organization improved as a direct result of the exercise.

*Example: If pre-exercise coverage was No Visibility (a=0) and post-remediation is Detection Validated (d=3), the delta is 3-0 = +3 (maximum improvement). If coverage was unchanged at Telemetry Available (a=1, d=1), the delta is 0.*

**Remaining Gaps After Remediation** -- Where does the threat actor still have an advantage?

```
b * (3 - d)
```

Same logic as the pre-exercise gap analysis but scored against the post-remediation layer. Techniques that still score high after remediation should be prioritized in the next exercise or added to the detection engineering backlog.

*Example: If APT29 uses T1003 (b=1) and post-remediation coverage is Detection Deployed (d=2), the remaining gap is 1 × (3-2) = 1 (low residual risk). If coverage reached Validated (d=3), the score is 0 (gap closed).*

**Exercise Results Filtered to Threat Actor TTPs**

```
b * c
```

Zeros out exercise scores for any technique not in the threat actor layer, producing a focused view of how the organization performed against the specific adversary being emulated.

*Example: If APT29 uses T1003 (b=1) and the exercise outcome was Alert Triaged (c=4), the filtered score is 1 × 4 = 4. For a technique not in the threat actor profile (b=0), the score becomes 0 regardless of exercise results.*

**Unresolved Process and Timeliness Gaps** -- Alerts exist but response failed

```
b * (c > 0) * (5 - c)
```

Filters to techniques where the threat actor is active and some level of detection exists (score above 0), then inverts the exercise score so that partial detections (score 1-3) rank highest. This highlights techniques where telemetry or alerts exist but the response chain broke down, pointing to process, triage, or timeliness issues rather than engineering gaps.

*Example: If APT29 uses T1003 (b=1) and the outcome was Alert Generated but not triaged (c=3), the process gap score is 1 × 1 × (5-3) = 2. If there was No Visibility (c=0), the score is 1 × 0 × 5 = 0 (filtered out because this is an engineering gap, not a process gap).*

### Quick Expression Summary

| Expression | Output | Best For |
|------------|--------|----------|
| `b * (3 - a)` | 0-3 | Exercise scoping |
| `d - a` | -3 to +3 | Executive reporting |
| `b * (3 - d)` | 0-3 | Next exercise planning |
| `b * c` | 0-5 | Focused exercise results |
| `b * (c > 0) * (5 - c)` | 0-5 | People/process gap identification |

---

## Integration with DeTT&CT

[DeTT&CT](https://github.com/rabobank-cdc/DeTTECT) can generate ATT&CK Navigator layers automatically from data source and detection scoring inputs. Organizations already using DeTT&CT for visibility scoring should export DeTT&CT layers and import them into the Navigator as the baseline detection coverage layer. This eliminates manual mapping and ensures consistency between the visibility scoring model and the exercise preparation artifacts.

---

## Layer File Management

### Naming Convention

```
[exercise-date]-[layer-number]-[layer-name].json
```

Examples:
```
2026-03-15-01-pre-exercise-detection-coverage.json
2026-03-15-02-apt29-threat-actor-ttps.json
2026-03-15-03-exercise-results.json
2026-05-15-04-post-remediation-coverage.json
```

### Storage

Store layer JSON files in the same version-controlled repository as detection rules. Suggested directory structure:

```
/detection-repo
  /navigator-layers
    /2026-Q1-APT29
      01-pre-exercise-detection-coverage.json
      02-apt29-threat-actor-ttps.json
      03-exercise-results.json
      04-post-remediation-coverage.json
    /2026-Q2-FIN7
      01-pre-exercise-detection-coverage.json
      02-fin7-threat-actor-ttps.json
      ...
```

### Tracking Progress Across Exercises

Archive layers from every exercise to create a historical record of detection maturity. Comparing layers across quarters shows:

- Coverage growth trend (compare Layer 1 across quarters)
- Detection regression (techniques that were covered in a past exercise but are no longer functioning)
- Program ROI (aggregate improvement over time)
- Recurring gaps (techniques that appear as gaps in multiple exercises)

Include before-and-after Navigator layer comparisons in the Lessons Learned report.

---

## Quick Tips

- **Comments are your friend.** Add a comment to every scored technique explaining the current state. Future you (or the next analyst) will thank you.
- **Export as SVG** for executive presentations and reports. SVG renders cleanly in slides and documents.
- **Export as Excel** if you need to do aggregate analysis or pivot tables on technique scores.
- **Use "Select Annotated" and "Deselect All"** to quickly filter the matrix to only techniques you have scored, hiding the noise of the full ATT&CK matrix.
- **Expanded subtechniques:** Set to "annotated" in layer settings so only techniques you have scored show subtechnique detail.

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*