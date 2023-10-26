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
            p1Guard = false
            p1Reload = false
            p1Turn = false
            p2Turn = true
        }
    }
    
    @IBAction func p1Shields(_ sender: UIButton) {
        if p1Turn {
            p1Attack = false
            p1Guard = true
            p1Reload = false
            p1Turn = false
            p2Turn = true
        }
    }
    
    @IBAction func p1Reloads(_ sender: UIButton) {
        if p1Turn {
            p1Attack = false
            p1Guard = false
            p1Reload = true
            p1Turn = false
            p2Turn = true
        }
    }
    
    @IBAction func p2Shoots(_ sender: UIButton) {
        if p2Turn {
            p2Attack = true
            p2Guard = false
            p2Reload = false
            p2Turn = false
            matchStart = true
            go.isHidden = false
        }
    }
    
    @IBAction func p2Shields(_ sender: UIButton) {
        if p2Turn {
            p2Attack = false
            p2Guard = true
            p2Reload = false
            p2Turn = false
            matchStart = true
            go.isHidden = false
        }
    }
    
    @IBAction func p2Reloads(_ sender: UIButton) {
        if p2Turn {
            p2Attack = false
            p2Guard = false
            p2Reload = true
            p2Turn = false
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
        p1Turn = true
        p2Turn = false
        p1Attack = false
        p2Attack = false
        p1Guard = false
        p2Guard = false
        p1Reload = false
        p2Reload = false
        matchStart = false
    }
    
    @IBAction func executeMatch(_ sender: UIButton) {
        if matchStart {
            if p1Attack && p2Attack {
                let p1Bullets = p1Ammo.text!
                let p2Bullets = p2Ammo.text!
                if p1Bullets != "0" && p2Bullets != "0" {
                    var p1NewAmmo = Int(p1Bullets)!
                    var p2NewAmmo = Int(p2Bullets)!
                    p1NewAmmo = p1NewAmmo - 1
                    p2NewAmmo = p2NewAmmo - 1
                    p1Ammo.text = String(p1NewAmmo)
                    p2Ammo.text = String(p2NewAmmo)
                    
                    let p1Lives = p1Life.text!
                    var p1NewLife = Int(p1Lives)!
                    let p2Lives = p2Life.text!
                    var p2NewLife = Int(p2Lives)!
                    p1NewLife = p1NewLife - 1
                    p2NewLife = p2NewLife - 1
                    p1Life.text = String(p1NewLife)
                    p2Life.text = String(p2NewLife)
                    
                    matchStart = false
                    go.isHidden = true
                    p1Turn = true
                }
                else if p1Bullets != "0" && p2Bullets == "0" {
                    var p1NewAmmo = Int(p1Bullets)!
                    p1NewAmmo = p1NewAmmo - 1
                    p1Ammo.text = String(p1NewAmmo)
                    
                    let p2Lives = p2Life.text!
                    var p2NewLife = Int(p2Lives)!
                    p2NewLife = p2NewLife - 1
                    p2Life.text = String(p2NewLife)
                    
                    matchStart = false
                    go.isHidden = true
                    p1Turn = true
                }
                else if p1Bullets == "0" && p2Bullets != "0" {
                    var p2NewAmmo = Int(p2Bullets)!
                    p2NewAmmo = p2NewAmmo - 1
                    p2Ammo.text = String(p2NewAmmo)
                    
                    let p1Lives = p1Life.text!
                    var p1NewLife = Int(p1Lives)!
                    p1NewLife = p1NewLife - 1
                    p1Life.text = String(p1NewLife)
                    
                    matchStart = false
                    go.isHidden = true
                    p1Turn = true
                }
                else if p1Bullets == "0" && p2Bullets == "0" {
                    matchStart = false
                    go.isHidden = true
                    p1Turn = true
                }
            }
            else if p1Guard && p2Guard {
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Reload && p2Reload {
                let p1Bullets = p1Ammo.text!
                let p2Bullets = p2Ammo.text!
                var p1NewAmmo = Int(p1Bullets)!
                var p2NewAmmo = Int(p2Bullets)!
                p1NewAmmo = p1NewAmmo + 1
                p2NewAmmo = p2NewAmmo + 1
                p1Ammo.text = String(p1NewAmmo)
                p2Ammo.text = String(p2NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Attack && p2Guard {
                let p1Bullets = p1Ammo.text!
                var p1NewAmmo = Int(p1Bullets)!
                p1NewAmmo = p1NewAmmo - 1
                p1Ammo.text = String(p1NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Guard && p2Attack {
                let p2Bullets = p2Ammo.text!
                var p2NewAmmo = Int(p2Bullets)!
                p2NewAmmo = p2NewAmmo - 1
                p2Ammo.text = String(p2NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Attack && p2Reload {
                let p1Bullets = p1Ammo.text!
                var p1NewAmmo = Int(p1Bullets)!
                p1NewAmmo = p1NewAmmo - 1
                p1Ammo.text = String(p1NewAmmo)
                
                let p2Lives = p2Life.text!
                var p2NewLife = Int(p2Lives)!
                p2NewLife = p2NewLife - 1
                p2Life.text = String(p2NewLife)
                
                let p2Bullets = p2Ammo.text!
                var p2NewAmmo = Int(p2Bullets)!
                p2NewAmmo = p2NewAmmo + 1
                p2Ammo.text = String(p2NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Reload && p2Attack {
                let p2Bullets = p2Ammo.text!
                var p2NewAmmo = Int(p2Bullets)!
                p2NewAmmo = p2NewAmmo - 1
                p2Ammo.text = String(p2NewAmmo)
                
                let p1Lives = p1Life.text!
                var p1NewLife = Int(p1Lives)!
                p1NewLife = p1NewLife - 1
                p1Life.text = String(p1NewLife)
                
                let p1Bullets = p1Ammo.text!
                var p1NewAmmo = Int(p1Bullets)!
                p1NewAmmo = p1NewAmmo + 1
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Guard && p2Reload {
                let p2Bullets = p2Ammo.text!
                var p2NewAmmo = Int(p2Bullets)!
                p2NewAmmo = p2NewAmmo + 1
                p2Ammo.text = String(p2NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            else if p1Reload && p2Guard {
                let p1Bullets = p1Ammo.text!
                var p1NewAmmo = Int(p1Bullets)!
                p1NewAmmo = p1NewAmmo + 1
                p1Ammo.text = String(p1NewAmmo)
                
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
            if !checkGameOver() {
                matchStart = false
                go.isHidden = true
                p1Turn = true
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func checkGameOver() -> Bool {
        var isGameOver = false
        let p1Lives = p1Life.text
        let p2Lives = p2Life.text
        if p1Lives == "0" {
            isGameOver = true
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "P2 WINS")
        }
        else if p2Lives == "0" {
            isGameOver = true
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "P1 WINS")
        }
        else if p1Lives == "0" && p2Lives == "0" {
            isGameOver = true
            start.isHidden = false
            go.isHidden = true
            showAlert(message: "It's a DRAW")
        }
        return isGameOver
    }
    

    
}

