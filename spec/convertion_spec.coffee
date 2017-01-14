convert = require "../lib/convert"

describe "Teste la librairie de conversion du module uart\n", () ->
    
    ###
    # Test de la méthode isLittleEndian
    ###
    describe "Changement de d'encodage\n", () -> 
    
        it "Encodage littleEndian 1\n", () -> 
            expect(convert.isLittleEndian true).toBe true
        
        it "Encodage littleEndian 2\n", () -> 
            expect(convert.isLittleEndian 1).toBe true
        
        it "Encodage bigEndian 1\n", () -> 
            expect(convert.isLittleEndian false).toBe false
        
        it "Encodage bigEndian 2\n", () -> 
            expect(convert.isLittleEndian 0).toBe false
        
        it "Encodage bigEndian 3\n", () -> 
            expect(convert.isLittleEndian null).toBe false
        
        it "Encodage bigEndian 4\n", () -> 
            expect(convert.isLittleEndian undefined).toBe false
    
    ###
    # Test de la méthode toBytes en littleEndian
    ###
    describe "Conversion d'un nombre en bytes (littleEndian)\n", () -> 
        
        it "Convertion de 22 dans un tableau de 16 bytes\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes 22, 16).toEqual [ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 22000 dans un tableau de 16 bytes\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes 22000, 16).toEqual [ 240, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 22000 dans un tableau de 8 bytes\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes 22000).toEqual [ 240, 85, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 220000000000 dans un tableau de 3 bytes\n", () -> 
            convert.isLittleEndian true
            expect(() -> convert.toBytes 220000000000, 3).toThrow new Error "Illegal syze."
        
        it "Convertion d'une valeur undefined\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes undefined).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'une valeur null\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes null).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes true).toEqual [ 1, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes "22000").toEqual [ 240, 85, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un objet vide\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau vide\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    
    ###
    # Test de la méthode toBytes en bigEndian
    ###
    describe "Conversion d'un nombre en bytes (bigEndian)\n", () -> 
        
        it "Convertion de 22 dans un tableau de 16 bytes\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes 22, 16).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ]
        
        it "Convertion de 22000 dans un tableau de 16 bytes\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes 22000, 16).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 240 ]
        
        it "Convertion de 22000 dans un tableau de 8 bytes\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes 22000).toEqual [ 0, 0, 0, 0, 0, 0, 85, 240 ]
            
        it "Convertion de 220000000000 dans un tableau de 3 bytes\n", () -> 
            convert.isLittleEndian false
            expect(() -> convert.toBytes 220000000000, 3).toThrow new Error "Illegal syze."
        
        it "Convertion d'une valeur undefined\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes undefined).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'une valeur null\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes null).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes true).toEqual [ 0, 0, 0, 0, 0, 0, 0, 1 ]
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes "22000").toEqual [ 0, 0, 0, 0, 0, 0, 85, 240 ]
        
        it "Convertion d'un objet vide\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau vide\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
            
        
    ###
    # Test de la méthode toNumber littleEndian
    ###
    describe "Conversion d'un tableau de bytes en nombre (littleEndian)\n", () -> 
    
        it "Convertion de '[ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] en nombre'\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber [ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]).toEqual 22
        
        it "Convertion de [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ] en nombre'\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ]).toBeNaN()
        
        it "Convertion d'une valeur undefined\n", () -> 
            convert.isLittleEndian true
            expect(() -> convert.toNumber undefined).toThrow()
        
        it "Convertion d'une valeur null\n", () -> 
            convert.isLittleEndian true
            expect(() -> convert.toNumber null).toThrow()
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber true).toBeNaN()
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber "22000").toBeNaN()
        
        it "Convertion d'un objet vide\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber {}).toBeNaN()
        
        it "Convertion d'un tableau vide\n", () -> 
            convert.isLittleEndian true
            expect(convert.toNumber []).toBeNaN()
        
        it "Convertion d'un tableau avec divers valeurs\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber [{}, []]).toBeNaN()
    
    ###
    # Test de la méthode toNumber bigEndian
    ###
    describe "Conversion d'un tableau de bytes en nombre (bigEndian)\n", () -> 
    
        it "Convertion de [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ] en nombre'\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ]).toEqual 22
        
        it "Convertion de [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ] en nombre'\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber [ '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '22' ]).toBeNaN()
        
        it "Convertion d'une valeur undefined\n", () -> 
            convert.isLittleEndian false
            expect(() -> convert.toNumber undefined).toThrow()
        
        it "Convertion d'une valeur null\n", () -> 
            convert.isLittleEndian false
            expect(() -> convert.toNumber null).toThrow()
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber true).toBeNaN()
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber "22000").toBeNaN()
        
        it "Convertion d'un objet vide\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber {}).toBeNaN()
        
        it "Convertion d'un tableau vide\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber []).toBeNaN()
        
        it "Convertion d'un tableau avec divers valeurs\n", () -> 
            convert.isLittleEndian false
            expect(convert.toNumber [{}, []]).toBeNaN()