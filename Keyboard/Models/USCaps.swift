//
//  USCaps.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

struct USCaps {
    let keys: [Character]
    
    func getKeys() -> [Character] {
        DataStore.getKeysForCapsUS()
    }
}
