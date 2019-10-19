//
//  ViewController.swift
//  DiceRandomGenerator
//
//  Created by Rogerio on 10/17/19.
//  Copyright © 2019 Rogerio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultRolling: UILabel!
    @IBOutlet weak var numberOfDices: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tap anywhere in the screen to hide the keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    /*
     when buttons are pressed on screen
     */
    @IBAction func rollingD6(_ sender: Any) { rollingXdice(dice: 6) }
    
    @IBAction func rollingD4(_ sender: Any) { rollingXdice(dice: 4) }
    
    @IBAction func rollingD8(_ sender: Any) { rollingXdice(dice: 8) }
    
    @IBAction func rollingD10(_ sender: Any) { rollingXdice(dice: 10) }
    
    @IBAction func rollingD12(_ sender: Any) { rollingXdice(dice: 12) }
    
    @IBAction func rollingD20(_ sender: Any) { rollingXdice(dice: 20) }
    
    @IBAction func rollingD100(_ sender: Any) { rollingXdice(dice: 100) }
    
    
    /*
     randomize a number between 1 and "X"
     */
    func randomize(x: Int) -> Int {
        let randomNumber = Int.random(in: 1...x)
        return randomNumber
    }
    
    /*
     roll a "dice" sided dice, "number" many times.
     */
    func rollingXdice(dice: Int) {
        //output the message "Rolling dX"
        self.resultRolling.text = "Rolling d\(dice)"
        //get number from input
        let number = getNumberFromInput()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            if number == 1 {
                self.resultRolling.text = "\(self.randomize(x: dice))"
            }
            else {
                var sum = 0
                for _ in 0..<number {
                    sum += self.randomize(x: dice)
                }
                self.resultRolling.text = "\(number)d\(dice): \(sum)"
            }
        }
    }
    
    
    /*
     convert number from input to Int
     */
    func getNumberFromInput() -> Int {
        guard let number = Int(numberOfDices.text!) else {
            return 1
        }
        return number
    }
}

