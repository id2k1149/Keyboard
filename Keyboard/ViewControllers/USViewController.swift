//
//  USCapsViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class USViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    @IBOutlet var keyboard: UIView!
    @IBOutlet var shiftButton: UIButton!
    
    @IBOutlet var usKeysCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    let keys: [Character] = USKeys().usKeys
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to hide iOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        usKeysCollection.forEach {
            $0.layer.cornerRadius = 5
            guard let keyIndex = usKeysCollection.firstIndex(of: $0) else {return}
            $0.setTitle(String(keys[keyIndex]).uppercased(), for: .normal)
        }
        
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
        
    }
    
    @IBAction func keyButtonTaped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
        usKeysCollection.forEach {
            guard let keyIndex = usKeysCollection.firstIndex(of: $0) else {return}
            $0.setTitle(String(keys[keyIndex]), for: .normal)
        }
        guard let shiftImage = UIImage(systemName: "shift") else {return}
        shiftButton.setImage(
            shiftImage,
            for: .normal)
    }
    
    @IBAction func spaceButtonTapped() {
        textField.text += " "
    }
    
    @IBAction func deleteButtonTapped() {
        textField.text.remove(at: textField.text.index(before: textField.text.endIndex))
//        print(textField.text ?? "N/A")
    }
    
    
    @IBAction func shiftButtonTapped() {
        
        
        usKeysCollection.forEach {
            guard let keyIndex = usKeysCollection.firstIndex(of: $0) else {return}
            $0.setTitle(
                String(keys[keyIndex]).uppercased(),
                        for: .normal)
        }
        
        guard let shiftImage = UIImage(systemName: "shift") else {return}
        shiftButton.setImage(
            shiftImage,
            for: .normal)
        
    }
    
}

// MARK: - extension
extension USViewController {
    private func drawLayout() {
        
    }
}
