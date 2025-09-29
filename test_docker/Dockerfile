# --- PostgreSQL 14 + Apache AGE (Debian - Optimisé pour le Cache) ---

FROM postgres:14

# --- Couche 1 : Dépendances Système ---
# Cette couche ne sera reconstruite que si la liste des paquets change.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    flex \
    bison \
    libxml2-dev \
    libreadline-dev \
    zlib1g-dev \
    clang \
    llvm \
    make \
    autoconf \
    automake \
    postgresql-server-dev-14 \
    && rm -rf /var/lib/apt/lists/*

# --- Couche 2 : Clonage des Sources ---
# Cette couche est lente mais stable. Elle sera mise en cache et réutilisée
# tant que la commande git ne change pas.

#RUN mdkir /tmp/age
COPY ./age /tmp/age

#RUN git clone https://github.com/apache/age.git /tmp/age && cd /tmp/age && git fetch origin && git checkout release/PG14/1.5.0
RUN cd /tmp/age && git checkout release/PG14/1.5.0


# --- Couche 3 : Compilation et Installation ---
# C'est la couche que vous modifierez le plus souvent. Si elle échoue,
# seules les commandes de cette couche seront ré-exécutées, en utilisant
# les sources déjà clonées de la couche précédente (cache).
RUN cd /tmp/age &&  make -s PG_CONFIG=/usr/bin/pg_config PG_CPPFLAGS="-I\"$(/usr/bin/pg_config --includedir-server)\" -I./src/include -I./src/include/parser" CC=clang \
    CXX=clang++ && \
    make install PG_CONFIG=/usr/bin/pg_config && \
   # Nettoyer les sources APRÈS une installation réussie pour garder l'image légère
   rm -rf /tmp/age

# --- Point d'Entrée (pour le débogage) ---
# Lance un shell au lieu de PostgreSQL.
# Pour une utilisation en production, commentez ou supprimez cette ligne.

#CMD ["bash"]
