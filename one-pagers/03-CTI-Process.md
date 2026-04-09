# CTI Process for Purple Team Exercises

<p align="center"> <img src="./images/CTI.png" /> </p>

---

## 1. Understand the Target Organization

**Goal:** Form a detailed picture from the attacker's perspective

| Key Questions |
|---------------|
| What industry/sector? |
| What are the crown jewels? |
| What is the attack surface? |
| What technologies are in use? |
| What are the weak points? |
| What cloud environments and identity providers are in use? |
| Are AI/ML systems deployed in production? |

**Output:** Attack surface identification (people, process, technology)

---

## 2. Identify the Adversary to Emulate

**Goal:** Select adversary based on threat model

| Factor | Definition |
|--------|------------|
| **Intent** | What does the adversary want? (data theft, ransomware, espionage) |
| **Opportunity** | Does adversary have timing/knowledge to attack? |
| **Capability** | Can adversary achieve their goals? (skills, resources, tools) |

**Tip:** Start with lower sophistication actors; increase as maturity grows

---

## 3. Gather Cyber Threat Intelligence

**Goal:** Collect actionable intelligence from multiple sources

| Source Types |
|--------------|
| Open source intelligence (OSINT) |
| Vendor threat feeds |
| ISACs (Information Sharing and Analysis Centers) |
| Internal incident data |
| MITRE ATT&CK Groups/Software |

**Focus on:** TTPs (top of Pyramid of Pain), not just IOCs. 
<p align="center"> <img src="./images/pyramidofpain.jpg" /> </p>

---

## 4. Extract TTPs at Procedure Level

**Goal:** Map intelligence to actionable procedures

```
Tactic (WHY) -> Technique (WHAT) -> Procedure (HOW)
   High-level      Method used        Exact steps
   goal            to achieve it      taken
```

| Level | Example |
|-------|---------|
| Tactic | Credential Access |
| Technique | T1003 - OS Credential Dumping |
| Procedure | "Used Mimikatz with sekurlsa::logonpasswords" |

**Procedures are ideal** - they provide exact steps for emulation

---

## 5. Analyze and Organize

**Goal:** Create adversary profile showing what will be emulated

| Tactic | Technique | Procedure | CTI Reference |
|--------|-----------|-----------|---------------|
| Initial Access | T1566.001 Spear Phishing | Macro-enabled doc via email | [Report URL] |
| Execution | T1059.001 PowerShell | Encoded command execution | [Report URL] |
| ... | ... | ... | ... |

**Tools:** MITRE ATT&CK Navigator, spreadsheets, PlexTrac, VECTR

---

## 6. Aid In The Creation Of An Adversary Emulation Plan

**Goal:** Document everything Red Team needs for execution

| Section | Contents |
|---------|----------|
| Executive Summary | Adversary overview, objectives |
| CTI Profile | Attribution, targets, capabilities |
| Attack Steps | Procedure-level commands and tools |
| Manual Emulation | Step-by-step execution guide |
| Detection Opportunities | How to detect each TTP |
| References | CTI source URLs |

**Resources:** [SCYTHE KnowledgeBase](https://scythe.io/knowledge-base), [MITRE CTID Adversary Emulation Library](https://github.com/center-for-threat-informed-defense/adversary_emulation_library)

---

*Purple Team Exercise Framework v4 — github.com/scythe-io/purple-team-exercise-framework*
