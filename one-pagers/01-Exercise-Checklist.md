# Purple Team Exercise Checklist

## Pre-Exercise (Planning Phase)

### Sponsors & Coordination
- [ ] Sponsor approval obtained
- [ ] Budget approved
- [ ] Exercise Coordinator assigned
- [ ] Goals and objectives defined
- [ ] Attendees selected from each team

### Cyber Threat Intelligence
- [ ] Target organization understood
- [ ] Adversary identified for emulation
- [ ] CTI gathered and analyzed
- [ ] TTPs extracted at procedure level
- [ ] Adversary emulation plan created
- [ ] Table-top TTP review completed

### Technical Preparation
- [ ] Target systems provisioned
- [ ] Security tools verified on targets
- [ ] Target accounts created
- [ ] Attack infrastructure ready
- [ ] External/internal infra configured
- [ ] Payloads tested on non-exercise systems
- [ ] Allowlists verified with Blue Team
- [ ] Cloud accounts/subscriptions scoped and authorized
- [ ] Identity provider access confirmed in scope
- [ ] Cloud security tools verified and reporting

### Logistics
- [ ] Location secured (physical or virtual)
- [ ] Video conferencing tested
- [ ] Agenda distributed to all attendees
- [ ] Metrics defined and agreed upon
- [ ] Exercise case created in DFIR system

---

## Exercise Day

### Kick-Off
- [ ] Sponsor delivers opening remarks
- [ ] Introductions completed
- [ ] Exercise flow presented
- [ ] Communication channels confirmed

### For Each TTP
- [ ] CTI presents adversary context
- [ ] Table-top: Expected controls discussed
- [ ] Red Team executes TTP (screen shared)
- [ ] Red Team provides: IP, target, exact time, IOCs
- [ ] Blue Team investigates and responds
- [ ] Metrics captured (TTD, TTI, TTR)
- [ ] Detection gaps identified
- [ ] Action items documented

### Coordination
- [ ] Exercise Coordinator taking notes
- [ ] Action items being tracked
- [ ] Breaks provided as scheduled
- [ ] Daily summary emails sent (multi-day)

---

## Post-Exercise (Lessons Learned)

### Immediate (Same Day)
- [ ] Feedback forms distributed
- [ ] Initial findings discussed
- [ ] Quick wins identified

### Within 2 Weeks
- [ ] Lessons learned document compiled
- [ ] Report delivered to sponsors
- [ ] Action items assigned to owners
- [ ] Remediation timelines established

### Follow-Up
- [ ] Detection engineering completed (see [Detection Lifecycle Checklist](./08-Detection-Lifecycle-Checklist.md))
- [ ] TTPs retested after fixes (see [Hunt-to-Detection Pipeline](./09-Hunt-to-Detection-Pipeline-Checklist.md))
- [ ] Results added to tracking system
- [ ] Maturity model updated (see [PTMM Poster](./06-PTMM-Poster.md))
- [ ] Next exercise planned

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
