# --- Wasl API Server Image ---

FROM python:3.10-slim

# Installer Poetry
RUN pip install --no-cache-dir poetry

WORKDIR /app

# Copier uniquement les fichiers de config pour optimiser le cache
COPY pyproject.toml poetry.lock ./

# Installer les dépendances sans les paquets de dev
RUN poetry config virtualenvs.create false && poetry install --without dev --no-root

# Copier le reste du code
COPY . .

# Lancer l’API avec Uvicorn
CMD ["uvicorn", "wasl_server.main:app", "--host", "0.0.0.0", "--port", "8000"]
