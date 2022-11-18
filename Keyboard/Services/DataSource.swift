//
//  DataSource.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/15/22.
//

struct DataStore {
    let layout: [Character]
    
}

extension DataStore {
    
    static func getKeysForUSLayout() -> [Character] {
        [
            "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
            "a", "s", "d", "f", "g", "h", "j", "k", "l",
            "z", "x", "c", "v", "b", "n", "m"
        ]
    }
    
    static func getKeysForNumberLayout() -> [Character] {
        [
            "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
            "-", "/", ":", ";", "(", ")", "$", "&", "@", "*",
            ".", ",", "?", "!", "'"
        ]
    }
}

