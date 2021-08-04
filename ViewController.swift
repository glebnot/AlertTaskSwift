//
//  ViewController.swift
//  AlertLearning
//
//  Created by Компьютер on 28.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let nameAlert = UIAlertController(title: "Enter your name".localized(), message: "Name:".localized(), preferredStyle: .alert)
        let nameOK = UIAlertAction(title: "OK".localized(), style: .cancel) {_ in
            let name = nameAlert.textFields?.first
            self.userNameLabel.text! += (name?.text ?? "Anonymous".localized()) + "!"

        }
        nameAlert.addTextField {(textField) in
            
        }
        nameAlert.addAction(nameOK)
        present(nameAlert, animated: true)
    }

    @IBAction func addTwoNumbersButton(_ sender: Any) {
        let nameAlert = UIAlertController(title: "Enter your two numbers".localized(), message: "Numbers:".localized(), preferredStyle: .alert)
        let nameOK = UIAlertAction(title: "OK".localized(), style: .cancel) {_ in
            let name = nameAlert.textFields
            var sum = 0
            for name in name! {
                sum += Int(name.text ?? "0") ?? 0
                
            }
            self.infoAlert(title: "The sum is".localized(), output: sum)
            
        }
        for _ in 0...1 {
        nameAlert.addTextField {(textField) in

        }
        }
        nameAlert.addAction(nameOK)
        present(nameAlert, animated: true)
  
    }
    
    @IBAction func guessingGameButton(_ sender: Any) {
        let lowerBorderGame = 1
        let higherBorderGame = 2
        let nameAlert = UIAlertController(title: ("Guess the number from ".localized() + "\(lowerBorderGame)" + " to ".localized() + " \(higherBorderGame)"), message: "", preferredStyle: .actionSheet)
        var numberButton: [UIAlertAction] = []
        var guessedNumber: Int = 0
        for i in lowerBorderGame...higherBorderGame {
            numberButton.append(UIAlertAction(title: "\(i)", style: .default){ _ in
                guessedNumber = Int.random(in: lowerBorderGame...higherBorderGame)
                if (guessedNumber == i) {
                    self.infoAlert(title: "You guessed it!".localized(), output: ("The number indeed was ".localized() + "\(guessedNumber)"))
                } else {
                    self.infoAlert(title: "You didn't guess it!".localized(), output: ("The number was".localized() + "\(guessedNumber)"))
                }
                
            })
            nameAlert.addAction(numberButton[i-1])
            }
        present(nameAlert, animated: true)
        }
    
    func infoAlert<Output> (title: String, output: Output){
        let nameAlert = UIAlertController(title: "\(title) \(output)", message: "", preferredStyle: .alert)
        let nameOK = UIAlertAction(title: "OK", style: .cancel) {_ in
   
        }
       
        nameAlert.addAction(nameOK)
        present(nameAlert, animated: true)
    }
    
}
extension String {
    func localized() -> String {
        
        return NSLocalizedString(self,
                            tableName:"Localizable",
                            bundle: .main,
                            value: self,
                            comment: self)
    }
}
