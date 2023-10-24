//
//  ViewController.swift
//  Vaqueros
//
//  Created by Administrador on 24/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userTurn = false
    
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
    }
    
    @IBAction func startGame(_ sender: Any) {
    }
    
}

