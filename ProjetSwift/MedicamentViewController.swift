//
//  MedicamentViewController.swift
//  ProjetSwift
//
//  Created by Sheena Maucuer on 10/03/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit
import CoreData

class MedicamentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet weak var medicamentTable: UITableView!
    var medicaments : [Medicaments] = []
    
    @IBAction func addMedicament(_ sender: Any) {
        let alert = UIAlertController(title: "Nouveau Médicament",
                                      message: "Ajouter un médicament avec son nom, sa dose et sa description",
                                      preferredStyle: .alert)
        //Submit button
        let submitAction = UIAlertAction(title: "Ajouter",
                                         style: .default,
                                         handler:{ (action) -> Void in
            //TextField
            let nomMedicamentText = alert.textFields![0]
            let doseMedicamentText = alert.textFields![1]
            let uniteMedicamentText = alert.textFields![2]
            let descriptionMedicamentText = alert.textFields![3]
            
                                            self.saveNewMedicament(withName: nomMedicamentText.text!, withDose: doseMedicamentText.text!, withUnite: uniteMedicamentText.text!, withDescription: descriptionMedicamentText.text!)
                                            self.medicamentTable.reloadData()
        })
        
        //Cancel
        let cancel = UIAlertAction(title: "Annuler", style: .default, handler: { (action) -> Void in })
        
        //Add textField
        alert.addTextField{ (textField: UITextField) in
            textField.placeholder = "Nom du médicament"
        }
        alert.addTextField{ (textField: UITextField) in
            textField.placeholder = "Dose du médicament"
        }
        alert.addTextField{ (textField: UITextField) in
            textField.placeholder = "Unité de la dose"
        }
        alert.addTextField{(textField: UITextField) in
            textField.placeholder = "Description"
        }
        //Add action
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let context = getContext(errorMsg: "Could not load data") else{
            return
        }
        let request : NSFetchRequest<Medicaments> = Medicaments.fetchRequest()
        do{
            try self.medicaments = context.fetch(request)
        }
        catch let error as NSError{
            self.alert(error: error)
        }    }
    
    func saveNewMedicament(withName name: String, withDose dose: String, withUnite unite: String, withDescription description: String){
        guard let context = self.getContext(errorMsg: "Save failed") else{
            return
        }
        let medicament = Medicaments(context: context)
        medicament.nom = name
        medicament.dose = Int64(dose)!
        medicament.unite = unite
        medicament.descript = description
        do{
            try context.save()
            self.medicaments.append(medicament)
        }
        catch let error as NSError{
            self.alert(error: error)
            return
        }
    }
    
    /// Enelve un medicament de la collection à l'index indiqué
    ///
    /// - Preconditions: L'index doit appartenir à la collection
    /// - Parameter medicamentWithIndex:Index du medicament à supprimer
    /// - Returns: True, si la suppression est faite, sinon false
    func delete(medicamentWithIndex index: Int) -> Bool{
        guard let context = getContext(errorMsg: "Could not delete Medicament") else {
            return false
        }
        let medicament = self.medicaments[index]
        context.delete(medicament)
        do{
            try context.save()
            self.medicaments.remove(at: index)
            return true
        }
        catch let error as NSError{
            self.alert(error: error)
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source protocol -
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.medicamentTable.dequeueReusableCell(withIdentifier: "medicamentCell", for: indexPath) as! MedicamentTableViewCell
        cell.nomMedicament.text = self.medicaments[indexPath.row].nom
        cell.dose.text = String(self.medicaments[indexPath.row].dose)
        cell.unite.text = self.medicaments[indexPath.row].unite
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.medicaments.count
    }
    
    
    // MARK: - Helper Methods
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //Indique si on appelle la fonction pour un effacement de ligne ou non
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.medicamentTable.beginUpdates()
            if self.delete(medicamentWithIndex: indexPath.row){
                self.medicamentTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.medicamentTable.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
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
