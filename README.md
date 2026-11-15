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
- Saisie par photo (trispot et blasons à anneaux) : on photographie la cible, [Cible Photo](https://github.com/josecodelover/cible-photo) repère les impacts, et la volée vient s'inscrire avec la position de chaque flèche.
- Feuille de marque, historique des séances, reprise d'une séance en cours.
- Statistiques par blason : moyenne par flèche, répartition des valeurs, groupement (centre et dispersion en centimètres).
- Sauvegarde : export et import des séances sous forme de texte.

Les séances sont enregistrées sur l'appareil (stockage local du navigateur).

## État

Version d'origine récupérée depuis l'APK installé, complétée par le tir campagne, le tir nature, le suivi de plusieurs archers, la règle du même spot en trispot et la saisie par photo.

La saisie par photo n'a été vérifiée que dans le navigateur, sur une photo de démonstration : pas encore sur téléphone ni sur le blason 80 cm réduit. La lecture des impacts a les limites décrites dans le dépôt de Cible Photo ; il faut relire la proposition avant de valider.

## Saisie par photo : comment elle est intégrée

`cible-photo.html` est une **copie exacte** de `index.html` du dépôt [cible-photo](https://github.com/josecodelover/cible-photo). Carnet de tir l'ouvre dans un cadre plein écran, en mode intégré :

- le blason, le diamètre du tube, le comptage du 10 et le nombre de flèches à lire sont passés dans l'adresse (`cible-photo.html?embed=1&face=tri&diam=40&shaft=9&ten=small&per=3`) ;
- Cible Photo rend la volée par `postMessage` (`cible-photo:end`, avec la valeur, le spot et la position de chaque impact en largeurs d'anneau), ou `cible-photo:cancel` ;
- Carnet de tir applique ensuite ses propres règles (même spot, volée complète).

Toute l'analyse d'image reste donc dans Cible Photo, qui continue d'exister comme application autonome. Pour la faire évoluer :

1. travailler dans le dépôt `cible-photo` (placé à côté de celui-ci) ;
2. lancer `outils/maj-cible-photo.ps1`, qui recopie son `index.html` ici ;
3. reconstruire l'APK avec `android/build_apk.ps1`.

Ne jamais modifier `cible-photo.html` directement : la copie suivante écraserait le changement.

## Installation sur Android

L'APK est dans `android/out/CarnetDeTir.apk`. Il se construit sans Gradle avec `android/build_apk.ps1` (SDK Android et JDK requis). L'application demande la caméra, pour la visée de la saisie par photo ; elle n'a pas d'accès réseau.
