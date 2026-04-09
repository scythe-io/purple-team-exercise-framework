# Pre-Exercise Blue Team Preparation Checklist

Complete all items as applicable before the Purple Team Exercise begins. Assign an owner and target completion date for each section.

---

## 1. Detection Coverage Baseline

- [ ] Run [DeTT&CT](https://github.com/rabobank-cdc/DeTTECT) scoring against ATT&CK techniques and data sources for all in-scope platforms
- [ ] Export a pre-exercise [ATT&CK Navigator](https://mitre-attack.github.io/attack-navigator/enterprise/) layer showing current detection posture
- [ ] Classify each in-scope technique into one of the following categories:
  - [ ] No visibility (telemetry not collected)
  - [ ] Telemetry available (logs collected, no detection rule)
  - [ ] Detection rule deployed (automated alert in place)
  - [ ] Detection validated (rule confirmed to fire correctly on known-good test data)
- [ ] Archive the baseline Navigator layer (JSON export) in the team's version-controlled repository
- [ ] Share the baseline layer with the Exercise Coordinator and Red Team lead

**Owner:** __________________ **Target Date:** __________________

---

## 2. Data Source and Log Ingestion Validation

### Endpoint Telemetry
- [ ] Confirm EDR agents are active and reporting on all target endpoints
- [ ] Verify OS audit log policies are configured (Windows Security Event Log, Linux auditd, macOS Unified Logging)
- [ ] Verify PowerShell script block logging and module logging are enabled (Windows targets)
- [ ] Confirm endpoint logs are forwarding to the SIEM without gaps

### Network Telemetry
- [ ] Verify DNS query logging is active and forwarding to the SIEM
- [ ] Confirm proxy/web gateway logs are being collected
- [ ] Verify NetFlow or PCAP collection is active for in-scope network segments
- [ ] Confirm TLS decryption/inspection is enabled for exercise traffic paths
- [ ] Verify firewall logs are forwarding for in-scope zones

### Identity and Authentication Logs
- [ ] Confirm Active Directory/domain controller logs are forwarding (Event IDs 4624, 4625, 4648, 4672, 4688, 4720, 4732, etc.)
- [ ] Verify Identity Provider (IdP) audit logs are flowing (Azure AD/Entra ID, Okta, Ping, etc.)
- [ ] Confirm cloud IAM logs are active (AWS IAM, Azure RBAC, GCP IAM)
- [ ] Verify Privileged Access Management (PAM) logs are forwarding

### Cloud Control Plane Logs (If in scope)
- [ ] Confirm AWS CloudTrail is enabled and forwarding for in-scope accounts
- [ ] Confirm Azure Activity Logs and Azure Monitor are active for in-scope subscriptions
- [ ] Confirm GCP Audit Logs are enabled for in-scope projects
- [ ] Verify cloud log ingestion latency is within acceptable thresholds (under 5 minutes)

### Ingestion Health
- [ ] Check for ingestion latency across all data sources (target: under 5 minutes for critical sources)
- [ ] Check for parsing errors or field extraction failures in the SIEM
- [ ] Check for dropped events or rate-limited sources
- [ ] Cross-reference the [ATT&CK data sources](https://attack.mitre.org/datasources/) required for the selected TTPs against the validated data sources above
- [ ] Document any data source gaps and communicate them to the Exercise Coordinator

**Owner:** __________________ **Target Date:** __________________

---

## 3. Review Existing Detection Rules Against Exercise TTPs

- [ ] Obtain the TTP list or adversary emulation plan from the Exercise Coordinator / CTI team
- [ ] For each TTP, determine whether a detection rule currently exists
- [ ] For each existing rule, record:
  - [ ] Platform the rule runs on (SIEM, EDR, NDR, cloud-native)
  - [ ] Last validation date (when was the rule last confirmed to fire on a true positive or test case?)
  - [ ] Current status (enabled, disabled, suppressed)
  - [ ] Known false positive history or tuning exceptions applied
- [ ] Flag TTPs with no detection coverage
- [ ] Flag TTPs with detection rules that have not been validated in the past 90 days
- [ ] Compile findings into a pre-exercise detection readiness summary and share with the Exercise Coordinator

**Owner:** __________________ **Target Date:** __________________

---

## 4. Prepare Hunt Queries and Playbooks

- [ ] For each TTP without automated detection, draft an ad-hoc hunt query targeting available telemetry
- [ ] Validate that each hunt query runs successfully against the SIEM or hunting platform (no syntax errors, returns results within acceptable time)
- [ ] Reference [ThreatHunter-Playbook](https://github.com/hunters-forge/ThreatHunter-Playbook) or equivalent resources for query templates where applicable
- [ ] Document the data sources, log fields, and behavioral indicators each query relies on
- [ ] Pre-stage hunt queries in the team's hunting platform or shared query library so they are ready to execute on exercise day
- [ ] Assign a hunt team member to each TTP requiring manual hunting

**Owner:** __________________ **Target Date:** __________________

---

## 5. Forensic Readiness

- [ ] Verify memory acquisition tools are deployed and functional on all target systems
- [ ] Verify disk imaging capabilities are available for target systems (physical and virtual)
- [ ] Confirm live forensic utilities are installed on target endpoints (per the Blue Team Preparation items in [Exercise Checklist](./01-Exercise-Checklist.md))
- [ ] Verify the DFIR case created during planning is accessible to all DFIR analysts
- [ ] Confirm all analysts know the case number and evidence tagging conventions
- [ ] Validate that chain-of-custody forms are available and the documentation procedure is understood
- [ ] Confirm evidence storage locations have sufficient capacity for exercise artifacts
- [ ] Verify target systems will not be segmented, reimaged, or wiped during the exercise window

**Owner:** __________________ **Target Date:** __________________

---

## 6. Communication and Escalation Dry Run

- [ ] Verify all exercise communication channels are operational (Slack, Teams, video bridge, etc.)
- [ ] Confirm all Blue Team participants (SOC, Hunt, DFIR) can access the designated exercise channels
- [ ] Review the escalation path:
  - [ ] Who is notified when a TTP is detected?
  - [ ] How are findings documented in real-time (exercise tracker, shared doc, ticketing system)?
  - [ ] What is the expected response if a real (non-exercise) incident occurs during the exercise?
- [ ] For remote/hybrid exercises: verify screen sharing, breakout rooms, and audio quality with all remote participants
- [ ] Confirm the exercise deconfliction process with the SOC so that exercise activity is not treated as a production incident

**Owner:** __________________ **Target Date:** __________________

---

## Sign-Off

| Role | Name | Date Completed | Signature |
|------|------|----------------|-----------|
| Blue Team Lead | | | |
| SOC Manager | | | |
| Hunt Team Lead | | | |
| DFIR Lead | | | |
| Exercise Coordinator | | | |

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
