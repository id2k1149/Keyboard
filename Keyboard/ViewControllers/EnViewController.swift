//
//  USCapsViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class EnViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    @IBOutlet var keyboard: UIView!
    @IBOutlet var shiftButton: UIButton!
    
    @IBOutlet var enKeysCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    let keys: [Character] = Keys.shared.enKeys
    var currentText: String = TextField.shared.currentText
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to disable iOS/MacOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        enKeysCollection.forEach {
            $0.layer.cornerRadius = 5
            guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
            $0.setTitle(String(keys[keyIndex]).uppercased(), for: .normal)
        }
        
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let numbersVC = navigationVC.topViewController as? NumbersViewController else { return }
        
        numbersVC.currentText = currentText
    }
    
    @IBAction func keyButtonTaped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
        currentText = textField.text
        
        enKeysCollection.forEach {
            guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
            $0.setTitle(String(keys[keyIndex]), for: .normal)
        }
        
        guard let shiftImage = UIImage(systemName: "shift") else { return }
        shiftButton.setImage(
            shiftImage,
            for: .normal)
    }
    
    @IBAction func spaceButtonTapped() {
        textField.text += " "
        currentText = textField.text
    }
    
    @IBAction func deleteButtonTapped() {
        textField.text.remove(at: textField.text.index(before: textField.text.endIndex))
        currentText = textField.text
    }
    
    @IBAction func shiftButtonTapped() {
        guard let currentShiftImage = shiftButton.currentImage else { return }
        guard let shiftFillImage = UIImage(systemName: "shift.fill") else { return }
        
        switch currentShiftImage.isEqual(shiftFillImage) {
            
        case true:
            guard let shiftImage = UIImage(systemName: "shift") else { return }
            shiftButton.setImage(shiftImage, for: .normal)
            enKeysCollection.forEach {
                guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
                $0.setTitle(
                    String(keys[keyIndex]),
                    for: .normal)
            }
            
        case false:
            guard let shiftImage = UIImage(systemName: "shift.fill") else { return }
            shiftButton.setImage(shiftImage, for: .normal)
            enKeysCollection.forEach {
                guard let keyIndex = enKeysCollection.firstIndex(of: $0) else { return }
                $0.setTitle(
                    String(keys[keyIndex]).uppercased(),
                    for: .normal)
            }
        }
    }
    
    @IBAction func returnButtonTapped() {
        textField.text += "\n"
        currentText = textField.text
    }
    
    @IBAction func numbersButtonTapped() {
        performSegue(withIdentifier: "numbersNavController",
                     sender: nil)
    }
    
    @IBAction func globeButtonTapped() {
        performSegue(withIdentifier: "ruNavController",
                     sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let numbersVC = segue.source as? NumbersViewController else { return }
        textField.text = numbersVC.currentText
    }
}
