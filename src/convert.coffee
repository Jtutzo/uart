###
# Global varible for encoding to littleEndian
###
littleEndian = true

###
# Update encoding/decoding convertion
# @param value
###
isLittleEndian = (value) -> littleEndian = if value then true else false

###
# Convert number to bytes array
# @param num
# @param syze (array)
# @return array
# @exception Illegal syze
###
toBytes = (num, syze) -> if littleEndian then toBytesLittleEndian num, syze else toBytesBigEndian num, syze

###
# Convert bytes array to number
# @param bytes array
# @return number
###
toNum = (bytes) -> if littleEndian then toNumLittleEndian bytes else toNumBigEndian bytes

###
# Convert number to bytes array (encoding to littleEndian)
# @param num
# @param syze (array)
# @return array
# @exception Illegal syze
###
toBytesLittleEndian = (num, syze) -> 
    bytes = [];
    i = if syze and typeof syze is 'number' then syze else 8
    j = i-1;
    loop 
        bytes[j-(--i)] = num & 255;num = num>>8;if not i then break
    if num isnt 0 then throw new Error "Illegal syze."
    bytes

###
# Convert number to bytes array (encoding to bigEndian)
# @param num
# @param syze (array)
# @return array
# @exception Illegal syze
###
toBytesBigEndian = (num, syze) -> 
    bytes = [];
    i = if syze and typeof syze is 'number' then syze else 8
    loop 
        bytes[--i] = num & 255;num = num>>8;if not i then break
    if num isnt 0 then throw new Error "Illegal syze."
    bytes


###
# Convert bytes array to number (decoding to littleEndian)
# @param bytes array
# @return number
###
toNumLittleEndian = (bytes) -> 
    val = 0
    i = bytes.length-1
    loop
        --i;if i > 0 then val = val << 8;if i >= 0 then break
    val

###
# Convert bytes array to number (decoding to bigEndian)
# @param bytes array
# @return number
###
toNumBigEndian = (bytes) -> 
    val = 0
    for byte, i in bytes
        if i > bytes.length-1 then val = val << 8
    val
        
module.exports.isLittleEndian = isLittleEndian
module.exports.toBytes = toBytes
module.exports.toNum = toNum