//
//  NumbersViewController.swift
//  Keyboard
//
//  Created by Max Franz Immelmann on 11/18/22.
//

import UIKit

class NumbersViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet var textField: UITextView!
    @IBOutlet var keyboard: UIView!
    @IBOutlet var symbolsButton: UIButton!
    
    @IBOutlet var numbersCollection: [UIButton]!
    @IBOutlet var iconsCollection: [UIButton]!
    
    // MARK: variables and constants
    let numbers = Keys.shared.numbersKeys
    let symbols = Keys.shared.symbolsKeys
    var currentText: String!
    
    // MARK: override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to disable iOS keyboard
        textField.inputView = UIView()
        
        textField.layer.cornerRadius = 10
        keyboard.layer.cornerRadius = 10
        
        textField.text = currentText
        
        setupKeysCollectionCorners()
        setupKeysCollectionTitles(for: numbers)
        setupIconsCollection()
    }
    
    // to set focus on TextField
    override func viewDidAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    /* segue for RuViewController
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let ruKeysVC = navigationVC.topViewController as? RuViewController else { return }

        numbersVC.currentText = currentText
    }
     */
    
    // MARK: IBAction
    @IBAction func keyButtonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {return}
        textField.text += buttonTitle
        currentText = textField.text
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
    
    @IBAction func globeButtonTapped() {
        performSegue(withIdentifier: "ruNavController", sender: nil)
    }
    
    @IBAction func symbolsButtonTapped() {
        guard let currentSymbolsButtonTitle = symbolsButton.currentTitle else { return }
        
        switch currentSymbolsButtonTitle {

        case "#+=":
            symbolsButton.setTitle("123", for: .normal)
            setupKeysCollectionTitles(for: symbols)

        default:
            symbolsButton.setTitle("#+=", for: .normal)
            setupKeysCollectionTitles(for: numbers)
        }
        
        symbolsButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    // MARK: private methods
    private func setupKeysCollectionCorners() {
        numbersCollection.forEach {
            $0.layer.cornerRadius = 5
        }
    }
    
    private func setupKeysCollectionTitles(for keys: [Character]) {
        numbersCollection.forEach {
            guard let keyIndex = numbersCollection.firstIndex(of: $0) else {return}
            $0.setTitle(String(keys[keyIndex]),
                        for: .normal)
        }
    }
    
    private func setupIconsCollection() {
        iconsCollection.forEach {
            $0.layer.cornerRadius = 5
            $0.tintColor = .black
        }
    }
}
