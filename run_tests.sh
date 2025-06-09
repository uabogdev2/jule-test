#!/bin/bash
# ==============================================================================
#  Script de Validation pour un Projet Flutter
# ==============================================================================
#
#  Ce script est conçu pour être exécuté dans un environnement d'intégration
#  continue (comme Jules) qui a déjà les dépendances système de base (git, etc.).
#
#  Il effectue les actions suivantes :
#  1. Installe le SDK Flutter s'il n'est pas déjà présent.
#  2. Valide l'environnement avec `flutter doctor`.
#  3. Installe les dépendances du projet avec `flutter pub get`.
#  4. Lance les tests et l'analyse statique pour vérifier la qualité du code.
#
# ==============================================================================

# Arrête l'exécution du script immédiatement si une commande échoue.
set -e

# --- ETAPE 1: INSTALLATION DU SDK FLUTTER ---
echo "--- ETAPE 1: Installation du SDK Flutter ---"

# Définit la version de Flutter pour garantir une exécution cohérente.
# Vous pouvez changer cette version pour correspondre à celle de votre projet.
FLUTTER_VERSION="3.22.2"
FLUTTER_PATH="$HOME/flutter_sdk"

# Clone le SDK Flutter uniquement s'il n'existe pas déjà.
if [ ! -d "$FLUTTER_PATH" ]; then
    echo "SDK Flutter non trouvé. Clonage de la version ${FLUTTER_VERSION}..."
    git clone https://github.com/flutter/flutter.git --depth 1 --branch ${FLUTTER_VERSION} ${FLUTTER_PATH}
else
    echo "Le SDK Flutter est déjà présent dans le cache."
fi

# Ajoute la commande 'flutter' au PATH de l'environnement pour cette session.
export PATH="$PATH:${FLUTTER_PATH}/bin"


# --- ETAPE 2: VALIDATION DE L'ENVIRONNEMENT ---
echo "--- ETAPE 2: Validation de l'environnement avec 'flutter doctor' ---"

# Affiche des informations détaillées sur l'installation de Flutter.
flutter doctor -v


# --- ETAPE 3: PRÉPARATION DU PROJET ---
echo "--- ETAPE 3: Installation des dépendances du projet (depuis pubspec.yaml) ---"

# Télécharge tous les packages Dart et Flutter nécessaires au projet.
flutter pub get


# --- ETAPE 4: TEST ET ANALYSE DU CODE ---
echo "--- ETAPE 4: Lancement des tests et de l'analyse statique ---"

# Exécute tous les tests unitaires et de widgets définis dans le répertoire 'test'.
echo "Lancement des tests..."
flutter test

# Analyse le code source pour détecter les erreurs, avertissements et bonnes pratiques.
echo "Lancement de l'analyse statique..."
flutter analyze


# --- FIN DU SCRIPT ---
echo "--- ✅ Script de vérification terminé avec succès. Le projet est valide. ---"
```

### Comment l'utiliser :

1.  **Créez un fichier** `run_tests.sh` à la racine de votre projet.
2.  **Copiez-collez** le code ci-dessus dans ce fichier.
3.  **Enregistrez** le fichier et ajoutez-le à votre dépôt Git.
4.  Dans l'interface de Jules, entrez `sh run_tests.sh` comme commande de te
