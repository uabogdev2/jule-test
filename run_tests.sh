#!/bin/bash
# ==============================================================================
#  Script de Test pour un Projet Flutter
# ==============================================================================
#
#  Ce script est destiné à la section "Repo commands" de Jules.
#  Il suppose que l'environnement Flutter a déjà été configuré par
#  le script 'setup_env.sh' lors de l'Initial Setup.
#
#  Il effectue les actions suivantes :
#  1. Installe les dépendances spécifiques au projet.
#  2. Lance les tests et l'analyse statique du code.
#
# ==============================================================================

# Arrête l'exécution du script immédiatement si une commande échoue.
set -e

echo "--- Démarrage des tests du projet ---"

# C'est une étape cruciale : il faut s'assurer que la commande 'flutter'
# est disponible dans cette nouvelle session de terminal.
export PATH="$PATH:$HOME/flutter_sdk/bin"

# --- ETAPE 1: INSTALLATION DES DÉPENDANCES DU PROJET ---
echo "--- Installation des dépendances du projet (depuis pubspec.yaml) ---"
flutter pub get


# --- ETAPE 2: TEST ET ANALYSE DU CODE ---
echo "--- Lancement des tests et de l'analyse statique ---"
echo "Lancement des tests..."
flutter test

echo "Lancement de l'analyse statique..."
flutter analyze


# --- FIN DU SCRIPT ---
echo "--- ✅ Tests terminés avec succès. ---"
