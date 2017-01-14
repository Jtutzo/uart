# uart #

Auteur : Jtutzo, dernière version : 0.0.1, statut : en dev

> C'est un module qui permet la gestion de l'uart pour l'environement nodeJS.<br />
Il est composé de sous-modules qui sont les suivants :
 - [convertion](#convertion)
 
Compilation du module : `npm run compile`<br />
Compilation des tests : `npm run compile-test`<br />
Mise en route des tests : `npm test`

## convertion <a id="convertion"></a>##
> Permet la convertion de nombre en tableau de bytes dimmensionnés et de tableau de bytes en nombre.

### Utilisations ###

`var convertion = require('uart').convertion();`

### Méthodes ###
- [isLittleEndian](#isLittleEndian)
- [toBytes](#toBytes)
- [toNumber](#toNumber)

### Détails ###

**`isLittleEndian`<a id="isLittleEndian"></a>**

Change l'encodage/décodage des données (`littleEndian` ou `bigEndian`)<br />
*Retour* : `boolean`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|value          |boolean              |Encodage en littleEndian|

**`toBytes`<a id="toBytes"></a>**

Convertis un nombre en tableau de bytes dimmensionnés<br />
*Retour* : `array` de `byte`<br />
*Exception* : `IndexOutOfRange`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|num            |number               |Nombre à convertir|
|syze           |number               |Taille du tableau de bytes|

**`toNumber`<a id="toNumber"></a>**

Convertis un tableau de `bytes` en `number`<br />
*Retour* : `number`<br />
*Exception* : `UndefinedOrNullValue`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|bytes          |array                |Tableau de bytes à convertir|
