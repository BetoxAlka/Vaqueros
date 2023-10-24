//
//  ViewController.swift
//  Vaqueros
//
//  Created by Administrador on 24/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userTurn = false
    var enemyGuard = false
    var userGuard = false
    
    @IBOutlet weak var shoot: UIButton!
    @IBOutlet weak var shield: UIButton!
    @IBOutlet weak var reload: UIButton!
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var life: UILabel!
    @IBOutlet weak var ammo: UILabel!
    @IBOutlet weak var enemylife: UILabel!
    @IBOutlet weak var enemyammo: UILabel!
    @IBOutlet weak var enemylabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleshoot(_ sender: UIButton) {
    }
    
    @IBAction func handleshield(_ sender: UIButton) {
    }
    
    @IBAction func handlereload(_ sender: UIButton) {
        if userTurn {
            userGuard = false
            let bullets = ammo.text!
            let newammo = Int(bullets)
            
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        enemyGuard = false
        userGuard = false
        enemylabel.text = "-"
        enemylife.text = "3"
        enemyammo.text = "0"
        life.text = "3"
        ammo.text = "0"
        userTurn = true
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func checkGameOver() -> Bool {
        let lives = life.text
        let enemy = enemylife.text
        var isGameOver = false
        if lives == "0" {
            isGameOver = true
            userTurn = false
            showAlert(message: "Computer WINS")
        }
        else if enemy == "0" {
            isGameOver = true
            userTurn = false
            showAlert(message: "User WINS")
        }
        return isGameOver
    }
    
}

