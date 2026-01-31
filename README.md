# 🌩️ Antigravity Cloudflare Skills

> **The ultimate Cloudflare development skill for Antigravity Agents.**  
> Effortlessly deploy Workers, Pages, D1, R2, and AI apps with your AI assistant.

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Antigravity](https://img.shields.io/badge/Agent-Antigravity-blueviolet.svg)](https://github.com/hoangyell/antigravity-cloudflare-skills)

---

## 🚀 Installation

Choose the method that fits your workflow:

### ⚡ Option 1: The "Magic" Command (Fastest)

Install instantly with one line. **Safe by default**: running this will *not* overwrite your existing customizations.

**Linux / macOS:**
```bash
curl -fsSL https://raw.githubusercontent.com/hoangyell/antigravity-cloudflare-skills/main/install.sh | sh
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/hoangyell/antigravity-cloudflare-skills/main/install.ps1 | iex
```

### 🔒 Option 2: The "Trusted" Manual Method

For users who prefer full control and verification:

1.  **Clone this repository**:
    ```bash
    git clone https://github.com/hoangyell/antigravity-cloudflare-skills.git
    cd antigravity-cloudflare-skills
    ```
2.  **Verify the content** in `skills/cloudflare`.
3.  **Install to your Agent**:
    ```bash
    mkdir -p ~/.gemini/antigravity/skills/cloudflare
    cp -rn skills/cloudflare/* ~/.gemini/antigravity/skills/cloudflare/
    ```
    *(Note: The `-n` flag prevents overwriting existing files, keeping your customizations safe.)*

---

## 🧠 How it Works

Think of this skill as a **Brain Extension** for your Antigravity Agent.

1.  **The Brain (`SKILL.md`)**: Contains the high-level logic, identity, and "knowledge map" of Cloudflare.
2.  **The Library (`references/`)**: A massive knowledge base covering every Cloudflare product, API, and best practice.

When you install this, your Agent gains the ability to "see" these files and use them as its own expertise.

## 💬 How to Use

You don't need to do anything special! Once installed, there are two ways to interact:

### 🤖 1. Automatic (The "Magic" Way)
Just talk to your Agent like you normally would. 
- *"Help me deploy a Worker that connects to D1."*
- *"Why is my R2 upload failing?"*

The Agent will **automatically** detect that you're talking about Cloudflare and "pull" the relevant knowledge from this skill.

### 🎯 2. Active (The "Pro" Way)
If you want to ensure the Agent is in "Full Cloudflare Mode", you can be explicit:
- *"Use the Cloudflare skill to audit my wrangler.toml."*
- *"Act as a Cloudflare Architect and design a global edge caching strategy."*

---

## 📂 Structure

```text
antigravity-cloudflare-skills/
├── 📂 skills/
│   └── 📂 cloudflare/      # 🧠 The Brain
│       ├── 📄 SKILL.md     # Main instructions
│       └── 📂 references/  # 📚 Knowledge base
├── 📜 install.sh           # ⚡ Linux/Mac installer
├── 📜 uninstall.sh         # 🧹 Cleanup script
├── 📜 LICENSE              # ⚖️ MIT License
└── 📝 README.md            # 📖 This file
```

---

## 🛠️ Capabilities

Your agent is equipped with deep knowledge of the entire Cloudflare stack:

### ⚡ Compute & Runtime
*   **[Workers](https://workers.cloudflare.com/)**: Serverless functions at the edge.
*   **[Pages](https://pages.cloudflare.com/)**: Full-stack web applications with Git integration.
*   **[Durable Objects](https://developers.cloudflare.com/durable-objects/)**: Stateful coordination and real-time storage.
*   **[Workflows](https://developers.cloudflare.com/workflows/)**: Durable, asynchronous multi-step job execution.
*   **[Workers for Platforms](https://developers.cloudflare.com/workers-for-platforms/)**: Deploy user-generated code securely.

### 🗄️ Storage & Data
*   **[D1](https://developers.cloudflare.com/d1/)**: Serverless SQL database (SQLite).
*   **[R2](https://developers.cloudflare.com/r2/)**: S3-compatible object storage (no egress fees).
*   **[KV](https://developers.cloudflare.com/kv/)**: Low-latency global key-value store.
*   **[Queues](https://developers.cloudflare.com/queues/)**: Asynchronous message queuing.
*   **[Vectorize](https://developers.cloudflare.com/vectorize/)**: Vector database for AI embeddings.

### 🤖 AI & Machine Learning
*   **[Workers AI](https://developers.cloudflare.com/workers-ai/)**: Run serverless inference (LLMs, Whisper, Stable Diffusion).
*   **[AI Gateway](https://developers.cloudflare.com/ai-gateway/)**: Manage, cache, and observe AI API requests.
*   **[Agents SDK](https://developers.cloudflare.com/agents/)**: Build stateful, autonomous AI agents.

### 🌐 Networking & Security
*   **[Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)**: Expose local services securely.
*   **[Spectrum](https://developers.cloudflare.com/spectrum/)**: DDoS protection for TCP/UDP apps.
*   **[WAF & DDoS](https://www.cloudflare.com/waf/)**: Enterprise-grade application protection.

### 🏗️ DevOps & IaC
*   **[Wrangler](https://developers.cloudflare.com/workers/wrangler/)**: The detailed CLI for Cloudflare Workers.
*   **[Terraform](https://developers.cloudflare.com/terraform/)** & **[Pulumi](https://www.pulumi.com/registry/packages/cloudflare/)**: Infrastructure as Code support.
*   **[Observability](https://developers.cloudflare.com/workers/observability/)**: Logs, metrics, and analytics.

---

### 🧠 Intelligent Workflows

The agent doesn't just write code; it helps you architect solutions:

*   **Decision Trees**: "Should I use KV or D1?" — The agent has built-in logic to guide these choices.
*   **Best Practices**: Boilerplate generated follows the latest Cloudflare standards.
*   **Zero-Config**: No need to manually copy generic docs; the context is built-in.

---

## 🤝 Contributing

PRs are welcome! Help us make the smartest Cloudflare developer agent.

---

## 🙌 Acknowledgements

This project is a derivative work based on the **[Official Cloudflare Skills](https://github.com/cloudflare/skills)** repository.

### ⚖️ License and Attribution
- **Original Work**: Copyright (c) 2024 Cloudflare, Inc.
- **Modifications**: Copyright (c) 2026 HoangYell.
- **License**: This entire repository, including all modifications, is licensed under the [Apache License, Version 2.0](LICENSE).

> 💡 **Why this repo exists?**
> The official skills repository is an incredible resource, but it does not yet support **Antigravity** agents out of the box. I created this repository to bridge that gap, organizing the official knowledge base into a format that Antigravity can understand and use effectively.
