//
//  ViewController.swift
//  Vaqueros
//
//  Created by Administrador on 24/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var matchStart = false
    var p1Turn = false
    var p2Turn = false
    var p1Attack = false
    var p2Attack = false
    var p1Guard = false
    var p2Guard = false
    var p1Reload = false
    var p2Reload = false
    
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var go: UIButton!
    
    @IBOutlet weak var p1Life: UILabel!
    @IBOutlet weak var p1Ammo: UILabel!
    @IBOutlet weak var p2Life: UILabel!
    @IBOutlet weak var p2Ammo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func p1Shoots(_ sender: UIButton) {
        if p1Turn {
            p1Attack = true
            p2Turn = true
        }
    }
    
    @IBAction func p1Shields(_ sender: UIButton) {
        if p1Turn {
            p1Guard = true
            p2Turn = true
        }
    }
    
    @IBAction func p1Reloads(_ sender: UIButton) {
        if p1Turn {
            p1Reload = true
            p2Turn = true
        }
    }
    
    @IBAction func p2Shoots(_ sender: UIButton) {
        if p2Turn {
            p2Attack = true
            matchStart = true
            go.isHidden = false
        }
    }
    
    @IBAction func p2Shields(_ sender: UIButton) {
        if p2Turn {
            p2Guard = true
            matchStart = true
            go.isHidden = false
        }
    }
    
    @IBAction func p2Reloads(_ sender: UIButton) {
        if p2Turn {
            p2Reload = true
            matchStart = true
            go.isHidden = false
        }
    }
    
    
    
    @IBAction func startGame(_ sender: UIButton) {
        p1Life.text = "3"
        p1Ammo.text = "0"
        p2Life.text = "3"
        p2Ammo.text = "0"
        start.isHidden = true
        go.isHidden = false
        p1Turn = true
        p2Turn = false
        p1Guard = false
        p2Guard = false
        matchStart = false
    }
    
    @IBAction func executeMatch(_ sender: UIButton) {
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func checkGameOver() -> Bool {
        var isGameOver = false
        var p1Lives = p1Life.text
        var p2Lives = p2Life.text
        if p1Lives == "0" {
            isGameOver = true
            p1Turn = false
            p2Turn = false
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "P2 WINS")
        }
        else if p2Lives == "0" {
            isGameOver = true
            p1Turn = false
            p2Turn = false
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "P1 WINS")
        }
        else if p1Lives == "0" && p2Lives == "0" {
            isGameOver = true
            p1Turn = false
            p2Turn = false
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "It's a DRAW")
        }
        return isGameOver
    }
    

    
}

