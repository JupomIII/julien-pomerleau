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
| Mettre à jour le parcours et les camps | Section **Mon parcours** dans `index.html` |

## Personnaliser le portfolio

1. Dans `index.html`, remplace les textes de présentation et les informations à personnaliser.
2. Dans la section **Mon parcours**, ajoute ou modifie les camps et les saisons. Le style reste volontairement simple : une ligne par étape.
3. Dans la section **Partenaires**, remplace l’emplacement « votre logo ici » par une nouvelle carte. Dépose d’abord le logo dans `assets/sponsors/`, puis copie le bloc d’un partenaire existant :

   ```html
   <figure class="sponsor">
     <div class="sponsor-logo">
       <img
         src="assets/sponsors/nom-du-sponsor.png"
         alt="Nom du sponsor"
         loading="lazy"
       />
     </div>
     <figcaption>
       Nom du sponsor
       <small>depuis 2024</small>
     </figcaption>
   </figure>
   ```

   Le texte de la `figcaption` s’affiche sous le logo : le nom, puis une précision en petites capitales. Pour un logo clair ou blanc (comme `excellence-sportive.png`), ajoute la classe `sponsor-dark` à la `figure` pour obtenir un fond bleu encre :

   ```html
   <figure class="sponsor sponsor-dark">
   ```

   Les logos sont mieux rendus avec un fond transparent : c’est le cas de
   `fondation-ascension.png`, détouré pour que seul le logo apparaisse dans son cadre.

4. Pour remplacer une photo, copie la nouvelle image dans `assets/photos/` et modifie le `src` de la balise `<img>` correspondante dans `index.html`. Garde un texte `alt` qui décrit réellement la photo.
5. L’adresse de contact est `julienpomerleau07@gmail.com` : elle figure dans le pied de page (`index.html`) et dans `script.js` pour le formulaire. Modifie les deux si elle change.

Les chemins des ressources sont relatifs à la racine du projet. Garde cette organisation et ces chemins quand tu déplaceras ou ajouteras des fichiers.
