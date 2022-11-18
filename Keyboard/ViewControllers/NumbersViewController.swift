//
//  NumbersViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/18/22.
//

import UIKit

class NumbersViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    @IBOutlet var keyboard: UIView!
    
    @IBOutlet var numbersCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    let numbers = Keys().numbersKeys
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to hide iOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        numbersCollection.forEach {
            $0.layer.cornerRadius = 5
            guard let keyIndex = numbersCollection.firstIndex(of: $0) else {return}
            $0.setTitle(String(numbers[keyIndex]),
                        for: .normal)
        }
        
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
    }
}
