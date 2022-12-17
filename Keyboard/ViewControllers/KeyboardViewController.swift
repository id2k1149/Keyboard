//
//  EnViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/17/22.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet var textField: UITextView!
    @IBOutlet var enStackView: UIStackView!
    @IBOutlet var numbersStackView: UIStackView!
    @IBOutlet var symbolsStackView: UIStackView!
    @IBOutlet var oneAndTwoStringStackView: UIStackView!
    @IBOutlet var ruStackView: UIStackView!
    
    
    @IBOutlet var ruButtenColection: [UIButton]!
    @IBOutlet var enButtenColection: [UIButton]!
    @IBOutlet var numbersKeysCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
  
    @IBOutlet var shiftButten: UIButton!
    @IBOutlet var symbolsButton: UIButton!
    
    
    
    //    // MARK: variables and constants

    
    
    
    // MARK: override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeysCollectionCorners(collection: ruButtenColection)
        setupKeysCollectionCorners(collection: enButtenColection)
        setupKeysCollectionCorners(collection: iconsCollection)
        setupKeysCollectionCorners(collection: numbersKeysCollection)
        updateUI()
    }

    
    // MARK: IBAction
    @IBAction func keyButtonTaped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
       lowRegister()
    }
    
    
    @IBAction func spaceButtonTapped() {
        textField.text += " "
    }
    
    
    @IBAction func deleteButtonTapped() {
        if !textField.text.isEmpty {
            textField.text.removeLast()
        } else {
            return
        }
    }
    
    
    @IBAction func shiftButtonTapped() {
       settingRegister()
    }
    
    
    @IBAction func returnButtonTapped() {
        textField.text += "\n"
    }
    
    
    @IBAction func numbersButtonTapped() {
        numbersStackView.isHidden = false
        oneAndTwoStringStackView.isHidden = false
        symbolsStackView.isHidden = true
        enStackView.isHidden = true
        ruStackView.isHidden = true
        
        setupKeysCollectionCorners(collection: numbersKeysCollection)
    }
    
    
    @IBAction func symbolsButtonTapped() {
        oneAndTwoStringStackView.isHidden = true
        symbolsStackView.isHidden = false
        
        guard let currentSymbolsButtonTitle = symbolsButton.currentTitle else { return }
        
        switch currentSymbolsButtonTitle {
        case "#+=":
            symbolsButton.setTitle("123", for: .normal)
            oneAndTwoStringStackView.isHidden = true
            symbolsStackView.isHidden = false
        default:
            symbolsButton.setTitle("#+=", for: .normal)
            oneAndTwoStringStackView.isHidden = false
            symbolsStackView.isHidden = true
        }
    }
    
    
    @IBAction func abcButtonTapped() {
        enStackView.isHidden = false
        numbersStackView.isHidden = true
        ruStackView.isHidden = true
    }
    
    
    @IBAction func globeButtonTapped() {
        if ruStackView.isHidden == false {
            numbersStackView.isHidden = true
            ruStackView.isHidden = true
            enStackView.isHidden = false
        } else {
            enStackView.isHidden = true
            ruStackView.isHidden = false
            numbersStackView.isHidden = true
        }
    }
    
    
    // MARK: private methods
    private func setupKeysCollectionCorners(collection: [UIButton]) {
        collection.forEach {
            $0.layer.cornerRadius = 5
        }
    }
}


// MARK: - Private Methods
extension KeyboardViewController {
    private func updateUI() {
        textField.inputView = UIView()
        textField.layer.cornerRadius = 10
        ruStackView.isHidden = false
        enStackView.isHidden = true
        numbersStackView.isHidden = true
    }
    
    private func lowRegister() {
        shiftButten.setImage(UIImage(systemName: "shift"), for: .normal)
        enButtenColection.forEach { button in
            button.setTitle(button.titleLabel?.text?.lowercased(), for: .normal)
        }
        ruButtenColection.forEach { button in
            button.setTitle(button.titleLabel?.text?.lowercased(), for: .normal)
        }
        }
    
    private func highRegister() {
        shiftButten.setImage(UIImage(systemName: "shift.fill"), for: .normal)
        enButtenColection.forEach { button in
            button.setTitle(button.titleLabel?.text?.uppercased(), for: .normal)
        }
        ruButtenColection.forEach { button in
            button.setTitle(button.titleLabel?.text?.uppercased(), for: .normal)
        }
        }
    
    private func settingRegister() {
        
        let currentShiftImage = shiftButten.currentImage
        let shiftFillImage = UIImage(systemName: "shift.fill")
        
        if currentShiftImage == shiftFillImage {
            lowRegister()
        } else {
            highRegister()
        }
    }
    }


