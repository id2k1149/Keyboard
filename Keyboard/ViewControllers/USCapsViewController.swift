//
//  USCapsViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class USCapsViewController: UIViewController {

    @IBOutlet var textField: UIView!
    @IBOutlet var keyboard: UIView!
    
    @IBOutlet var usCapsCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    let keys: [Character] = DataStore.getKeysForCapsUS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        keys.forEach {
            print($0)
            let index = keys.firstIndex(of: $0)
            print(index as Any)
        }
        
        usCapsCollection.forEach {
            $0.layer.cornerRadius = 5
            guard let keyIndex = usCapsCollection.firstIndex(of: $0) else {return}
           
            $0.setTitle(String(keys[keyIndex]), for: .normal)
            
            
        }
        
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
    
    }
    
}

// MARK: - extension
extension USCapsViewController {
    private func drawLayout() {
        
    }
}
