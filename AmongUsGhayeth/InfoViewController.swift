//
//  InfoViewController.swift
//  AmongUsGhayeth
//
//  Created by Mac-Mini-2021 on 27/10/2024.
//

import UIKit
import CoreData

class InfoViewController: UIViewController {
    
    
    
    
    
    
    
    //var
    var gamer:String?
    var color:String?

    
    
    //outlet
    @IBOutlet weak var image: UIImageView!
    
    
    
    
    
    //ibActions
    @IBAction func markSuspect(_ sender: Any) {
        if checkSuspect(){
                
            let alert = UIAlertController (title: "Warning", message: "Player already Marked as suspect!", preferredStyle: .alert )
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
                
        }else{
            insertSuspect()
            let alert = UIAlertController (title: "Success", message: "Player marked as suspect successfully!", preferredStyle: .alert )
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)

            self.present(alert, animated: true)
        }
        
    }
    
    
    // insert
    func insertSuspect(){
        print("it s insert")
        //app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //persistContainer
        let persistContainr = appDelegate.persistentContainer
        
        //copy managedContext
        let managedContext = persistContainr.viewContext
        
        //article vide
        let entityDesc = NSEntityDescription.entity(forEntityName: "Suspect", in: managedContext)
        
        //obj
        let obj = NSManagedObject(entity: entityDesc!, insertInto: managedContext)
        print("insert delegate")
        //add value
        obj.setValue(gamer, forKey: "player")
        obj.setValue(color, forKey: "color")
        
        //push
        do {
            try managedContext.save()
        } catch  {
            print("Failed: insert error")
        }
        
    }

    
    //check gamer in db
    func checkSuspect() -> Bool{
        var productExist = false
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext   //[NSMAnagedObject]
        let request = NSFetchRequest<NSManagedObject>(entityName: "Suspect")
        let predicate = NSPredicate(format: "player = %@ AND color = %@", gamer!, color!)
        request.predicate = predicate
        
        do{
            let result = try managedContext.fetch (request)
            if result.count > 0{
                productExist = true
            }
            
        }catch{
            print("FETCHING ERROR")
        }
        
        return productExist
    }
    
    
    //didload
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = gamer
        image.image = UIImage(named: color ?? "Red")
        

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
