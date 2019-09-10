import UIKit
import Foundation


//this is the model for ceasar cipher, where all logic will be
protocol CipherProtocol {
    func encrypt (plaintext: String, secret: String) -> String
    func decrypt (output: String, secret: String) -> String
    }



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


class ViewController: UIViewController {
    //the ! means we are dealing with an optional
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var encryptOutput: UILabel!
    @IBOutlet weak var decryptOutput: UILabel!
    
    var cipherCeasar: CipherProtocol = CeaserCipher()
    
    var ciphers: [String: CipherProtocol] = [
        "CeaserCipher": CeaserCipher()
    ]

    @IBAction func encryptButtonPressed(_ sender: Any){
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text else {
                
                encryptOutput.text = "no values provided"
                return
        }
     
        
            encryptOutput.text = cipherCeasar.encrypt(plaintext: plaintext, secret: secretString)
        
    }
   
    @IBAction func decrpytButtonPressed(_ sender: Any) {
        guard let EncryptedOutput = encryptOutput.text,
              let secret = secretField.text else {
            
                  decryptOutput.text = "error"
                  return
        }
            decryptOutput.text = cipherCeasar.decrypt(output: EncryptedOutput, secret: secret)
    }
}



