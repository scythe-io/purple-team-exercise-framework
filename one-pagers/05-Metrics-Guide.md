# Purple Team Metrics Guide

## Metric Categories

### 1. Detection Strategy Coverage

**Question:** Can we see the activity?

| Metric | Description | Target |
|--------|-------------|--------|
| Local Logging | Events recorded on endpoint | Yes for all TTPs |
| Central Logging | Events forwarded to SIEM | Yes for all TTPs |
| Detection Strategy Coverage | % of ATT&CK detection strategies implemented | >80% |

**Tool:** DeTT&CT for detection coverage scoring against ATT&CK v18

---

### 2. Detection Fidelity

**Question:** Do we get notified, and at what level of detail?

| Level | Description | Example |
|-------|-------------|---------|
| **None** | No visibility | Blind spot |
| **Telemetry** | Raw logs available | Process creation logged |
| **IOC Match** | Known-bad indicator hit | Hash match |
| **General Behavior** | Suspicious pattern flagged | Unusual process tree |
| **Specific Behavior** | Exact technique identified | "Credential dumping via LSASS" |

**Scoring per TTP:**

| Score | Detection Level |
|-------|-----------------|
| 0 | None |
| 1 | Telemetry only |
| 2 | IOC-based detection |
| 3 | General behavior alert |
| 4 | Specific technique alert |
| 5 | Full attack chain correlated |

**Note:** This scale measures detection quality (what type of detection fired). For measuring the full detection-to-response outcome, use the Graded Outcome Scale (0-5) in the [ATT&CK Navigator Cheat Sheet](./10-ATT&CK-Navigator-Layer-Cheat-Sheet.md).

---

### 3. Response Timing

**Question:** How fast do we respond?

| Metric | Definition | Measurement |
|--------|------------|-------------|
| **TTD** (Time to Detect) | Execution -> First detection | Minutes |
| **TTI** (Time to Investigate) | Detection -> Scope understood | Minutes |
| **TTR** (Time to Remediate) | Scope -> Contained/Eradicated | Minutes/Hours |

```
[Execution] --TTD--> [Detection] --TTI--> [Scoped] --TTR--> [Remediated]
```

---

## TTP Tracking Template

| # | TTP | ATT&CK ID | Detection Level | TTD | TTI | TTR | Gaps | Action Items |
|---|-----|-----------|-----------------|-----|-----|-----|------|--------------|
| 1 | | | 0-5 | min | min | min | | |
| 2 | | | 0-5 | min | min | min | | |
| 3 | | | 0-5 | min | min | min | | |

---

## Aggregated Metrics

### Exercise Summary

| Metric | Formula | Target |
|--------|---------|--------|
| Detection Rate | (TTPs Detected / Total TTPs) x 100 | >70% |
| Avg Detection Level | Sum of scores / Total TTPs | >3.0 |
| Avg TTD | Sum of TTD / Detected TTPs | <15 min |
| Avg TTI | Sum of TTI / Detected TTPs | <30 min |
| Coverage Gaps | TTPs with score 0-1 | <20% |

### Trend Tracking (Across Exercises)

| Exercise | Date | TTPs Tested | Detection Rate | Avg TTD | Improvements |
|----------|------|-------------|----------------|---------|--------------|
| PT-001 | | | % | min | |
| PT-002 | | | % | min | |
| PT-003 | | | % | min | |

---

## Detection Maturity Progression

```
Level 1: VISIBILITY
├── Can we see it? (Detection strategies)
│
Level 2: DETECTION
├── Do we get alerted? (Rules/Analytics)
│
Level 3: CORRELATION
├── Can we connect the dots? (Attack chain)
│
Level 4: RESPONSE
├── How fast can we act? (TTD/TTI/TTR)
│
Level 5: ENGINEERING
└── Can we sustain it? (Detection-as-Code, regression testing)
```

**Priority:** Build visibility before detection before response measurement

---

## Action Item Categories

| Category | Description | Owner |
|----------|-------------|-------|
| **Detection Coverage Gap** | Need to implement additional detection strategies | IT/Security Engineering |
| **Detection Gap** | Need new rule/alert | Detection Engineering |
| **Process Gap** | Need updated playbook/procedure | SOC/Hunt/DFIR |
| **Tool Gap** | Need new capability | Security Architecture |
| **Training Gap** | Need analyst skill development | Training/Management |

---

## Reporting Template

### Executive Summary
- Total TTPs tested: X
- Detection rate: X%
- Average time to detect: X min
- Critical gaps identified: X
- Improvements since last exercise: X

### Key Findings
1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

### Action Items by Priority
| Priority | Item | Owner | Due Date |
|----------|------|-------|----------|
| High | | | |
| Medium | | | |
| Low | | | |

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
