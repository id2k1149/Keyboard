//
//  DataSource.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/15/22.
//

class DataStore {
    static let shared = DataStore()
    
    let enKeys: [Character] = [
        "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
        "a", "s", "d", "f", "g", "h", "j", "k", "l",
        "z", "x", "c", "v", "b", "n", "m"
    ]
    
    let numbersKeys: [Character] = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
        "-", "/", ":", ";", "(", ")", "$", "&", "@", "\"",
        ".", ",", "?", "!", "'"
    ]
    
    let specialKeys: [Character] = [
        "[", "]", "{", "}", "#", "%", "^", "*", "+", "=",
        "_", "\\", "|", "~", "<", ">", "$", "€", "£", "•",
        ".", ",", "?", "!", "'"
    ]
    
    private init() {}
    
}
