# Portfolio de Julien Pomerleau — kayak de vitesse

Site vitrine statique (HTML, CSS et JavaScript), sans étape de compilation. Les textes et images se modifient directement dans les fichiers ci-dessous.

## Aperçu local

Ouvre `index.html` dans un navigateur. Pour tester aussi le PDF et les images avec un serveur local :

```bash
python -m http.server 4173
```

Puis visite <http://localhost:4173>.

## Où faire les changements ?

| Je veux…                                            | Fichier ou dossier  |
| --------------------------------------------------- | ------------------- |
| Modifier les textes et les sections                 | `index.html`        |
| Modifier couleurs, polices, espacements et mobile   | `style.css`         |
| Modifier le menu mobile ou le formulaire e-mail     | `script.js`         |
| Remplacer les photos                                | `assets/photos/`    |
| Ajouter ou remplacer un logo de sponsor             | `assets/sponsors/`  |
| Mettre à jour les résultats | Section **Résultats** dans `index.html` |

## Personnaliser le portfolio

1. Dans `index.html`, remplace les textes de présentation et les informations à personnaliser.
2. Dans la section **Résultats**, actualise les rangs et chronos à partir de résultats officiels. Les données 2026 affichées ont été transcrites à partir du rapport fourni, qui reste local et n’est pas publié avec le site.
3. Dans la section **Mes partenaires actuels**, remplace les emplacements `VOTRE LOGO ICI` par de nouvelles cartes. Dépose d’abord chaque logo dans `assets/sponsors/`, puis ajoute une image comme celle de Fondation Ascension :

   ```html
   <figure class="sponsor-card">
     <img
       src="assets/sponsors/nom-du-sponsor.png"
       alt="Nom du sponsor"
       loading="lazy"
     />
     <figcaption>PARTENAIRE · NOM DU SPONSOR</figcaption>
   </figure>
   ```

4. Pour remplacer une photo, copie la nouvelle image dans `assets/photos/` et modifie le `src` de la balise `<img>` correspondante dans `index.html`. Garde un texte `alt` qui décrit réellement la photo.
5. Remplace `contact@votre-domaine.fr` dans `index.html` **et** `script.js` par l’adresse à utiliser pour le formulaire.

Les chemins des ressources sont relatifs à la racine du projet. Garde cette organisation et ces chemins quand tu déplaceras ou ajouteras des fichiers.
