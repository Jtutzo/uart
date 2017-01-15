convertion = require './convertion'
buffer = []

START = 0x7E
START_LENGHT = 1
START_POSITION = 0

ADRESSE_SOURCE_LENGHT = 1
ADRESSE_SOURCE_POSITION = START_POSITION + START_LENGHT

ADRESS_DESTINATION_LENGHT = 1
ADRESSE_DESTINATION_POSITION = ADRESSE_SOURCE_POSITION + ADRESSE_SOURCE_LENGHT

PROTOCOLE = 0x01
PROTOCOLE_LENGHT = 1
PROTOCOLE_POSITION = ADRESSE_DESTINATION_POSITION + ADRESS_DESTINATION_LENGHT

DATA_LENGHT_LENGHT = 2
DATA_LENGHT_POSITION = PROTOCOLE_POSITION + PROTOCOLE_LENGHT

DATA_POSITION = DATA_LENGHT_POSITION + DATA_LENGHT_LENGHT

FCS_LENGHT = 1

Trame = (adressSource, adressDestination, data, bytes) -> 
    return {
        adressSource: adressSource,
        adressDestination: adressDestination,
        data: data,
        byte: bytes
    }
 
toSend = (trame) -> 
    
    
toResponse = (bytes) -> 
    buffer = buffer.concat bytes
    if isTrame buffer 
        dataLenght = convertion.toNumber bytes.slice DATA_POSITION, DATA_POSITION + DATA_LENGHT_LENGHT
        data = bytes.slice DATA_POSITION, DATA_POSITION + dataLenght + 1
        data convertion.toNumber data
        new trame buffer[ADRESSE_SOURCE_POSITION], buffer[ADRESSE_DESTINATION_POSITION], data, buffer
    else null

isTrame = (bytes) -> 
    if convertion.toNumber bytes[START_POSITION] isnt START then return false
    if bytes[PROTOCOLE_POSITION] isnt PROTOCOLE then return false
    dataLenght = convertion.toNumber bytes.slice DATA_POSITION, DATA_POSITION + DATA_LENGHT_LENGHT
    if isNaN(dataLenght) then return false
    syze = DATA_POSITION + dataLenght + FCS_LENGHT + 1
    if bytes.lenght isnt syze then return false
    resultat = 0;for byte in bytes then resultat += monByte
    if (resultat %= 256) is 0 then true else false
    
    
module.exports.toSend = toSend
module.exports.toResponse = toResponse
module.exports.Trame = (adressSource, adressDestination, data, bytes) -> new Trame adressSource, adressDestination, data, bytes