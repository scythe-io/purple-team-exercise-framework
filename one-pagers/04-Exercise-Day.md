# Purple Team Exercise Day Guide

## Exercise Flow

```
┌─────────────────────────────────────────────────────────────────────┐
│                         KICK-OFF                                     │
│  Sponsor remarks -> Introductions -> Present flow -> Confirm comms   │
└─────────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    FOR EACH TTP (REPEAT)                             │
│                                                                      │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐           │
│  │ 1. CTI       │    │ 2. Table-Top │    │ 3. Red Team  │           │
│  │ Presents     │ -> │ Discussion   │ -> │ Executes     │           │
│  │ Context      │    │ (Expected    │    │ (Screen      │           │
│  └──────────────┘    │  Controls)   │    │  Shared)     │           │
│                      └──────────────┘    └──────────────┘           │
│                                                 │                    │
│                                                 ▼                    │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐           │
│  │ 6. Document  │    │ 5. Detection │    │ 4. Blue Team │           │
│  │ & Track      │ <- │ Engineering  │ <- │ Investigates │           │
│  │ Results      │    │ (if needed)  │    │ & Responds   │           │
│  └──────────────┘    └──────────────┘    └──────────────┘           │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         WRAP-UP                                      │
│  Review findings -> Assign action items -> Feedback -> Next steps    │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Red Team: What to Provide for Each TTP

| Item | Example |
|------|---------|
| Attacker IP | 192.168.1.100 |
| Target System | WORKSTATION-01 |
| Target Account | jsmith@corp.local |
| Exact Time | 2026-04-15 14:32:15 UTC |
| Command/Action | `mimikatz.exe sekurlsa::logonpasswords` |
| Expected Artifacts | LSASS memory access, Event ID 4656, screenshot of output |

**Always share screen** during execution

---

## Blue Team: What to Report for Each TTP

| Metric | Description |
|--------|-------------|
| **Detected?** | Yes / No / Partial |
| **Detection Method** | Alert / Telemetry / Hunt / Forensics |
| **Time to Detect (TTD)** | Time from execution to first detection |
| **Time to Investigate (TTI)** | Time to understand scope |
| **Time to Remediate (TTR)** | Time to contain/eradicate |
| **Detection Sources Used** | Which logs/tools provided visibility |
| **Gaps Identified** | What was missing — classify using [Gap Categorization](../PTEFv4.md#gap-categorization) |

**Always share screen** during hunt operations

---

## Communications Checklist

### Before Each TTP
- [ ] CTI context presented
- [ ] Expected controls discussed
- [ ] All participants ready
- [ ] Screen sharing enabled

### During Execution
- [ ] Red Team announces start time
- [ ] Blue Team actively investigating
- [ ] Exercise Coordinator timing responses
- [ ] Notes being captured

### After Each TTP
- [ ] Results documented
- [ ] Gaps identified
- [ ] Detection engineering opportunity noted
- [ ] Action items assigned

---

## Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| TTP not working | Verify allowlists, test on non-exercise system first |
| No visibility | Check security tools reporting to production dashboards |
| Time pressure | Skip detailed detection engineering; note for follow-up |
| Attendee unavailable | Continue with available team; document for their review |

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
