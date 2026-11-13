# Carnet de tir

Carnet de scores pour le tir à l'arc, en entraînement ou en concours. Application web d'un seul fichier (`index.html`), sans dépendance, utilisable hors ligne.

## Fonctions

- Séances préréglées : salle 18 m (trispot ou blason 40 cm), extérieur 30, 50 et 70 m, parcours 3D, tir campagne, tir nature.
- Tir campagne : blasons de 20, 40, 60 ou 80 cm au choix à chaque cible, zones 6 à 1.
- Tir nature : zone tuée ou blessée, 20 / 15 pour la première flèche, 15 / 10 pour la suivante.
- Arc à poulies, classique ou nu (en salle, le petit 10 pour les poulies).
- Jusqu'à 4 archers sur la même feuille, chacun avec son arc ; passage automatique à l'archer suivant après chaque volée.
- Trispot : plusieurs flèches placées dans le même spot, seule la moins bonne compte.
- Saisie au doigt sur le blason, avec loupe, ou par boutons de valeur.
- Feuille de marque, historique des séances, reprise d'une séance en cours.
- Statistiques par blason : moyenne par flèche, répartition des valeurs, groupement (centre et dispersion en centimètres).
- Sauvegarde : export et import des séances sous forme de texte.

Les séances sont enregistrées sur l'appareil (stockage local du navigateur).

## État

Version d'origine récupérée depuis l'APK installé, complétée par le tir campagne, le tir nature, le suivi de plusieurs archers et la règle du même spot en trispot. Ajout prévu : saisie par photo.

## Installation sur Android

L'APK est dans `android/out/CarnetDeTir.apk`. Il se construit sans Gradle avec `android/build_apk.ps1` (SDK Android et JDK requis). L'application ne demande aucune permission.
