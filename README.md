# Project Wasl

[![Project Status: Conceptual](https://img.shields.io/badge/status-conceptual-blue.svg)](https://github.com/your-org/Wasl)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

> A new primitive for thought and work. Wasl is a systemic re-architecture of productivity software, designed to replace the archaic paradigms of files, documents, and spreadsheets with a living, intelligent, and interconnected workspace.

---

## The Tyranny of the Blank Page

For thirty years, our digital tools have been trapped by outdated metaphors. We work in **"documents"** and **"spreadsheets"**—digital paper that turns dynamic knowledge into dead data the moment it's saved. Our business logic is scattered across brittle cells (`=VLOOKUP(...)`), our critical decisions are buried in endless documents (`Q4_Strategy_v8_final_final.docx`), and our data is always stale.

This is not a feature problem. This is a **paradigm problem**. Iterating on the spreadsheet is like building a faster horse. **Wasl is the automobile.**

## The Wasl Philosophy: From Dead Data to a Living Model

Wasl is built on three foundational shifts that work together to create a 1000x better experience.

1.  **From Cells & Pages → To Semantic Blocks**
    We abolish the meaningless cell and the blank page. The new fundamental unit is the **Block**—a self-aware object that understands what it is. A `Metric` block knows it's a number, a `Decision` block knows it's a choice, and an `Assumption` block knows it's a variable in a model.

2.  **From Static Data → To a Live, Connected Graph**
    Blocks don't live in lists or tables; they live in the **Wasl Graph**. Relationships are not based on fragile cell locations (`C5`) but on a permanent, unbreakable semantic link (`@UUID_of_Revenue - @UUID_of_Expenses`). The result is not a document; it is a resilient, living model of your business logic.

3.  **From Manual Work → To AI as the Operating System**
    The primary interface is not a mouse and cursor, but a conversation. The **AI Weaver** is the intelligent kernel of Wasl. It interprets intent, assembles views on the fly, and synthesizes new knowledge, allowing you to operate your business at the speed of thought.

---

## Core Concepts

### 🧠 The Block: A Self-Aware Primitive

Every piece of information in Wasl is a Block with its own DNA.

```json
{
  "uuid": "b7a8c2d0-e1f3-4a5b-8c6d-9e0f1a2b3c4d",
  "blockType": "Metric",
  "schema": { "name": "string", "value": "number", "unit": "string" },
  "state": { "name": "Monthly Recurring Revenue", "value": 52300, "unit": "USD" },
  "lineage": [ { "timestamp": "...", "user": "...", "change": "..." } ],
  "acl": { "view": ["all"], "edit": ["group:finance"] }
}```

### 🕸️ The Wasl Graph: A Resilient Network of Knowledge

Blocks are connected via their UUIDs, creating a robust, queryable graph. A `Profit` block isn't a formula in a cell; it's a node in the graph.

```json
{
  "uuid": "f1d2c3b4-a5e6-4f7b-8c9d-0e1f2a3b4c5d",
  "blockType": "Metric",
  "state": {
    "name": "Gross Profit",
    "value": {
      "function": "SUBTRACT",
      "inputs": [
        "b7a8c2d0-e1f3-4a5b-8c6d-9e0f1a2b3c4d", // UUID of Revenue Block
        "c8b9d0e1-f2a3-4b5c-8d6e-9f0a1b2c3d4e"  // UUID of COGS Block
      ]
    }
  }
}
```
This link can never break. The dreaded `#REF!` error is now extinct.

### 🤖 The AI Weaver: The Intent-Driven Interface

The Weaver is the AI kernel that translates human intent into actions on the graph.

*   **Interpreter:** `Create a Q4 forecast based on last quarter's results with a 5% growth assumption.` → The Weaver finds the relevant blocks, creates new ones, and links them into the graph.
*   **Assembler:** `Show me a dashboard of all open decisions and risks for Project Titan.` → The Weaver queries the graph and assembles a temporary, live view (a "Canvas") from the results.
*   **Synthesizer:** `What is the biggest risk to our revenue target?` → The Weaver traverses the graph, analyzes dependencies, and synthesizes an answer from connected blocks of knowledge.

---

## The 1000x Experience: A Scenario

> **The Job:** Creating the quarterly financial forecast.

### Before: The Spreadsheet Way
1.  Manually export CSVs from 3 different SaaS tools.
2.  Copy-paste data into a master `Forecast_v4_final.xlsx`.
3.  Spend hours writing brittle `VLOOKUP` and `SUMIFS` formulas.
4.  Email the file. Discover an error. Send `v5_final_final`.
5.  The entire model is stale in 24 hours. The process repeats.

### After: The Wasl Way
1.  You open your "Company Dashboard" Canvas. The `Metric` block for "Q3 Actual Revenue" is already there, live-synced to Stripe.
2.  You type: **`@Wasl, create a Q4 forecast based on this dashboard, using a 4% monthly growth assumption.`**
3.  Wasl instantly generates a new section with a live `Assumption` block and a series of projected `Metric` blocks.
4.  Your CFO opens the same Canvas, moves a slider on the `Growth Assumption` block from 4% to 6%, and watches the entire forecast update in real-time for everyone. **There are no versions. There is only the living model.**

---

## 🚀 Project Status & Roadmap

**Current Status: Conceptual Phase**

Wasl is currently a well-defined architectural and philosophical concept. We are in the process of building a community of thinkers, architects, and engineers to bring this vision to life.

**The Roadmap:**

1.  **Phase 1: The Core Engine (The Blockstore & Graph)**
    *   [ ] Design and implement the `Block` storage system.
    *   [ ] Build the real-time graph engine for managing semantic relationships.
    *   [ ] Implement a CRDT-based sync layer for real-time collaboration.

2.  **Phase 2: The AI Weaver (The Intelligent Kernel)**
    *   [ ] Develop the natural language interpretation layer.
    *   [ ] Build the core Assembler and Synthesizer capabilities.

3.  **Phase 3: The Viewport & Connectors (The User Experience)**
    *   [ ] Build a performant, Canvas/WebGL-based frontend for rendering Blocks.
    *   [ ] Develop the initial plugin architecture for `DataSource` blocks (Stripe, Jira, etc.).

## 🤝 How to Contribute

This is not a project for the faint of heart. We are looking for those who want to build the future, not just another app.

*   **Architects & Thinkers:** Join us in the **[Discussions](https://github.com/your-org/Wasl/discussions)** to challenge and refine the core concepts. We are actively seeking input on the architectural blueprint.
*   **Engineers (Backend, Frontend, AI):** Watch this repository. We will be posting initial RFCs (Request for Comments) on the core engine design soon.
*   **Designers & Product Visionaries:** How do we design an interface for thought itself? If this question excites you, we want to hear from you.

Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for more details on our philosophy and how to get involved.

## License

Project Wasl is licensed under the [MIT License](LICENSE).

```
