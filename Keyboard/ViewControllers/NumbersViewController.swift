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
    var currentText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(currentText ?? "current text = N/A")
        
        // to hide iOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        textField.text = currentText
        
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
    
    @IBAction func keyButtonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
        currentText = textField.text
        print(currentText ?? "N/A")
    }
    
    @IBAction func spaceButtonTapped() {
        textField.text += " "
        currentText = textField.text
    }
    
    @IBAction func deleteButtonTapped() {
        textField.text.remove(at: textField.text.index(before: textField.text.endIndex))
        currentText = textField.text
    }
    
    @IBAction func returnButtonTapped() {
        textField.text += "\n"
        currentText = textField.text
    }
    
}
