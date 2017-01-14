convert = require "../lib/convert"

describe "Teste la librairie de conversion du module uart\n", () ->
    
    ###
    # Teste de la méthode isLittleEndian
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
    # Teste de la méthode toBytes en littleEndian
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
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes true).toEqual [ 1, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes "22000").toEqual [ 240, 85, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un objet\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau\n", () -> 
            convert.isLittleEndian true
            expect(convert.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    
    ###
    # Teste de la méthode toBytes en bigEndian
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
        
        it "Convertion d'un boolean\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes true).toEqual [ 0, 0, 0, 0, 0, 0, 0, 1 ]
        
        it "Convertion d'un string\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes "22000").toEqual [ 0, 0, 0, 0, 0, 0, 85, 240 ]
        
        it "Convertion d'un objet\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes {}).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]
        
        it "Convertion d'un tableau\n", () -> 
            convert.isLittleEndian false
            expect(convert.toBytes []).toEqual [ 0, 0, 0, 0, 0, 0, 0, 0 ]