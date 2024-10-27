//
//  GameRoomViewController.swift
//  AmongUsGhayeth
//
//  Created by Mac-Mini-2021 on 27/10/2024.
//

import UIKit

class GameRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    
    
    @IBOutlet weak var playerName: UILabel!
    
    
    //var
    var username:String?
    var gamers = [ "Hu5tl3r","Mc_killer","CR7","Not_imposter","baby_shark","AKINFENWA","DR'Who" ]
    var colors = [ "Red","Yellow","Rose","Purple","Red","Light-blue","Brown"]

    
    //table of gamers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gamers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        let labelg = contentView?.viewWithTag(2) as! UILabel
        let labelc = contentView?.viewWithTag(3) as! UILabel
        let imageView = contentView?.viewWithTag(4) as! UIImageView
        labelg.text = gamers[indexPath.row]
        labelc.text = colors[indexPath.row]
        imageView.image = UIImage(named: colors[indexPath.row])
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        performSegue(withIdentifier: "infoSegue", sender: indexPath)
        print("table view here")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            if let destination = segue.destination as? InfoViewController,
               let index = sender as? IndexPath{
                destination.gamer = gamers[index.row]
                destination.color = colors[index.row]
                
            }

                
        }
            
        
    }
    
    
    
    
    
    //didload
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.text = username
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
