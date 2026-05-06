# Antigravity Lazyweb Skill

**Design with evidence, not vibes.**

This project is an optimized port of the original [lazyweb-skill](https://github.com/aboul3ata/lazyweb-skill) specifically for **Antigravity**. It enables Antigravity to perform deep design research, gather visual inspiration, and provide design critiques using the Lazyweb screenshot database.

## 🚀 Key Features for Antigravity

- **Native Browser Integration**: Uses Antigravity's `browser_subagent` for high-fidelity live web captures.
- **Interactive Artifacts**: Generates research reports as premium Antigravity Artifacts for a beautiful preview experience.
- **Agentic Workflow**: Optimized `SKILL.md` instructions that leverage Antigravity's advanced reasoning and toolset.

## 🛠 Available Skills

### 🔍 Core Design Tools
- **`/lazyweb-design-research`**: **Deep Design Research**. 
  Identifies competitors, searches both Lazyweb and the live web, downloads reference screenshots, and produces a structured report including TL;DR, Examples, Findings, Patterns, Anti-Patterns, Unique Angles, and actionable Recommendations. Use for comprehensive competitive analysis and best practices research.
- **`/lazyweb-quick-references`**: **Visual Inspiration**. 
  Finds screenshots fast by searching Lazyweb and grouping results by design pattern. Lighter and faster than design-research—best used when you just need visual references without a full analysis.
- **`/lazyweb-design-improve`**: **Design Critique & Improvement**. 
  Captures a screenshot of your current design, finds similar high-quality screens from top apps, and generates 1-5 concrete improvement ideas, each backed by a real visual reference.
- **`/lazyweb-design-brainstorm`**: **Cross-pollination Brainstorm**. 
  Deliberately searches *outside* your industry category to find novel patterns. It helps you "zig when everyone zags" by bringing in ideas from gaming, entertainment, or social apps into your product's context.

### ⚙️ Utility Tools
- **`/lazyweb-add-inspo-source`**: **Connect External Libraries**. 
  Allows you to connect external inspiration libraries (like Mobbin, Savee, etc.) so that Lazyweb design skills can include them in the research process.
- **`/lazyweb-remove-inspo-source`**: **Disconnect Library**. 
  Disconnects an external inspiration library from your Lazyweb workspace.

## ⚙️ Setup & Installation

### 1. Get a Free Lazyweb Token
Run the following command in your terminal to generate and save a free Lazyweb MCP token:

```bash
mkdir -p ~/.lazyweb
curl -sS -X POST https://www.lazyweb.com/api/mcp/install-token \
  -H "content-type: application/json" \
  -d '{}' | node -e "let s='';process.stdin.on('data',d=>s+=d);process.stdin.on('end',()=>require('fs').writeFileSync(process.env.HOME+'/.lazyweb/lazyweb_mcp_token', JSON.parse(s).token))"
```

### 2. Install to Antigravity
You can install these skills globally to your Antigravity environment using the provided script:

```bash
./install.sh
```

This will copy the skills to `~/.gemini/antigravity/skills/` and update your global `mcp_config.json`.

### 3. Uninstall
To remove the skills and cleanup the MCP configuration:

```bash
./uninstall.sh
```

## 📖 Usage Examples

- `"/lazyweb-design-research research how modern AI apps handle onboarding"`
- `"/lazyweb-quick-references show me examples of dark mode dashboards"`
- `"/lazyweb-design-improve how can I make this checkout flow better?"`

---

### Credits
This project is based on the [lazyweb-skill](https://github.com/aboul3ata/lazyweb-skill) by aboul3ata. Ported and optimized for Antigravity by Antigravity.

## License
MIT
