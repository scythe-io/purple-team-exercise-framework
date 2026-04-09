# Threat Emulation Plan Template

## [Threat Actor Name]

*Also known as: [Alternative names, if any]*

---

## Executive Summary

> High-level executive summary. This section is generally completed last after the emulation plan is finalized.

**Threat Actor:** [Name]
**Target Industries:** [Industries]
**Primary Objective:** [Objective]
**TTPs Covered:** [Number] techniques across [Number] tactics
**Estimated Exercise Duration:** [Hours/Days]

---

## Cyber Threat Intelligence

The Cyber Threat Intelligence section provides context about the threat actor. Technical details are in the Attack section.

### Profile

| Attribute | Value |
|-----------|-------|
| **Actor Name** | |
| **Also Known As** | |
| **First Observed** | |
| **Attribution** | |
| **Sophistication** | Low / Medium / High / Advanced |
| **Resource Level** | Individual / Group / Nation-State |

*Brief narrative about the threat actor...*

### Targets

| Target Type | Details |
|-------------|---------|
| **Industries** | |
| **Countries/Regions** | |
| **Organization Size** | |
| **Typical Victims** | |

### Objectives

| Objective | Description |
|-----------|-------------|
| **Primary** | E.g., ransomware, espionage, intellectual property theft |
| **Secondary** | |
| **End Goal** | |

### Capabilities

| Capability | Description |
|------------|-------------|
| **Custom Malware** | |
| **Tools Used** | |
| **Infrastructure** | |
| **Notable Techniques** | |

---

## TTP Overview

### MITRE ATT&CK Mapping

| # | Tactic | Technique ID | Technique Name | Procedure | CTI Reference |
|---|--------|--------------|----------------|-----------|---------------|
| 1 | Initial Access | T1566.001 | Spear Phishing Attachment | | |
| 2 | Execution | T1059.001 | PowerShell | | |
| 3 | Persistence | | | | |
| 4 | Privilege Escalation | | | | |
| 5 | Defense Evasion | | | | |
| 6 | Credential Access | | | | |
| 7 | Discovery | | | | |
| 8 | Lateral Movement | | | | |
| 9 | Collection | | | | |
| 10 | Command and Control | | | | |
| 11 | Exfiltration | | | | |
| 12 | Impact | | | | |

### Attack Flow Diagram

```
[Initial Access] → [Execution] → [Persistence] → [Discovery] → [Lateral Movement] → [Objective]
```

*Describe the typical attack flow for this threat actor...*

---

## Attack Emulation

This section covers how to emulate the attack at the procedure level.

### Prerequisites

| Requirement | Details |
|-------------|---------|
| **Target Systems** | |
| **Target Accounts** | |
| **Cloud Accounts/Subscriptions** | |
| **Identity Provider Access** | |
| **Attack Infrastructure** | |
| **Tools Required** | |
| **Network Access** | |

### Automated Emulation

**Platform:** [SCYTHE / Atomic Red Team / Caldera / Other]

**Import Instructions:**
```
[Commands or steps to import the emulation plan]
```

**Execution:**
```
[Commands to execute the emulation]
```

### Manual Emulation

#### TTP 1: [Technique Name] (T####.###)

**Tactic:** [Tactic Name]

**Description:** [What this technique does]

**Commands:**
```powershell
# Example command
[Command here]
```

**Expected Artifacts:**
- [Artifact 1]
- [Artifact 2]

**Cleanup:**
```powershell
# Cleanup commands
[Command here]
```

---

#### TTP 2: [Technique Name] (T####.###)

**Tactic:** [Tactic Name]

**Description:** [What this technique does]

**Commands:**
```powershell
# Example command
[Command here]
```

**Expected Artifacts:**
- [Artifact 1]
- [Artifact 2]

**Cleanup:**
```powershell
# Cleanup commands
[Command here]
```

---

*[Repeat for each TTP...]*

---

## Detection Opportunities

### Expected Observables

| TTP | Data Source | Observable | Detection Method |
|-----|-------------|------------|------------------|
| T1566.001 | Email Gateway | Attachment with macro | Signature / Behavioral |
| T1059.001 | EDR / Sysmon | Process creation | Event ID 1, 4688 |
| | | | |

### Detection Rules

| TTP | Rule Name | Platform | Status |
|-----|-----------|----------|--------|
| T1566.001 | Macro Execution | EDR | Exists / Needs Creation |
| T1059.001 | Encoded PowerShell | SIEM | Exists / Needs Creation |
| | | | |

### Required Detection Sources

| Detection Source | Required For | Priority |
|------------------|--------------|----------|
| Windows Event Logs | Process, auth, network | High |
| Sysmon | Process, file, registry | High |
| EDR Telemetry | Endpoint behavior | High |
| Network Flow | C2, lateral movement | Medium |
| Proxy Logs | Web traffic, C2 | Medium |

---

## Validation Checklist

### Pre-Exercise

- [ ] Target systems provisioned and accessible
- [ ] Security tools reporting to production dashboards
- [ ] Attack infrastructure tested
- [ ] Payloads tested on non-exercise systems
- [ ] Blue Team notified of exercise window
- [ ] Exercise case created in ticketing system

### During Exercise

- [ ] Each TTP execution attempted
- [ ] Artifacts generated as expected
- [ ] Blue Team detection status recorded
- [ ] Timestamps captured for metrics

### Post-Exercise

- [ ] All TTPs documented with results
- [ ] Detection gaps identified
- [ ] Action items created for gaps
- [ ] Cleanup commands executed
- [ ] Systems returned to normal state

---

## References

| # | Title | URL | Accessed |
|---|-------|-----|----------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

## Appendix

### A. IOCs for This Emulation

| Type | Value | Description |
|------|-------|-------------|
| IP | | C2 Server |
| Domain | | Phishing domain |
| Hash (SHA256) | | Payload |
| File Name | | Dropped file |

### B. ATT&CK Navigator Layer

*Link to or embed ATT&CK Navigator JSON layer for this threat actor*

```json
{
  "name": "[Threat Actor] Emulation",
  "versions": {
    "attack": "18",
    "navigator": "5.1.0"
  },
  "techniques": []
}
```

---

*Template version: PTEFv4*
*Last updated: [Date]*
