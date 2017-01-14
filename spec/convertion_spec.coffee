convertion = require "../lib/convertion"

describe "Teste la librairie de conversion du module uart\n", () ->
    
    ###
    # Test de la méthode isLittleEndian
    ###
    describe "Changement de d'encodage\n", () -> 
    
        it "isLittleEndian avec true comme paramètre\n", () -> 
            expect(convertion.isLittleEndian true).toBe true
        
        it "isLittleEndian avec 1 comme paramètre\n", () -> 
            expect(convertion.isLittleEndian 1).toBe true
        
        it "isLittleEndian avec false comme paramètre\n", () -> 
            expect(convertion.isLittleEndian false).toBe false
        
        it "isLittleEndian avec 0 comme paramètre\n", () -> 
            expect(convertion.isLittleEndian 0).toBe false
        
        it "isLittleEndian avec null comme paramètre\n", () -> 
            expect(convertion.isLittleEndian null).toBe false
        
        it "isLittleEndian avec undefined comme paramètre\n", () -> 
            expect(convertion.isLittleEndian undefined).toBe false
        
        it "isLittleEndian avec string comme paramètre\n", () -> 
            expect(convertion.isLittleEndian "abc").toBe true
        
        it "isLittleEndian avec objet comme paramètre\n", () -> 
            expect(convertion.isLittleEndian {}).toBe true
        
        it "isLittleEndian avec liste comme paramètre\n", () -> 
            expect(convertion.isLittleEndian []).toBe true
    
    ###
    # Test de la méthode toBytes en littleEndian
    ###
    describe "Conversion d'un nombre en bytes (littleEndian)\n", () -> 
        
        it "Convertion de 22 dans un tableau de 16 bytes\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes 22, 16).toEqual [ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 22000 dans un tableau de 16 bytes\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes 22000, 16).toEqual [ 240, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 22000 dans un tableau de 8 bytes\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes 22000).toEqual [ 240, 85, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion de 220000000000 dans un tableau de 3 bytes\n", () -> 
            convertion.isLittleEndian true
            expect(() -> convertion.toBytes 220000000000, 3).toThrow new Error "IndexOutOfRange"
        
        it "Convertion d'une valeur undefined\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes undefined).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'une valeur null\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes null).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un boolean\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes true).toEqual [ 1, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un string\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes "22000").toEqual [ 240, 85, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un objet vide\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau vide\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    
    ###
    # Test de la méthode toBytes en bigEndian
    ###
    describe "Conversion d'un nombre en bytes (bigEndian)\n", () -> 
        
        it "Convertion de 22 dans un tableau de 16 bytes\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes 22, 16).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ]
        
        it "Convertion de 22000 dans un tableau de 16 bytes\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes 22000, 16).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 240 ]
        
        it "Convertion de 22000 dans un tableau de 8 bytes\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes 22000).toEqual [ 0, 0, 0, 0, 0, 0, 85, 240 ]
            
        it "Convertion de 220000000000 dans un tableau de 3 bytes\n", () -> 
            convertion.isLittleEndian false
            expect(() -> convertion.toBytes 220000000000, 3).toThrow new Error "IndexOutOfRange"
        
        it "Convertion d'une valeur undefined\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes undefined).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'une valeur null\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes null).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un boolean\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes true).toEqual [ 0, 0, 0, 0, 0, 0, 0, 1 ]
        
        it "Convertion d'un string\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes "22000").toEqual [ 0, 0, 0, 0, 0, 0, 85, 240 ]
        
        it "Convertion d'un objet vide\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau vide\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
            
        
    ###
    # Test de la méthode toNumber littleEndian
    ###
    describe "Conversion d'un tableau de bytes en nombre (littleEndian)\n", () -> 
    
        it "Convertion de '[ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] en nombre'\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber [ 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]).toEqual 22
        
        it "Convertion de [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ] en nombre'\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ]).toBeNaN()
        
        it "Convertion d'une valeur undefined\n", () -> 
            convertion.isLittleEndian true
            expect(() -> convertion.toNumber undefined).toThrow new Error 'UndefinedOrNullValue'
        
        it "Convertion d'une valeur null\n", () -> 
            convertion.isLittleEndian true
            expect(() -> convertion.toNumber null).toThrow new Error 'UndefinedOrNullValue'
        
        it "Convertion d'un boolean\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber true).toBeNaN()
        
        it "Convertion d'un string\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber "22000").toBeNaN()
        
        it "Convertion d'un objet vide\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber {}).toBeNaN()
        
        it "Convertion d'un tableau vide\n", () -> 
            convertion.isLittleEndian true
            expect(convertion.toNumber []).toBeNaN()
        
        it "Convertion d'un tableau avec divers valeurs\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber [{}, []]).toBeNaN()
    
    ###
    # Test de la méthode toNumber bigEndian
    ###
    describe "Conversion d'un tableau de bytes en nombre (bigEndian)\n", () -> 
    
        it "Convertion de [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ] en nombre'\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22 ]).toEqual 22
        
        it "Convertion de [ '22', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0' ] en nombre'\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber [ '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '22' ]).toBeNaN()
        
        it "Convertion d'une valeur undefined\n", () -> 
            convertion.isLittleEndian false
            expect(() -> convertion.toNumber undefined).toThrow new Error 'UndefinedOrNullValue'
        
        it "Convertion d'une valeur null\n", () -> 
            convertion.isLittleEndian false
            expect(() -> convertion.toNumber null).toThrow new Error 'UndefinedOrNullValue'
        
        it "Convertion d'un boolean\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber true).toBeNaN()
        
        it "Convertion d'un string\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber "22000").toBeNaN()
        
        it "Convertion d'un objet vide\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber {}).toBeNaN()
        
        it "Convertion d'un tableau vide\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber []).toBeNaN()
        
        it "Convertion d'un tableau avec divers valeurs\n", () -> 
            convertion.isLittleEndian false
            expect(convertion.toNumber [{}, []]).toBeNaN()