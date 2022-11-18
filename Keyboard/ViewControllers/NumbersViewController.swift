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
    
    
    
    
    let numbers = Keys().numbersKeys
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to hide iOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        
    }

        

}
