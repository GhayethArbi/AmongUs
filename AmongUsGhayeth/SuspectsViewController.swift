//
//  SuspectsViewController.swift
//  AmongUsGhayeth
//
//  Created by Mac-Mini-2021 on 27/10/2024.
//

import UIKit
import CoreData
class SuspectsViewController: UIViewController, UICollectionViewDataSource {
    
    //var
    var gamers = [String]()
    var colors = [String]()
    
    
    
    //collection functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "mCell", for: indexPath)
                    
                // Find the image view and label by their tags
                if let imageView = col.viewWithTag(1) as? UIImageView {
                    imageView.image = UIImage(named: colors[indexPath.row])  // Set image for each cell
                }
                    
                if let label = col.viewWithTag(2) as? UILabel {
                    label.text = gamers[indexPath.row] // Set price label for each cell
                }

                return col
    }
    
  
    
    
    //fetch all
    func fetchAll(){
        //app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //persistContainer
        let persistContainr = appDelegate.persistentContainer
        
        //copy managedContext
        let managedContext = persistContainr.viewContext
        
        //req
        let req = NSFetchRequest<NSManagedObject>(entityName: "Suspect")
        
        //exec
        do {
            let articles = try managedContext.fetch(req)
            for item in articles{
                gamers.append(item.value(forKey: "player")as! String)
                colors.append(item.value(forKey: "color")as! String)

                print(item.value(forKey: "player") as! String)
                print(item.value(forKey: "color") as! String)
            }
            
        } catch  {
            print("Failed: fetch error")
        }
        
        
    }
    //didload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAll()
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
