# SwiftUI 101

## 02 - App-basics

### exercice 1 :

1. Il manque un identifiant, servant à reconnaitre la liste

### Exercice 2 :

1. On retrouve maintenant une fonction ajoutant un élément à la liste, ainsi que l'ajout d'un bouton dans la view appelant cette fonction
2. On utilise un Foreach afin de pouvoir séparer la liste des autres valeurs de la page. Sons role est donc d'afficher chaque élément de la liste. Si on ne séparais pas le bouton du foreach, on aurait autant de boutons que d'éléments présents dans la liste.

### Exercice 3 :

- Ce code ne fonctionne pas car la liste est immuable
- Le @State annonce à swiftUi que la valeur peut être lue mais aussi ecrite.

## 04 Ajout item

### Exercice 1 :

- Le code ne marche pas car une classe ne peut pas prendre de @State sur son instantiation, il faut donc déclarer la classe en tant que ObservableObject
- On obtient une erreur nous signalant qu'un suel et même id se trouve plusieurs fois dans la liste, on a donc des doublons

### Exercice 2 : 
- Le code fonctionne de nouveau car maintenant avec @ObservableObject, on lui dis de surveiller les évolutions de l'objet.
- Mettre @StateObject fait qu'on ajoute les éléments forcément un par un, ce qui est plus propre

## 05 Modèle

### Exercice 2 :
- Il y a une erreur de type identifiable car on ne retrouve plus d'identifiant unique pour les cellules

### Exercice 3 : 
- On utilise un tag car on a définis un id pour les jeux mais on ne dis pas de s'en servir. Le tag sert à se servir d'un id définis

## 07 Animation:

Lien vers la diapositive:

https://www.canva.com/design/DAF6sS10NOQ/F7n9qzc8yMxYeIVYmXq2gg/edit?utm_content=DAF6sS10NOQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton
