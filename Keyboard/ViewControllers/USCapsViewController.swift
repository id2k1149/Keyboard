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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        usCapsCollection.forEach {
            $0.layer.cornerRadius = 5
        }
        
        iconsCollection.forEach {
            $0.tintColor = .black
        }
        
        
        

       
    }
    

   

}
