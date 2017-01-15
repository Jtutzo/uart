SerialPort = require 'serialport'
convertion = require './convertion'
ByteLength = SerialPort.parsers.ByteLength

port = null
parser = null
isOpen = false

###
# default's protocol
###
protocol = {
    buffer: [],
    syze: 8,
    toSend: (value) -> convertion.toBytes value
    toResponse: (bytes) -> 
        this.buffer = this.buffer.concat(bytes)
        if this.buffer.length is this.syze then value = convertion.toNumber this.buffer;this.buffer = [];return value
        null
}

###
# set custom protocol
# @param customProtocol
###
setProtocol = (customProtocol) -> protocol = customProtocol

###
# list all port of pc
# @param handler 
###
list = (handler) -> SerialPort.list ((err, ports) -> handler?(err, ports));true

###
# open a serialport
# @param handler
###
open = (portName, options, handler) -> 
    if isOpen then close()
    port = null
    port = new SerialPort portName, options, (err) -> 
        isOpen = true;handler?(err);true
    true

###
# update options serialport
# @param options
# @param handler
###
update = (options, handler) -> 
    if not isOpen then new throw Error 'PortNotOpen' 
    port.update options handler
    true

###
# send value on serialport
# @param value
# @param handler
###
send = (value, handler) -> 
    if not isOpen then new throw Error 'PortNotOpen' 
    bytes = protocol.toSend value
    port.write bytes, null, (err) -> 
        if err then port.emit 'error', err 
        else handler?(bytes)
    true

###
# close serialport
# @param value
###
close = () -> port.close undefined;isOpen = false;true

###
# Add listener to "data" event
# @param handler
###
onData = (handler) -> 
    port.on 'data', (value) -> 
        value = JSON.parse JSON.stringify value
        resp = protocol.toResponse value.data
        if resp isnt null then handler?(resp)
        true

###
# Add listener to "error" event
# @param handler
###
onError = (handler) -> port.on 'error', handler;true

###
# Add listener to "close" event
# @param handler
###
onClose = (handler) -> port.on 'close', handler;true

module.exports.setProtocol = setProtocol
module.exports.list = list
module.exports.open = open
module.exports.update = update
module.exports.send = send
module.exports.close = close
module.exports.onData = onData
module.exports.onError = onError
module.exports.onClose = onClose
