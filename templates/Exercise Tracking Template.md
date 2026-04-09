# Purple Team Exercise Tracking Template

Use this template to track TTP execution and results during a purple team exercise.

---

## Exercise Information

| Field | Value |
|-------|-------|
| **Exercise Name** | |
| **Date** | |
| **Threat Actor** | |
| **Exercise Coordinator** | |
| **Red Team Lead** | |
| **Blue Team Lead** | |
| **Cloud Environments in Scope** | |
| **Identity Providers in Scope** | |

---

## TTP Execution Tracker

### Instructions

For each TTP:
1. Red Team fills in execution details (columns 1-7)
2. Blue Team fills in detection results (columns 8-12)
3. Exercise Coordinator fills in action items (column 13)

---

### TTP Tracking Table

| # | TTP Name | ATT&CK ID | Tactic | Start Time | End Time | Red Team Notes | Detected? | Detection Method | TTD (min) | TTI (min) | Blue Team Notes | Action Items |
|---|----------|-----------|--------|------------|----------|----------------|-----------|------------------|-----------|-----------|-----------------|--------------|
| 1 | | | | | | | Y/N/P | | | | | |
| 2 | | | | | | | Y/N/P | | | | | |
| 3 | | | | | | | Y/N/P | | | | | |
| 4 | | | | | | | Y/N/P | | | | | |
| 5 | | | | | | | Y/N/P | | | | | |
| 6 | | | | | | | Y/N/P | | | | | |
| 7 | | | | | | | Y/N/P | | | | | |
| 8 | | | | | | | Y/N/P | | | | | |
| 9 | | | | | | | Y/N/P | | | | | |
| 10 | | | | | | | Y/N/P | | | | | |
| 11 | | | | | | | Y/N/P | | | | | |
| 12 | | | | | | | Y/N/P | | | | | |
| 13 | | | | | | | Y/N/P | | | | | |
| 14 | | | | | | | Y/N/P | | | | | |
| 15 | | | | | | | Y/N/P | | | | | |

**Legend:**
- Y = Yes (Detected)
- N = No (Not Detected)
- P = Partial (Some visibility)
- TTD = Time to Detect
- TTI = Time to Investigate

---

## Red Team Execution Log

### TTP 1: [Name]

| Field | Value |
|-------|-------|
| **ATT&CK ID** | |
| **Execution Time** | |
| **Source System** | |
| **Source IP** | |
| **Target System** | |
| **Target IP** | |
| **Target Account** | |
| **Command/Action** | |
| **Payload Hash** | |
| **Result** | Success / Failed / Partial |
| **Artifacts Created** | |
| **Notes** | |

---

### TTP 2: [Name]

| Field | Value |
|-------|-------|
| **ATT&CK ID** | |
| **Execution Time** | |
| **Source System** | |
| **Source IP** | |
| **Target System** | |
| **Target IP** | |
| **Target Account** | |
| **Command/Action** | |
| **Payload Hash** | |
| **Result** | Success / Failed / Partial |
| **Artifacts Created** | |
| **Notes** | |

---

*[Copy and repeat for each TTP...]*

---

## Blue Team Detection Log

### TTP 1: [Name]

| Field | Value |
|-------|-------|
| **ATT&CK ID** | |
| **Detection Status** | Detected / Not Detected / Partial |
| **Detection Time** | |
| **Time to Detect (TTD)** | min |
| **Detection Method** | Alert / Telemetry / Hunt / Forensics |
| **Alert Name (if any)** | |
| **Detection Source** | |
| **Query/Rule Used** | |
| **Investigation Time** | min |
| **Analyst** | |
| **Notes** | |

---

### TTP 2: [Name]

| Field | Value |
|-------|-------|
| **ATT&CK ID** | |
| **Detection Status** | Detected / Not Detected / Partial |
| **Detection Time** | |
| **Time to Detect (TTD)** | min |
| **Detection Method** | Alert / Telemetry / Hunt / Forensics |
| **Alert Name (if any)** | |
| **Detection Source** | |
| **Query/Rule Used** | |
| **Investigation Time** | min |
| **Analyst** | |
| **Notes** | |

---

*[Copy and repeat for each TTP...]*

---

## Running Metrics Summary

Update these metrics as the exercise progresses.

| Metric | Value | Notes |
|--------|-------|-------|
| **Total TTPs Planned** | | |
| **TTPs Executed** | | |
| **TTPs Detected** | | |
| **TTPs Partially Detected** | | |
| **TTPs Not Detected** | | |
| **Detection Rate** | % | |
| **Average TTD** | min | |
| **Fastest Detection** | min | TTP: |
| **Slowest Detection** | min | TTP: |

---

## Action Items Log

Track action items as they arise during the exercise.

| # | TTP | Action Item | Owner | Priority | Status | Due Date |
|---|-----|-------------|-------|----------|--------|----------|
| 1 | | | | H/M/L | Open | |
| 2 | | | | H/M/L | Open | |
| 3 | | | | H/M/L | Open | |
| 4 | | | | H/M/L | Open | |
| 5 | | | | H/M/L | Open | |
| 6 | | | | H/M/L | Open | |
| 7 | | | | H/M/L | Open | |
| 8 | | | | H/M/L | Open | |
| 9 | | | | H/M/L | Open | |
| 10 | | | | H/M/L | Open | |

---

## Quick Notes

Use this section for real-time notes during the exercise.

### Day 1

**Time:**
**Note:**

---

**Time:**
**Note:**

---

### Day 2 (if multi-day)

**Time:**
**Note:**

---

**Time:**
**Note:**

---

## End of Day Summary

### Day 1 Summary

| Metric | Value |
|--------|-------|
| TTPs Executed | |
| TTPs Detected | |
| Action Items Created | |
| Key Observations | |

### Day 2 Summary (if multi-day)

| Metric | Value |
|--------|-------|
| TTPs Executed | |
| TTPs Detected | |
| Action Items Created | |
| Key Observations | |

---

## Exercise Wrap-Up Checklist

- [ ] All TTPs executed and documented
- [ ] All detection results recorded
- [ ] All action items captured
- [ ] Metrics calculated and verified
- [ ] Participant feedback collected
- [ ] Cleanup procedures completed
- [ ] Data exported for reporting

---

*Template version: PTEFv4*
*Purple Team Exercise Framework - github.com/scythe-io/purple-team-exercise-framework*
