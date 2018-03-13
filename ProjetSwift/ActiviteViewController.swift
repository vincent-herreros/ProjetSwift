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
        guard let context = self.getContext(errorMsg: "Save failed") else {return }
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
    
    func delete(activiteWithIndex index: Int)-> Bool {
        guard let context = self.getContext(errorMsg: "Could not delet activitie") else { return false }
        let activitie = self.activites[index]
        context.delete(activitie)
        do{
            try context.save()
            self.activites.remove(at: index)
            return true
        }
        catch let error as NSError{
        self.alert(error: error)
        return false
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
        guard let context = self.getContext(errorMsg: "Could not load data") else {return }
        let request : NSFetchRequest<Activites> = Activites.fetchRequest()
        do{
            try self.activites = context.fetch(request)
        }
        catch let error as NSError {
            self.alert(error: error)
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //Indique si on appelle la fonction pour un effacement de ligne ou non
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.activiteTable.beginUpdates()
            if self.delete(activiteWithIndex: indexPath.row){
                self.activiteTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.activiteTable.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    //MARK : - Helper Method -
    
    /// Récupère le context d'un Core Data initialisé dans l'application delegate
    ///
    /// - Parameters:
    ///   - errorMsg: Message d'erreur
    ///   - userInfoMsg: Information additionnelle
    /// - Returns: Retourne le context d'un Core Data
    func getContext(errorMsg: String, userInfoMsg: String = "could not retrieve data context") -> NSManagedObjectContext?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alert(WithTitle: errorMsg, andMessage: userInfoMsg)
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    /// Fait apparaître une boite de dialogue "alert" avec 2 messages
    ///
    /// - Parameters:
    ///   - title: Titre de la boite de dialogue
    ///   - msg: Message de la boite de dialogue
    func alert(WithTitle title: String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    /// Fait apparaître une boite de dialogue lorsqu'il y a une erreur.
    ///
    /// - Parameter error: Erreur donné à la boite de dialogue
    func alert(error: NSError){
        self.alert(WithTitle:"\(error)", andMessage: "\(error.userInfo)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
