//
//  ActiviteViewController.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 12/03/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit
import CoreData

class ActiviteViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var activites: [Activites]=[]

    @IBOutlet weak var activiteTable: UITableView!
    @IBAction func addActivite(_ sender: Any) {
        let alert = UIAlertController(title: "Nouvelle Activité",
                                      message: "Ajouter une Activité",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Ajouter",style: .default)
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            self.saveNewActivite(withName:nameToSave)
            self.activiteTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func saveNewActivite(withName name: String){
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else{
        self.alertError(errorMsg: "Could not save the activitie", userInfo: "unknown reason")
        return
        }
        let context = appDelegate.persistentContainer.viewContext
        let activite = Activites(context: context)
        activite.nom = name
        do{
            try context.save()
            self.activites.append(activite)
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)",userInfo: "\(error.userInfo)")
            return
        }
    }
    
    func alertError(errorMsg error:String, userInfo user :String = ""){
        let alert = UIAlertController(title: error, message: user, preferredStyle: .alert )
        let cancelAction = UIAlertAction(title:"Ok", style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else{
            self.alertError(errorMsg: "Could not save the activitie", userInfo: "unknown reason")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Activites> = Activites.fetchRequest()
        do{
            try self.activites = context.fetch(request)
        }
        catch let error as NSError {
            self.alertError(errorMsg: "\(error)",userInfo: "\(error.userInfo)")
        }
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     // MARK: - Table View Data Source protocol -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activiteTable.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActiviteTableViewCell
        cell.labelActivite.text = self.activites[indexPath.row].nom
        return cell
        
    }
    //MARK : - Helper Method -
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
