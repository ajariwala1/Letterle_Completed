//
//  ViewController.swift
//  Letterle_Completed
//

import UIKit

class ViewController: UIViewController {
    
    var pickRandom : String?
    var counter: Int = 0
    let arrayAlphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "p", "q", "r", "s" ,"t", "u", "v", "w",
    "x", "y", "z"]
    @IBOutlet weak var confetti: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var allButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(true)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        updateUI(true)
    }
    
    @IBAction func letterSelected(_ sender: UIButton) {
        let letterPressed = sender.titleLabel!.text!
        sender.backgroundColor = UIColor.lightGray
        sender.isUserInteractionEnabled = false
        counter += 1
        compareLetters(letterPressed, pickRandom!)
    }
    
    func updateUI(_ reset : Bool) {
        if reset {
            // clear ui
            
            // buttons
            for i in allButtons {
                i.backgroundColor = UIColor.white
                i.isUserInteractionEnabled = true
            }
            
            // background
            confetti.isHidden = true
            
            // label
            counterLabel.isHidden = true
            
            // clear counter
            counter = 0
            
            // get new random
            pickRandom = arrayAlphabets.randomElement()
            
        } else {
            // update ui
            
            // show background
            confetti.isHidden = false
            
            // show label
            counterLabel.isHidden = false
            counterLabel.text = "Yayy! It only took: \(counter) attempts."
            
            // disable buttons
            for i in allButtons {
                i.isUserInteractionEnabled = false
            }
            
        }
    }
    
    // compare picked element with the random letter
    func compareLetters(_ picked : String, _ random : String) {
        if picked.lowercased() == random.lowercased() {
            updateUI(false)
        }
    }
    
}

