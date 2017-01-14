# uart #

Auteur : Jtutzo, dernière version : 0.0.1, statut : en dev

> C'est un module qui permet la gestion de l'uart pour l'environement nodeJS.<br />
Il est composé de sous-modules qui sont les suivants :
 - [convert](#convert)
 
## convert <a id="convert"></a>##
> Permet la convertion de nombre en tableau de bytes dimmensionnés et de tableau de bytes en nombre.

### Utilisations ###

`var convert = require('uart').convert();`

### Variables statiques ###
- [littleEndian](#littleEndian)

### Méthodes ###
- [toBytes](#toBytes)
- [toNum](#toNum)

### Détails ###

**`littleEndian`<a id="littleEndian"></a>**

Variable statique afin de paramétrer l'encodage/décodage des données (`littleEndian` ou `bigEndian`)

**`toBytes`<a id="toBytes"></a>**

Convertis un nombre en tableau de bytes dimmensionnés<br />
*Retour* : `array` de `byte`<br />
*Exception* : `Illegal syze`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|num            |number               |Nombre à convertir|
|syze           |number               |Taille du tableau de bytes|

**`toNum`<a id="toNum"></a>**

Convertis un tableau de `bytes` en `number`<br />
*Retour* : `number`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|bytes          |array                |Tableau de bytes à convertir|
