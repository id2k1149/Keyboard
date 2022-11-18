//
//  USCapsViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class USCapsViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    @IBOutlet var keyboard: UIView!
    
    @IBOutlet var usCapsCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    let keys: [Character] = USKeys().usKeys
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        
//        keys.forEach {
//            let index = keys.firstIndex(of: $0)
//        }
        
        usCapsCollection.forEach {
            $0.layer.cornerRadius = 5
            guard let keyIndex = usCapsCollection.firstIndex(of: $0) else {return}
           
            $0.setTitle(String(keys[keyIndex]).uppercased(), for: .normal)
        }
        
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
        
    }
    
    
    @IBAction func keyButtonTaped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        print(buttonTitle, type(of: buttonTitle))
        guard let currentText = textField.text else {return}
        print(currentText)
        textField.text += buttonTitle
        
//        guard textField.text != nil else {return}
//        print(text)
//        textField.text = buttonTitle
    }
    
}

// MARK: - extension
extension USCapsViewController {
    private func drawLayout() {
        
    }
}
