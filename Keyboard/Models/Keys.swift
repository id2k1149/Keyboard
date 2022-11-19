//
//  USCaps.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

// singleton
class Keys {
    static var shared = Keys()
    
    let enKeys  = DataStore.shared.enKeys
    let numbersKeys = DataStore.shared.numbersKeys
    
    private init() {}
}
