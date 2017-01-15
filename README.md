# uart #

Auteur : Jtutzo, dernière version : 1.1.0, statut : stable

> C'est un module qui permet la gestion de l'uart pour l'environement nodeJS.<br />
Il est composé d'un sous-modules qui est le suivants :
 - [convertion](#moduleConvertion)
 
Compilation du module : `npm run compile`<br />
Compilation des tests : `npm run compile-test`<br />
Mise en route des tests : `npm test`

### Utilisations ###

`var uart = require('uart')`

### Méthodes ###
- [convertion](#convertion)
- [setProtocol](#setProtocol)
- [list](#list)
- [screenList](#screenList)
- [open](#open)
- [update](#update)
- [send](#send)
- [close](#close)
- [onData](#onData)
- [onError](#onError)
- [onClose](#onClose)
- [openDebug](#openDebug)

### Détails ###

**`convertion`<a id="convertion"></a>**

Retourne le module convertion (pout plus d'information voir [convertion](#moduleConvertion))<br />
*Retour* : module `convertion`

**`setProtocol`<a id="setProtocol"></a>**

Change le protocol<br />

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|customProtocol |object               |Le protocol à utiliser|
|customProtocol.toSend |function(value) |retourne la valeur (ou trame) en liste de byte|
|customProtocol.toResponse |function(bytes) |retourne la liste de byte en une valeur (ou trame|

**`list`<a id="list"></a>**

Listes les ports de l'ordinateur

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|handler        |function(err, ports) |Appelé au retour de l'opération|

**`screenList`<a id="screenList"></a>**

Affiche la liste des ports

**`open`<a id="open"></a>**

Ouvre et initialise un port

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|portName       |string               |Nom du port à ouvrir|
|options        |object               |Option du port (voir [openOptions](https://github.com/EmergingTechnologyAdvisors/node-serialport/blob/5.0.0-beta3/README.md#module_serialport--SerialPort..openOptions))|
|handler        |function(err)        |Appelé au retour de l'opération|

**`update`<a id="update"></a>**

Change les options du port ouvert
*Exception* : `PortNotOpen`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|options        |object               |Option du port (voir [openOptions](https://github.com/EmergingTechnologyAdvisors/node-serialport/blob/5.0.0-beta3/README.md#module_serialport--SerialPort..openOptions))|
|handler        |function(err)        |Appelé au retour de l'opération|

**`send`<a id="send"></a>**

Envoie une valeur sur le port
*Exception* : `PortNotOpen`

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|value          |uknow                |Valeur ou trame à envoyer sur le port|
|handler        |function(data)       |Appelé au retour de l'opération|

**`close`<a id="close"></a>**

Ferme le port
*Exception* : `PortNotOpen`

**`onData`<a id="onData"></a>**

Attache un listenner à l'évènement 'data'

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|handler        |function(value)      |Listenner|

**`onError`<a id="onError"></a>**

Attache un listenner à l'évènement 'error'

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|handler        |function(err)        |Listenner|

**`onClose`<a id="onClose"></a>**

Attache un listenner à l'évènement 'close'

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|handler        |function(err)        |Listenner|

**`openDebug`<a id="openDebug"></a>**

Ouvre le port avec des options par défaut

| Argument      |Type                 |Description |
| ------------- |-------------        | ---------  |
|portName       |string               |Nom du port à ouvrir|


## convertion <a id="moduleConvertion"></a>##
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
