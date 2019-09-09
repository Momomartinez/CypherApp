//
//  CeasarCipherViewController.swift
//  SpyApp
//
//  Created by Monique Martinez on 5/9/19.
//  Copyright © 2019 Monique Martinez. All rights reserved.
//

import UIKit

class CeasarCipherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
     var cipherCeasar: CipherProtocol = CeaserCipher()
    
    struct CeaserCipher: CipherProtocol{
        
        //************************* Beginning of Encrypt Method *************************//
        func encrypt (plaintext: String, secret: String) -> String {
            guard let secretInt = UInt32(secret) else {
                return "error"
            }
            var encoded = ""
            for character in plaintext {
                guard let firstUnicodeScalar = character.unicodeScalars.first else{
                    continue
                }
                
                let unicode = firstUnicodeScalar.value
                let shiftedUnicode = unicode + secretInt
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                
                encoded += shiftedCharacter
            }
            return encoded
            
        }
        
        func decrypt (output: String, secret: String) -> String {
            guard let secretInt = UInt32(secret) else {
                return "error"
            }
            var decrypted = ""
            for character in output {
                guard let firstUnicodeScalar = character.unicodeScalars.first else {
                    continue
                }
                
                let unicode = firstUnicodeScalar.value
                let shiftedUnicode = unicode - secretInt
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode))) //what does this line mean
                
                decrypted += shiftedCharacter
            }
            return decrypted
        }
    }
   
    

}
