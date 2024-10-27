//
//  ViewController.swift
//  AmongUsGhayeth
//
//  Created by Mac-Mini-2021 on 26/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    //outlet

    
    @IBOutlet weak var imageAmong: UIImageView!
    
    
    
    
    
    
    
    //IB actions
    @IBAction func changeRed(_ sender: Any) {
        imageAmong.image = UIImage(named: "Red")
    }
    
    
    @IBAction func changeBrown(_ sender: Any) {
        imageAmong.image = UIImage(named: "Brown")
    }
    
    @IBAction func changeYellow(_ sender: Any) {
        imageAmong.image = UIImage(named: "Yellow")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "mSegue" {
               if let destination = segue.destination as? GameRoomViewController {
                   if let usernameLabel = view.viewWithTag(100) as? UITextField {
                       destination.username = usernameLabel.text
                   }
               }
           }
       }
    
    
    
    
    
    
    //did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

  
    
}

