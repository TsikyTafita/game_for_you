1) titre du jeu: jeu de labyrinthe 
2) objectif du jeu: 
   - Collectez autant de boules vertes que possible pour augmenter le score.
   - Évitez les trous rouges qui apparaissent à intervalles réguliers.

3) description du jeu: 
   C' est un jeu simple. Le joueur navigue à travers un labyrinthe basé sur une grille, collectant des boules vertes pour augmenter le score tout en évitant les trous rouges qui provoquent la fin du jeu. Le jeu devient progressivement plus difficile à mesure que de nouveaux trous apparaissent à intervalles réguliers.
   
4) Contrôles:
   Utilisez les touches fléchées pour déplacer le joueur:
   - Flèche HAUT pour monter.
   - Flèche BAS pour descendre.
   - Flèche GAUCHE pour aller à gauche.
   - Flèche DROITE pour aller à droite.
   
5) Fin de Partie:
   Le jeu se termine lorsque le joueur entre en collision avec un trou rouge.
   Le score final sera affiché.
   
6) Éléments du jeu:
  - Joueur: représenté par un carré bleu
  - boule: représenté par des cercles rouges
  
7) à propos du code:
   variables: 
   - cellSize : Taille de chaque cellule de la grille.
   - cols, rows : Nombre de colonnes et de lignes de la grille.
   - player : Instance de la classe Player.
   - balls : Liste des objets Ball.
   - holes : Liste des objets Hole.
   - score : Score du joueur.
   - gameOver : Booléen indiquant si le jeu est terminé.
   - holeTimer, holeInterval : Utilisés pour gérer le timing de la génération de nouveaux trous.
   
8) Fonctions: 
   - setup() : Initialise le jeu, configure la grille, le joueur et les boules.
   - draw() : Boucle principale du jeu qui gère le rendu et la logique du jeu.
   - generateBalls() : Génère les boules initiales à des positions aléatoires.
   - generateRandomHole() : Génère un nouveau trou à une position aléatoire à des intervalles définis.
   - checkCollisions() : Vérifie les collisions entre le joueur et les boules ou les trous.
   - keyPressed() : Gère le mouvement du joueur en fonction des touches pressées.
   
9) classes:
  - Player
  - Ball
  - Hole
  
10) améliorations futures du jeu:
  - ajout des niveaux avec une difficulté
  - ajout des différents types d' obstacles et d' ennemis.
