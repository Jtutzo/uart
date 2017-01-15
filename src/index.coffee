convertion = require './convertion'
uart = require './uart'

###
# Retourne le module convertion
# @return convertion
###
module.exports.convertion = () -> convertion

###
# Change le protocol
# @param customProtocol
###
module.exports.setProtocol = (customProtocol) -> uart.setProtocol customProtocol

###
# Liste les ports
###
module.exports.list = (handler) -> uart.list handler

###
# Affiche la liste des ports
###
module.exports.screenList = () -> 
    uart.list (err, ports) -> if err then console.error "#{err}" else ports.forEach (port) -> console.log port.comName

###
# Ouvre et initialise un port
# @param portName
# @param options
# @param handler
###
module.exports.open = (portName, options, handler) -> uart.open portName, options, handler

###
# Change les options du port ouvert
# @param options
# @param handler
###
module.exports.update = (options, handler) -> uart.update options, handler

###
# Envoie une valeur sur le port
# @param value
# @param handler
###
module.exports.send = (value, handler) -> uart.send value, handler

###
# Ferme le port
###
module.exports.close = () -> uart.close undefined

###
# Attache un listenner à l'évènement 'data'
###
module.exports.onData = (handler) -> uart.onData handler

###
# Attache un listenner à l'évènement 'error'
###
module.exports.onError = (handler) -> uart.onError handler

###
# Attache un listenner à l'évènement 'close'
###
module.exports.onClose = (handler) -> uart.onClose handler

###
# Ouvre le port avec des options par défaut
# @param portName
###
module.exports.openDebug = (portName) -> 
    options = {
        baudRate: 115200,
        dataBits: 8,
        stopBits: 1,
        parity: 'none'
    }
    uart.open portName, options, (err) -> 
        if err then console.error "Error open : #{err}"; return 0
        else 
            uart.onData (data) -> console.log "Received : #{data}"
            uart.onError (err) -> console.log "Error : #{err}"
            uart.onClose (err) -> if err then console.error "Error close #{err}" else console.log "Port close"
            console.log "Port init with success"
