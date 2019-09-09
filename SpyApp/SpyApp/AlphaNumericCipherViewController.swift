//
//  AlphaNumericCipherViewController.swift
//  SpyApp
//
//  Created by Monique Martinez on 5/9/19.
//  Copyright © 2019 Monique Martinez. All rights reserved.
//

import UIKit

class AlphaNumericCipherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var cipherAlpha: CipherProtocol = AlphanumericCesarCipher()
    //************************* Beginning of AlphanumericCesarCipher Struct *************************//
    struct AlphanumericCesarCipher: CipherProtocol {
        
        //************************* Beginning of Encrypt Method *************************//
        func encrypt(plaintext: String, secret: String) -> String {
            guard let secret = UInt32(secret) else{
                return "error"
            }
            var encoded: String = ""
            let upperCasePlaintext = plaintext.uppercased()
            for letter in upperCasePlaintext {
                //print(letter)
                
                //stores the letters index by calling the findIndex function, and passing in the current letter
                let find = findIndex(c: letter)
                //stores the number to shift the input or plaintext by calling the shift function
                let move = shift(sec: secret, idx: find, isEncrypt: true)
                // print(move)
                
                
                
                
                //we take our empty string declared in encoded and use the append function to pass in the move varible that
                // that holds the shifted variable from the latin unicode and add it to the string encoded.
                encoded.append(move)
                
            }
            return encoded
        }
        //************************* End of Encrypt Method ******************************//
        
        //************************* Beginning of Decrypt Method ***********************//
        func decrypt(output: String, secret: String) -> String {
            guard let secret = UInt32(secret) else{
                return "error"
            }
            var decrypted: String = ""
            let upperCasePlaintext = output.uppercased()
            for letter in upperCasePlaintext {
                print(letter)
                let find = findIndex(c: letter)
                let move = shift(sec: secret, idx: find, isEncrypt: false)
                print(move)
                decrypted.append(move)
                
            }
            return decrypted
        }
        
        //************************* End of Decrypt Method *************************//
        
        //************************* Beginning of findIndex Method ******************************//
        let alpha: [Character] = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        func findIndex(c : Character ) -> UInt32 {
            var idx : Int = -1
            
            for v in alpha {
                idx = idx + 1
                if c == v {
                    
                    break
                }
            }
            return UInt32(idx)
            
        }
        //************************* End of findIndex Method ************************************//
        
        //************************* Beginning of shift Method ******************************//
        func shift(sec : UInt32, idx: UInt32, isEncrypt: Bool) -> Character {
            if isEncrypt == true {
                var shift_idx = idx + sec
                shift_idx = shift_idx %  UInt32(alpha.count)
                return alpha[Int(shift_idx)]
            }
            if isEncrypt == false {
                var shift_idx = idx - sec
                shift_idx = shift_idx %  UInt32(alpha.count)
                return alpha[Int(shift_idx)]
            }else{
                return " "
            }
        }
        
        
    }


}
