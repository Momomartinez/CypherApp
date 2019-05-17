import UIKit
import Foundation

//************************* Beginning of Protocol class?? *************************//
//this is the model for ceasar cipher, where all logic will be
protocol CipherProtocol {
    func encrypt (plaintext: String, secret: String) -> String
    func decrypt (output: String, secret: String) -> String
    }
//***************************** End of Protocol class?? ***************************//


struct EmojiCipher: CipherProtocol{
    let alpha: [Character] = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let latinUnicode: [Character] = ["😀", "😅", "😉", "😇", "🥰", "😜", "😴", "🤢", "🥶", "🤯", "🥴", "😷", "💩", "😍", "😊", "🤥", "😂", "😬", "😘", "🙄", "🤮", "🥵", "😵", "🤕", "🤓", "😎"]
    
    func decrypt(output: String, secret: String) -> String {
        guard let secret = Int(secret) else {
            return "error"
        }
        var index = 0
        var decoded = " "
        var t = 0
        
        for (_, v) in output.enumerated() {
            for (x, l) in alpha.enumerated() {
                for (i, c) in latinUnicode.enumerated() {
                    if v == c {
                        
                        index = i
                        index = index - secret
                        
                        if index < 0 {
                            t = 26 + index
                            if t == x {
                                decoded.append(l)
                            }
                        }else{
                            if index == x {
                                decoded.append(l)
                            }
                        }
                        //print("",  "\(l)", separator: "", terminator: " ")
                    }
                }
            }
        }
        
        return decoded
        
    }
    
    
    
    
    
    func encrypt(plaintext: String, secret: String) -> String {
        guard let secret = UInt32(secret) else {
            return "error"
        }
        
        
        var index: UInt32 = 0
        var encoded = " "
        
        let upperCasePlaintext = plaintext.uppercased()
        
        for (_, v) in upperCasePlaintext.enumerated() {
            for (x, l) in alpha.enumerated() {
                for (i, c) in latinUnicode.enumerated() {
                    if v == l {
                        index = UInt32(x)
                        index = index + secret
                        let idx = Int(index)  % alpha.count
                        //print(index)
                        //print("\(x), \(l)" )
                        if idx == i {
                            encoded.append(c)
                            print("",  "\(c)", separator: "", terminator: " ")
                        }
                    }
                }
            }
        }
        
        return encoded
        //let find = findIndex(c: letter, idx: idx)
        
    }
    
}














struct UnicodeCipher: CipherProtocol{
    let alpha: [Character] = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let latinUnicode: [Character] = ["Ξ", "Ο", "Π", "Ρ", "΢", "Σ", "Τ", "Υ", "Φ", "Χ", "Ψ", "Ω", "Ϊ",
                                     "Ϋ", "ά", "έ", "ή", "ί", "ΰ", "α", "β", "γ", "δ", "ε", "ζ", "η"]

    func decrypt(output: String, secret: String) -> String {
        guard let secret = Int(secret) else {
            return "error"
        }
        var index = 0
        var decoded = " "
        var t = 0
        
        for (_, v) in output.enumerated() {
            for (x, l) in alpha.enumerated() {
                for (i, c) in latinUnicode.enumerated() {
                    if v == c {
                    
                        index = i
                        index = index - secret
                    
                        if index < 0 {
                            t = 26 + index
                            if t == x {
                                decoded.append(l)
                            }
                        }else{
                        if index == x {
                            decoded.append(l)
                            }
                        }
                        //print("",  "\(l)", separator: "", terminator: " ")
                    }
                }
            }
        }
        
        return decoded
        
    }
    
    
    
    
    
    func encrypt(plaintext: String, secret: String) -> String {
        guard let secret = UInt32(secret) else {
            return "error"
        }
        
        
        var index: UInt32 = 0
        var encoded = " "
        
        let upperCasePlaintext = plaintext.uppercased()
        
        for (_, v) in upperCasePlaintext.enumerated() {
            for (x, l) in alpha.enumerated() {
                for (i, c) in latinUnicode.enumerated() {
                    if v == l {
                        index = UInt32(x)
                        index = index + secret
                        let idx = Int(index)  % alpha.count
                        //print(index)
                        //print("\(x), \(l)" )
                        if idx == i {
                            encoded.append(c)
                            print("",  "\(c)", separator: "", terminator: " ")
                        }
                    }
                }
            }
        }
        
        return encoded
        //let find = findIndex(c: letter, idx: idx)
        
    }
    
}



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
    var cipherAlpha: CipherProtocol = AlphanumericCesarCipher()
    var cipherUnicode: CipherProtocol = UnicodeCipher()
    var cipherEmoji: CipherProtocol = EmojiCipher()
    
    var ciphers: [String: CipherProtocol] = [
        "CeaserCipher": CeaserCipher(),
        "AlphanumericCesarCipher": AlphanumericCesarCipher(),
        "UnicodeCipher": UnicodeCipher(),
        "EmojiCipher": EmojiCipher()
        //add more ciphers
    ]

    @IBAction func encryptButtonPressed(_ sender: Any) {
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
    
    //************************* cipherSelect function ******************************//
    //This invkoes the specific cipher selected according to the buttons name
    @IBAction func cipherSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else{
        return
    }
        guard let selectedCipher = ciphers[buttonTitle] else{
            return
        }
        //print(selectedCipher)
        cipherCeasar = selectedCipher
        
}

        }



