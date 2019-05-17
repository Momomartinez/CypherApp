//
//  UnicodeCipherViewController.swift
//  SpyApp
//
//  Created by Monique Martinez on 5/9/19.
//  Copyright © 2019 Monique Martinez. All rights reserved.
//

import UIKit

class UnicodeCipherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
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


}
