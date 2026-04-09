# AI Tool Discovery (T1083)

| | |
|---|---|
| **ATT&CK Technique** | [T1083 - File and Directory Discovery](https://attack.mitre.org/techniques/T1083/) |
| **ATLAS Techniques** | [AML.T0007](https://atlas.mitre.org/techniques/AML.T0007), [AML.T0013](https://atlas.mitre.org/techniques/AML.T0013), [AML.T0069](https://atlas.mitre.org/techniques/AML.T0069) |
| **Platforms** | Windows, macOS, Linux |
| **Permissions Required** | Standard user (Windows: elevated PowerShell recommended) |
| **Dependencies** | None — all native OS utilities |
| **Author** | Deeveloped by the SCYTHE Labs Team |

## Background

This test takes advantage of the new attack surface the introduction of AI/LLMs into our workforce has created. AI applications and frameworks store configuration files, conversation databases, authentication tokens, and model data in predictable filesystem locations that an adversary who has gained access can enumerate. This behavior focuses on identifying which AI tools are installed and determining what artifacts are available for follow-on actions like credential theft, data exfiltration, or configuration tampering. This test maps to MITRE ATLAS T0007 & T0069 (System information and artifact discovery) and ATT&CK T1083 (File and Directory Discovery) as it performs a comprehensive sweep of known AI tool artifact directories on the target operating system.

---

## Prerequisites

- **Windows:** Elevated PowerShell prompt (Run as Administrator)
- **macOS / Linux:** Terminal with standard user privileges (sudo not required)
- **No external tools required** — all commands use native OS utilities

---

## Targeted Platforms
- Windows
- macOS
- Linux (Ubuntu)

## Targeted AI Tools
- Claude Desktop
- Claude Code CLI
- ChatGPT Desktop
- GitHub Copilot (VS Code Extension and CLI)
- Microsoft Copilot (Windows only - Edge, MSAL, OneAuth)
- Gemini (Chrome Extension)
- Ollama
- LM Studio
- Jan.ai
- GPT4All

---

## Test Overview

### Discovery - AI Tool Directory Enumeration

Each AI tool's known artifact directory is checked for existence. If found, its contents are listed to identify available databases, configuration files, tokens, and model data. The test checks the following locations per OS:

**Windows (PowerShell):**
```powershell
# Claude Desktop
if (Test-Path "$env:APPDATA\Claude") { Get-ChildItem "$env:APPDATA\Claude" | Format-Table; Write-Output 'FOUND: Claude Desktop (APPDATA)' } else { Write-Output 'NOT FOUND: Claude Desktop (APPDATA)' }; if (Test-Path "$env:LOCALAPPDATA\Claude") { Get-ChildItem "$env:LOCALAPPDATA\Claude" | Format-Table; Write-Output 'FOUND: Claude Desktop (LOCALAPPDATA)' } else { Write-Output 'NOT FOUND: Claude Desktop (LOCALAPPDATA)' }

# Claude Code CLI
if (Test-Path "$env:USERPROFILE\.claude") { Get-ChildItem "$env:USERPROFILE\.claude" | Format-Table; Write-Output 'FOUND: Claude Code CLI' } else { Write-Output 'NOT FOUND: Claude Code CLI' }

# ChatGPT Desktop
if (Test-Path "$env:APPDATA\ChatGPT") { Get-ChildItem "$env:APPDATA\ChatGPT" | Format-Table; Write-Output 'FOUND: ChatGPT Desktop (APPDATA)' } else { Write-Output 'NOT FOUND: ChatGPT Desktop (APPDATA)' }; if (Test-Path "$env:LOCALAPPDATA\Programs\ChatGPT") { Write-Output 'FOUND: ChatGPT Desktop (Programs)' } else { Write-Output 'NOT FOUND: ChatGPT Desktop (Programs)' }

# GitHub Copilot (VS Code Extension)
if (Test-Path "$env:APPDATA\Code\User\globalStorage\github.copilot") { Get-ChildItem "$env:APPDATA\Code\User\globalStorage\github.copilot" | Format-Table; Write-Output 'FOUND: GitHub Copilot VSCode' } else { Write-Output 'NOT FOUND: GitHub Copilot VSCode' }

# GitHub Copilot CLI
if (Test-Path "$env:APPDATA\GitHub Copilot") { Get-ChildItem "$env:APPDATA\GitHub Copilot" | Format-Table; Write-Output 'FOUND: Copilot CLI' } else { Write-Output 'NOT FOUND: Copilot CLI' }

# Microsoft Copilot (MSAL, OneAuth, Edge)
if (Test-Path "$env:LOCALAPPDATA\Microsoft\TokenCache") { Write-Output 'FOUND: MSAL Token Cache' } else { Write-Output 'NOT FOUND: MSAL Token Cache' }; if (Test-Path "$env:LOCALAPPDATA\Microsoft\OneAuth") { Write-Output 'FOUND: OneAuth Cache' } else { Write-Output 'NOT FOUND: OneAuth Cache' }; if (Test-Path "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default") { Write-Output 'FOUND: Edge User Data' } else { Write-Output 'NOT FOUND: Edge User Data' }

# Chrome Extensions (Gemini)
if (Test-Path "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions") { Write-Output 'FOUND: Chrome Extensions directory' } else { Write-Output 'NOT FOUND: Chrome Extensions' }

# Ollama
if (Test-Path "$env:USERPROFILE\.ollama") { Get-ChildItem "$env:USERPROFILE\.ollama" | Format-Table; Write-Output 'FOUND: Ollama' } else { Write-Output 'NOT FOUND: Ollama' }

# LM Studio
if (Test-Path "$env:USERPROFILE\.lmstudio") { Write-Output 'FOUND: LM Studio (dot dir)' } else { Write-Output 'NOT FOUND: LM Studio (dot dir)' }; if (Test-Path "$env:LOCALAPPDATA\LM Studio") { Write-Output 'FOUND: LM Studio (LOCALAPPDATA)' } else { Write-Output 'NOT FOUND: LM Studio (LOCALAPPDATA)' }

# Jan.ai
if (Test-Path "$env:USERPROFILE\jan") { Get-ChildItem "$env:USERPROFILE\jan" | Format-Table; Write-Output 'FOUND: Jan ai' } else { Write-Output 'NOT FOUND: Jan ai' }

# GPT4All
if (Test-Path "$env:LOCALAPPDATA\nomic.ai\GPT4All") { Get-ChildItem "$env:LOCALAPPDATA\nomic.ai\GPT4All" | Format-Table; Write-Output 'FOUND: GPT4All' } else { Write-Output 'NOT FOUND: GPT4All' }
```

**macOS (bash/zsh):**
```bash
# Claude Desktop
ls -la ~/Library/Application\ Support/Claude/ 2>/dev/null && echo 'FOUND: Claude Desktop' || echo 'NOT FOUND: Claude Desktop'

# Claude Code CLI
ls -la ~/.claude/ 2>/dev/null && echo 'FOUND: Claude Code CLI' || echo 'NOT FOUND: Claude Code CLI'

# ChatGPT Desktop
ls -la ~/Library/Application\ Support/ChatGPT/ 2>/dev/null && echo 'FOUND: ChatGPT Desktop' || echo 'NOT FOUND: ChatGPT Desktop'

# GitHub Copilot (VS Code Extension)
ls -la ~/Library/Application\ Support/Code/User/globalStorage/github.copilot/ 2>/dev/null && echo 'FOUND: GitHub Copilot VSCode' || echo 'NOT FOUND: GitHub Copilot VSCode'

# GitHub Copilot CLI
ls -la ~/.config/github-copilot/ 2>/dev/null && echo 'FOUND: Copilot CLI' || echo 'NOT FOUND: Copilot CLI'

# Chrome Extensions (Gemini)
ls -la ~/Library/Application\ Support/Google/Chrome/Default/Extensions/ 2>/dev/null && echo 'FOUND: Chrome Extensions directory' || echo 'NOT FOUND: Chrome Extensions'

# Ollama
ls -la ~/.ollama/ 2>/dev/null && echo 'FOUND: Ollama' || echo 'NOT FOUND: Ollama'

# LM Studio
ls -la ~/.lmstudio/ 2>/dev/null && ls -la ~/Library/Application\ Support/LM\ Studio/ 2>/dev/null && echo 'FOUND: LM Studio' || echo 'NOT FOUND: LM Studio'

# Jan.ai
ls -la ~/jan/ 2>/dev/null && echo 'FOUND: Jan ai' || echo 'NOT FOUND: Jan ai'

# GPT4All
ls -la ~/Library/Application\ Support/nomic.ai/GPT4All/ 2>/dev/null && echo 'FOUND: GPT4All' || echo 'NOT FOUND: GPT4All'
```

**Linux (bash):**
```bash
# Claude Desktop
ls -la ~/.config/Claude/ 2>/dev/null && echo FOUND: Claude Desktop || echo NOT FOUND: Claude Desktop

# Claude Code CLI
ls -la ~/.claude/ 2>/dev/null && echo FOUND: Claude Code CLI || echo NOT FOUND: Claude Code CLI

# ChatGPT Desktop
ls -la ~/.config/ChatGPT/ 2>/dev/null && echo FOUND: ChatGPT Desktop || echo NOT FOUND: ChatGPT Desktop

# GitHub Copilot (VS Code Extension)
ls -la ~/.config/Code/User/globalStorage/github.copilot/ 2>/dev/null && echo FOUND: GitHub Copilot VSCode || echo NOT FOUND: GitHub Copilot VSCode

# GitHub Copilot CLI
ls -la ~/.config/github-copilot/ 2>/dev/null && echo FOUND: Copilot CLI || echo NOT FOUND: Copilot CLI

# Chrome Extensions (Gemini)
ls -la ~/.config/google-chrome/Default/Extensions/ 2>/dev/null && echo FOUND: Chrome Extensions directory || echo NOT FOUND: Chrome Extensions

# Chrome Local Storage / IndexedDB
ls -la ~/.config/google-chrome/Default/Local\ Storage/leveldb/ 2>/dev/null && ls -la ~/.config/google-chrome/Default/IndexedDB/ 2>/dev/null && echo FOUND: Chrome Local Storage and IndexedDB || echo NOT FOUND: Chrome storage dirs

# Ollama
ls -la ~/.ollama/ 2>/dev/null && echo FOUND: Ollama || echo NOT FOUND: Ollama

# LM Studio
ls -la ~/.lmstudio/ 2>/dev/null && ls -la ~/.local/share/LM\ Studio/ 2>/dev/null && echo FOUND: LM Studio || echo NOT FOUND: LM Studio

# Jan.ai
ls -la ~/jan/ 2>/dev/null && echo FOUND: Jan ai || echo NOT FOUND: Jan ai

# GPT4All
ls -la ~/.local/share/nomic.ai/GPT4All/ 2>/dev/null && echo FOUND: GPT4All || echo NOT FOUND: GPT4All
```

### Discovery - Loose Model File Search

The test scans common download locations for model files (.gguf, .bin) that may exist outside of standard AI tool directories, indicating models that have been downloaded but not yet imported.

**Windows (PowerShell):**
```powershell
Get-ChildItem -Path "$env:USERPROFILE\Downloads","$env:USERPROFILE\Desktop" -Filter *.gguf -Recurse -ErrorAction SilentlyContinue | Select-Object FullName,Length | Format-Table; Write-Output 'Model file search complete'
```

**macOS / Linux (bash):**
```bash
find ~/Downloads ~/models ~/Desktop -name '*.gguf' -o -name '*.bin' 2>/dev/null | head -20
```

### Collection - Write Discovery Summary

To capture all output to a summary file, wrap the discovery commands in a script block or redirect output:

**Windows (PowerShell):**
```powershell
# Option 1: Run all discovery commands inside a script block and capture output
$results = & {
    # -- Paste all discovery commands from above here --
    # Each Write-Output / Get-ChildItem result will be captured
}
$results | Out-File "$env:TEMP\ai_discovery_results.txt" -Encoding UTF8
Write-Output "Results saved to $env:TEMP\ai_discovery_results.txt"

# Option 2: Save discovery commands to a .ps1 file and redirect
# .\ai_discovery_windows.ps1 | Tee-Object "$env:TEMP\ai_discovery_results.txt"
```

**macOS / Linux (bash):**
```bash
# Option 1: Run all discovery commands and tee to a file
{
    # -- Paste all discovery commands from above here --
} 2>&1 | tee /tmp/ai_discovery_results.txt

# Option 2: Save discovery commands to a .sh file and redirect
# bash ai_discovery_unix.sh 2>&1 | tee /tmp/ai_discovery_results.txt

echo "Results saved to /tmp/ai_discovery_results.txt"
```

### Cleanup

Remove any staging artifacts created during the test:

**macOS / Linux:**
```bash
rm -rf /tmp/ai_discovery
```

**Windows (CMD):**
```cmd
rmdir /s /q %TEMP%\ai_discovery
```

**Windows (PowerShell):**
```powershell
Remove-Item "$env:TEMP\ai_discovery" -Recurse -Force -ErrorAction SilentlyContinue
```

---

## OS-Specific Behavior

| Behavior | Windows | macOS | Linux |
|----------|---------|-------|-------|
| Shell | PowerShell | bash / zsh | bash |
| Claude Desktop path | %APPDATA%\Claude, %LOCALAPPDATA%\Claude | ~/Library/Application Support/Claude/ | ~/.config/Claude/ |
| ChatGPT path | %APPDATA%\ChatGPT | ~/Library/Application Support/ChatGPT/ | ~/.config/ChatGPT/ |
| Copilot extension path | %APPDATA%\Code\User\globalStorage\github.copilot | ~/Library/Application Support/Code/User/globalStorage/github.copilot/ | ~/.config/Code/User/globalStorage/github.copilot/ |
| Microsoft Copilot | MSAL TokenCache, OneAuth, Edge WebCache | N/A | N/A |
| Ollama path | %USERPROFILE%\.ollama | ~/.ollama/ | ~/.ollama/ |
| LM Studio path | %USERPROFILE%\.lmstudio, %LOCALAPPDATA%\LM Studio | ~/.lmstudio/, ~/Library/Application Support/LM Studio/ | ~/.lmstudio/, ~/.local/share/LM Studio/ |
| Jan.ai path | %USERPROFILE%\jan | ~/jan/ | ~/jan/ |
| GPT4All path | %LOCALAPPDATA%\nomic.ai\GPT4All | ~/Library/Application Support/nomic.ai/GPT4All/ | ~/.local/share/nomic.ai/GPT4All/ |
| Chrome extensions | %LOCALAPPDATA%\Google\Chrome\... | ~/Library/Application Support/Google/Chrome/... | ~/.config/google-chrome/... |
| Staging directory | %TEMP%\ai_discovery | /tmp/ai_discovery | /tmp/ai_discovery |
| Archive format | Compress-Archive (.zip) | tar czf (.tar.gz) | tar czf (.tar.gz) |

---

## Detections:

### Rapid Sequential Directory Enumeration

Detects a process performing ls or Get-ChildItem against multiple AI tool artifact directories in rapid succession, which is inconsistent with normal user behavior and indicates automated reconnaissance.

### Access to AI Configuration Directories by Non-AI Process

Detects a process other than the expected AI application (e.g., claude, ollama, code) accessing AI tool configuration directories. An adversary enumerating AI artifacts will typically do so from a shell or C2 agent rather than the native application.

### Recursive File Search for Model Files

Detects find or Get-ChildItem commands searching for .gguf or .bin files across user directories, indicating an attempt to locate AI model files outside standard installation paths.

---

## MITRE ATLAS Mapping

This test maps to the following [MITRE ATLAS](https://atlas.mitre.org/) techniques for AI/ML-specific threats:

| ATLAS ID | Technique | Relevance |
|----------|-----------|-----------|
| AML.T0007 | Discover AI Artifacts | The test enumerates AI tool installation directories, model files, and configuration artifacts - directly mapping to AI artifact discovery. |
| AML.T0013 | Discover AI Model Ontology | Scanning for .gguf and .bin model files reveals model architectures, quantization levels, and naming conventions that expose the ontology of deployed models. |
| AML.T0069 | Discover LLM System Information | Enumerating AI tool directories reveals LLM runtime configurations, API endpoints, token caches, and system-level integration details such as MCP server configs and local inference settings. |

---

## References:

MITRE ATT&CK - T1083: File and Directory Discovery
https://attack.mitre.org/techniques/T1083/

MITRE ATT&CK - TA0007: Discovery
https://attack.mitre.org/tactics/TA0007/

MITRE ATLAS - AML.T0007: Discover AI Artifacts
https://atlas.mitre.org/techniques/AML.T0007

MITRE ATLAS - AML.T0013: Discover AI Model Ontology
https://atlas.mitre.org/techniques/AML.T0013

MITRE ATLAS - AML.T0069: Discover LLM System Information
https://atlas.mitre.org/techniques/AML.T0069
