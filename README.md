# Stella IP Kit

`stella_ip_kit` is a complete personal-IP directing system for founders, business owners, and operator-led brands.

It packages the full Stella workflow into one installable skill kit so a user can install everything in one step and start with `/stella`.

## Cross-Agent Compatibility

The core of this kit is portable:

- each skill lives in a plain `skill.md`
- memory files are plain markdown
- the workflow logic does not depend on one vendor

The `agents/openai.yaml` files are optional metadata files. They are only there for agents or runtimes that read OpenAI/Codex-style display metadata such as skill display names and short descriptions.

For Claude Code, OpenCode, OpenClaw, or any other agent:

- if the agent ignores `agents/openai.yaml`, nothing breaks
- if the agent does not support that file, you can skip installing it
- the important files are still the `skill.md` files and the memory markdown files

So no, `openai.yaml` should not harm other agents. At worst it is ignored. For stricter environments, use the installer switches to skip it.

## What It Solves

This kit is for users who do not just want a few content ideas. It gives them a business-first workflow from strategy to execution:

- business direction
- account positioning
- long-range content planning
- single-episode planning
- talking-head scripts and shot lists
- titles, covers, captions, and AI-tone cleanup
- post-publish review and iteration

## Install

### One-line local install

On Windows PowerShell:

```powershell
.\stella_ip_kit\install.ps1
```

To install into a specific project:

```powershell
.\stella_ip_kit\install.ps1 D:\path\to\your\project
```

On macOS or Linux:

```bash
./stella_ip_kit/install.sh
```

To install into a specific project:

```bash
./stella_ip_kit/install.sh /path/to/your/project
```

### Portable install for non-Claude agents

If another agent uses a different skill directory or a different instruction file, install with custom paths.

Windows PowerShell example:

```powershell
.\stella_ip_kit\install.ps1 `
  -Target D:\path\to\project `
  -SkillsRoot ".agents/skills" `
  -MemoryRoot "memory/stella-ip-director" `
  -InstructionsFile "AGENTS.md" `
  -SkipOpenAIMetadata `
  -SkipInstructionsBlock
```

macOS or Linux example:

```bash
SKILLS_ROOT=".agents/skills" \
MEMORY_ROOT="memory/stella-ip-director" \
INSTRUCTIONS_FILE="AGENTS.md" \
INCLUDE_OPENAI_METADATA=0 \
INCLUDE_INSTRUCTIONS_BLOCK=0 \
./stella_ip_kit/install.sh /path/to/project
```

### One-line remote install

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit/install.ps1 | iex
```

macOS or Linux:

After publishing this folder to GitHub, users can install the full kit with:

```bash
curl -fsSL https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit/install.sh | bash
```

Or install into a specific project:

```bash
curl -fsSL https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit/install.sh | bash -s /path/to/your/project
```

## What The Installer Does

It installs:

- 8 Stella skills into `.claude/skills/`
- the required helper files inside each skill directory
- 4 Stella memory templates into `memory/stella-ip-director/`
- a Stella block into `CLAUDE.md`

It is safe to re-run:

- existing files are skipped by default
- memory files are only created if they do not already exist
- the Stella block is only appended to `CLAUDE.md` once

After install, the user can immediately run:

```text
/stella
```

## Quick Start

### 1. First Use

Type:

```text
/stella
```

Stella will:

- introduce the system
- explain which skills exist
- route the user into the first setup step
- start with business direction and account positioning

That first setup writes:

```text
memory/stella-ip-director/ip-profile.md
```

This becomes the base memory for the whole system.

### 2. Core Workflow

The normal Stella flow is:

1. `/stella`
2. `/stella-ip-direction`
3. `/stella-ip-planning`
4. `/stella-ip-episode`
5. `/stella-ip-script`
6. `/stella-ip-package`
7. `/stella-ip-review`

### 3. Typical Usage

Start from the router:

```text
/stella
/stella I'm starting from scratch
/stella Help me figure out what to film next
/stella I already have a topic, help me turn it into a shootable script
```

Or call a specific skill directly:

```text
/stella-ip-direction
/stella-ip-planning
/stella-ip-episode
/stella-ip-script
/stella-ip-package
/stella-ip-review
```

## Skills Overview

### `/stella`

The entry point and onboarding router.

Use when:

- the user is new
- the user wants to know how the system works
- the user is not sure which skill to use

Solves:

- where do I start
- what can this system do
- what should I use next

### `/stella-ip-direction`

Business direction and account positioning.

Use when:

- the user is setting up a personal-IP system for the first time
- the business has changed
- the positioning needs to be redone

Solves:

- what the business is
- what the product is
- who the customer is
- what the personal IP should do for the business
- how the account should be positioned

### `/stella-ip-planning`

Long-range content planning.

Use when:

- the direction is already clear
- the user needs a monthly content map
- the user needs the next 10 episodes
- the user needs a weekly production plan

Solves:

- what to film over time
- what content pillars to use
- what topics to prioritize

### `/stella-ip-episode`

Single-episode planning.

Use when:

- the user needs to decide what this episode should do
- the user has multiple topic options
- the user wants to define one strong angle before scripting

Solves:

- what this episode is about
- who it is for
- what the main goal is
- what format it should use

### `/stella-ip-script`

Filming-ready script and shot plan.

Use when:

- the topic is decided
- the user needs a talking-head script
- the user needs a hybrid talking-head plus B-roll plan
- the user needs a shot list or directing package

Solves:

- spoken script
- hook
- A-roll and B-roll design
- shot list
- filming notes

### `/stella-ip-package`

Release packaging and AI-tone cleanup.

Use when:

- the content already exists in draft form
- the user needs titles
- the user needs cover text
- the user needs captions
- the user wants to reduce AI-tone signals

Solves:

- final hook refinement
- release-layer packaging
- title candidates
- caption polish
- AI-tone cleanup

### `/stella-ip-review`

Post-publish review and iteration.

Use when:

- the user has published content
- the user wants to know what worked
- the user wants to improve the next batch

Solves:

- what to repeat
- what to stop
- what to change next

### `/stella-ip-director`

One-step system controller.

Use when:

- the user does not want to choose the right step manually
- the user wants Stella to guide the full workflow

Solves:

- end-to-end workflow coordination

## Memory System

Stella stores context in:

```text
memory/stella-ip-director/
```

Files:

- `ip-profile.md`
- `topic-backlog.md`
- `production-board.md`
- `publishing-log.md`

This lets the system reuse the first strategy setup instead of repeating the same onboarding every time.

## Compatibility Notes

- `skill.md` is the real source of truth.
- `agents/openai.yaml` is optional UI metadata.
- `references/memory-template.md` is required by `stella-ip-director`.
- the default installer targets Claude-style locations for convenience, but both installers now support custom paths.
- whether `/stella` works as a slash command depends on the host agent's own skill-loading rules. If the host does not expose slash commands automatically, the kit still works as a skill bundle, but the invocation method may differ in that environment.

## File Structure

```text
stella_ip_kit/
|-- README.md
|-- install.ps1
|-- install.sh
|-- skills/
|   |-- stella/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-direction/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-director/
|   |   |-- skill.md
|   |   |-- agents/openai.yaml
|   |   `-- references/memory-template.md
|   |-- stella-ip-planning/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-episode/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-script/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   |-- stella-ip-package/
|   |   |-- skill.md
|   |   `-- agents/openai.yaml
|   `-- stella-ip-review/
|       |-- skill.md
|       `-- agents/openai.yaml
`-- memory/
    `-- stella-ip-director/
        |-- ip-profile.md
        |-- topic-backlog.md
        |-- production-board.md
        `-- publishing-log.md
```

## Recommended First Prompt

After install, the recommended first command is:

```text
/stella
```

If the user wants to be explicit:

```text
/stella I'm starting a personal IP system from scratch for my business
```
