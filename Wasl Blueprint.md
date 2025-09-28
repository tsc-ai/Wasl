# **Wasl Architectural Blueprint: The Final Mandate (v1.2)**

## **1. Our Mission: A Living Model of Knowledge**

Project Wasl's mission is to replace the static, disconnected paradigm of documents and spreadsheets with a living, intelligent workspace. Our platform is not a tool; it is a **system of interaction** built on a **semantic graph** of interconnected knowledge.

This document lays out the definitive architectural choices to achieve this mission. It is the single source of truth for our technical direction.

## **2. The Core Philosophy: The Polyglot Principle**

We are building a system that must be both **intelligent and fast**. It must evolve at the speed of the AI ecosystem while being as reliable as core infrastructure. No single programming language is the optimal tool for both of these jobs.

Therefore, our core philosophy is a **Polyglot Architecture**, which leverages the absolute best tool for each specific task.

*   **Python is the Application & Intelligence Layer:** Chosen for its world-class AI ecosystem, rapid development velocity, and vast talent pool. It is the brain of Wasl, responsible for logic, orchestration, and learning.
*   **Rust is the Systems & Performance Layer:** Chosen for its memory safety, elite performance, and fearless concurrency. It is the nervous system of Wasl, responsible for the high-throughput, low-latency tasks that must never fail.

## **3. The Definitive Architecture**

The Wasl platform is composed of four primary, decoupled domains: the **Datastore**, the **Backend**, the **Frontend**, and the **AI Core**.

### **3.1. The Datastore: A Unified Foundation**

*   **Technology:** **PostgreSQL**
*   **Rationale:** We are committed to a single, unified datastore to eliminate complexity and ensure data integrity. PostgreSQL is the most powerful and versatile open-source database in the world.
*   **Implementation:**
    *   **Block Storage:** Block state and schema will be stored in a `blocks` table using the native, indexed **`JSONB`** type.
    *   **Graph Engine:** Relationships ("Links") between Blocks will be managed by the **Apache AGE** extension, providing a native graph layer on top of our existing database. This gives us the power of the OpenCypher query language without adding another database to our stack.

### **3.2. The Backend: A Symbiotic Partnership**

The backend consists of two distinct microservices that work in concert.

**A. `wasl-server` (The Brain)**
*   **Language:** **Python**
*   **Framework:** **FastAPI**
*   **Responsibilities:**
    1.  **Primary API Gateway:** Manages all standard HTTPS requests for Block creation, queries, updates, and authentication.
    2.  **Business Logic:** Executes all the core application logic.
    3.  **AI Orchestration:** Natively integrates with the AI Core (see section 3.4).
*   **Rust Augmentation (`wasl_core`):** For specific, CPU-bound algorithms that are bottlenecks in Python, we will write native Python extension modules in **Rust** using the **PyO3** framework. This gives us surgical performance enhancements where needed.

**B. `wasl-sync` (The Nervous System)**
*   **Language:** **Rust**
*   **Framework:** **Axum**
*   **Responsibilities:**
    1.  **Real-Time Collaboration:** Manages all persistent **WebSocket** connections from clients.
    2.  **CRDT Synchronization:** Uses the mature **`yrs`** crate to process and broadcast **Y.js** CRDT updates, ensuring conflict-free, real-time collaboration.
    3.  **State Persistence:** Handles the efficient snapshotting of CRDT document states to the PostgreSQL datastore.

### **3.3. The Frontend: An Interactive Viewport**

*   **Language:** **TypeScript**
*   **Architecture:** The frontend is a single-page application with a clear separation of concerns.
    *   **Rendering Engine:** The main canvas for viewing and interacting with Blocks will be rendered using the **Pixi.js** library. This choice prioritizes its mature API, extensive community support, and proven WebGL performance.
    *   **UI Shell:** A minimal UI shell (menus, modals, user settings) will be built with the **Svelte** framework for its speed and simplicity.

### **3.4. The AI Core: Open & Transparent Intelligence**

*   **Integration:** The AI Core, named the **Weaver**, is a core component *within* the Python `wasl-server`, not a separate service initially. This allows for the tightest possible integration.
*   **Technology:**
    *   We will exclusively use **open-source, self-hostable Large Language Models** from providers like **Mistral AI**, **Llama**, and the **Hugging Face** community.
    *   We will use standard Python libraries like **PyTorch**, **Transformers**, and **LangChain** for model inference and orchestration.
*   **Principle:** The AI will be transparent. No reliance on proprietary, black-box APIs. This ensures data privacy, control, and explainability.

## **4. The Final Architectural Diagram**

This diagram is the definitive representation of the Wasl architecture.

```
+-------------------------------------------------------------------------+
| Browser (User)                                                          |
| +-------------------------+   +---------------------------------------+ |
| |        UI Shell         |   |             Viewport (Canvas)         | |
| |  (Svelte, TypeScript)   |   |        (Pixi.js, TypeScript)          | |
| +-------------------------+   +---------------------------------------+ |
+-------------|-----------------^----------------------^------------------+
              | (HTTPS API)     | (WebSocket - CRDT Sync)
              v                 |
+-------------+-----------------|-----------------------------------------+
|   PYTHON APPLICATION LAYER    |        RUST SYSTEMS LAYER               |
| +---------------------------+ | +-------------------------------------+ |
| | wasl-server (Python)      | | | wasl-sync (Rust Microservice)       | |
| | (FastAPI)                 | | | (Axum, yrs)                         | |
| | - API Gateway (Blocks/Graph)| | | - Manages all WebSocket connections | |
| | - AI Weaver (Integrated)  | | | - Processes/Broadcasts CRDT updates | |
| | - Imports `wasl_core.so`  | | |                                     | |
| +---------------------------+ | +-------------------------------------+ |
+-------------|---------------------------------^-------------------------+
              | (SQL via psycopg)               | (SQL via sqlx)
              v                                 v
+-------------+-------------------------------+---------------------------+
| UNIFIED DATASTORE (PostgreSQL + Apache AGE)                             |
+-------------------------------------------------------------------------+
```

