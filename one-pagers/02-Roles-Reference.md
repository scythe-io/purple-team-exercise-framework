# Purple Team Roles Quick Reference

## Exercise Coordinator & Aide

**Primary Contact** for the entire exercise

| Phase | Responsibilities |
|-------|-----------------|
| Planning | Ensure CTI is provided, track all planning steps, schedule meetings |
| Execution | Record minutes (aide), notes (aide), action items, feedback; keep exercise on track |
| Post | Compile lessons learned, deliver report, track remediation |

---

## Sponsors

**Management approval and support**

| Responsibility |
|----------------|
| Approve exercise goals, budget, and scope |
| Select attendees from their teams |
| Remove daily duties from participants during exercise |
| Receive and act on lessons learned |

---

## Cyber Threat Intelligence (CTI)

**Intelligence provider** - Internal or third-party

| Phase | Responsibilities |
|-------|-----------------|
| Planning | Identify adversaries with opportunity, intent, capability |
| Planning | Consume and extract adversary TTPs at procedure level |
| Planning | Assist the Red Team in creating an adversary emulation plan |
| Execution | Present adversary context for each TTP |
| Execution | Participate as spectator to learn about organization |

---

## Red Team

**Adversary emulation**

| Phase | Responsibilities |
|-------|-----------------|
| Planning | Understand TTPs, prepare reliable emulation plan |
| Planning | Set up attack infrastructure |
| Planning | Test payloads on non-exercise systems |
| Planning | Document all commands in playbook |
| Execution | Execute TTPs, share screen, provide all IOCs |
| Execution | Provide: Attacker IP, target, exact time, behaviors |

---

## Blue Team (SOC / Hunt / DFIR)

**Detection and response**

### SOC Analysts
| Phase | Responsibilities |
|-------|-----------------|
| Execution | Attempt detection via alerts and telemetry |
| Execution | Follow standard investigation process |
| Execution | Report time to detect, time to investigate |

### Hunt Team
| Phase | Responsibilities |
|-------|-----------------|
| Planning | Share current playbooks |
| Execution | Hunt for TTP evidence in telemetry |
| Execution | Identify gaps in visibility |

### DFIR
| Phase | Responsibilities |
|-------|-----------------|
| Execution | Perform forensic analysis |
| Execution | Identify artifacts and evidence |
| Execution | Report time to remediate |

### Cloud & Identity (if in scope)
| Phase | Responsibilities |
|-------|-----------------|
| Planning | Confirm cloud accounts/subscriptions in scope and authorized |
| Planning | Verify cloud security tools (CSPM, CWPP, audit logs) are reporting |
| Planning | Scope identity providers and federation trust paths |
| Execution | Monitor cloud-native detection (GuardDuty, Sentinel, Chronicle) |
| Execution | Investigate identity-based attacks (IdP logs, ITDR alerts) |

---

## Responsibility Matrix

| Role | Planning | CTI | Execution | Lessons |
|------|:--------:|:---:|:---------:|:-------:|
| Exercise Coordinator | Lead | Support | Lead | Lead |
| Sponsors | Approve | - | Observe | Review |
| CTI | Support | Lead | Present | Support |
| Red Team | Prepare | Consume | Execute | Support |
| SOC | Minimal | Review | Detect | Feedback |
| Hunt | Playbooks | Review | Hunt | Feedback |
| DFIR | Minimal | Review | Analyze | Feedback |

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
