# Purple Team Exercise Framework Templates

This directory contains templates for planning, executing, tracking, and reporting on Purple Team Exercises. All templates follow the PTEFv4 methodology.

---

## Template Overview

| Template | Purpose | Format |
|----------|---------|--------|
| [Purple Team Exercise Template](./Purple%20Team%20Exercise%20Template.docx) | Comprehensive exercise planning document | .docx |
| [TTP Mapping Template](./Template_Mapping_TTPs.xlsx) | Map threat actor TTPs to ATT&CK | .xlsx |
| [Emulation Plan Template](./Emulation%20Plan%20Template.md) | Detailed attack emulation procedures | .md |
| [Exercise Tracking Template](./Exercise%20Tracking%20Template.md) | Real-time TTP execution and detection logging | .md |
| [After-Action Report Template](./After-Action%20Report%20Template.md) | Post-exercise findings and recommendations | .md |
| [Lessons Learned Template](./Lessons%20Learned%20Template.md) | Facilitated retrospective session guide | .md |

---

## Template Descriptions

### Purple Team Exercise Template (.docx)

The master planning document for organizing a Purple Team Exercise. Use this template for:
- Exercise scope definition
- Participant identification
- Timeline planning
- Resource allocation
- Stakeholder communication

### TTP Mapping Template (.xlsx)

Spreadsheet for mapping threat actor TTPs to MITRE ATT&CK. Includes:
- Technique mapping columns
- Data source identification
- Detection coverage tracking
- Priority scoring

### Emulation Plan Template (.md)

Detailed template for documenting attack emulation procedures. Contains:
- Threat actor profile and CTI summary
- TTP overview with ATT&CK mapping
- Manual and automated emulation instructions
- Expected artifacts and cleanup procedures
- Detection opportunities and data sources
- Validation checklists

### Exercise Tracking Template (.md)

Real-time tracking document for use during exercise execution. Features:
- TTP execution tracker (Red Team)
- Detection logging (Blue Team)
- Running metrics summary
- Action items capture
- Quick notes section
- End of day summaries

### After-Action Report Template (.md)

Comprehensive post-exercise report template. Includes:
- Executive summary with key statistics
- TTP results matrix
- Detection rate by tactic
- Detailed findings with severity ratings
- Gaps and weaknesses analysis
- Prioritized action items
- Metrics comparison (historical trending)
- Lessons learned summary

### Lessons Learned Template (.md)

Facilitation guide for conducting retrospective sessions. Contains:
- Pre-session preparation checklist
- Session agenda with timing
- Ground rules for blameless culture
- What went well / What could be improved sections
- Root cause analysis (5 Whys)
- Action item generation and prioritization
- Feedback collection by role
- Follow-up scheduling

---

## Recommended Workflow

```
1. Planning Phase
   └── Purple Team Exercise Template (.docx)
   └── TTP Mapping Template (.xlsx)

2. Pre-Exercise
   └── Emulation Plan Template (.md)

3. Exercise Execution
   └── Exercise Tracking Template (.md)

4. Post-Exercise
   └── After-Action Report Template (.md)
   └── Lessons Learned Template (.md)
```

---

## Usage Tips

1. **Make copies** - Always copy templates before filling them out
2. **Customize** - Add or remove sections based on your organization's needs
3. **Version control** - Keep completed templates with exercise date in filename
4. **Share appropriately** - Consider classification before distribution
5. **Archive** - Store completed templates for historical comparison

---

## Contributing

Have suggestions for improving these templates? See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines on submitting improvements.

---

*Template version: PTEFv4*
*Purple Team Exercise Framework - github.com/scythe-io/purple-team-exercise-framework*
