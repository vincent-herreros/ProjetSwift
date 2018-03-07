//
//  PrescriptionViewController.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit
import CoreData

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// Collection de prescriptions affiché dans prescriptionTable
    var prescriptions : [Prescriptions] = []
    
    @IBOutlet weak var prescriptionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let context = getContext(errorMsg: "Could not load data") else{
            return
        }
        let request : NSFetchRequest<Prescriptions> = Prescriptions.fetchRequest()
        do{
            try self.prescriptions = context.fetch(request)
        }
        catch let error as NSError{
            self.alert(error: error)
        }
    }
    
    /// Appeler quand le bouton "add" est est pressé
    ///
    /// Ouvre une boite de dialogue demandant le nom de la prescription
    /// - Parameter sender: Objet qui fait l'action
    @IBAction func addPrescription(_ sender: Any) {
        let alert = UIAlertController(title: "Nouvelle Prescription",
                                      message: "Ajouter une prescription",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Ajouter",
                                       style: .default)
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            self.saveNewPrescription(withName: nameToSave)
            self.prescriptionTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",
                                         style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Prescriptions data management -
    
    /// Creer une nouvelle prescription, la sauvegarde et l'ajoute à la collection
    ///
    /// - Parameter name: Nom de la prescription
    func saveNewPrescription(withName name: String){
       guard let context = self.getContext(errorMsg: "Save failed") else{
            return
        }
        let prescription = Prescriptions(context: context)
        prescription.nomPrescri = name
        do{
            try context.save()
            self.prescriptions.append(prescription)
        }
        catch let error as NSError{
            self.alert(error: error)
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source protocol -
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.prescriptionTable.dequeueReusableCell(withIdentifier: "prescriptionCell", for: indexPath) as! PrescriptionTableViewCell
        cell.nomMedoc.text = self.prescriptions[indexPath.row].nomPrescri
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.prescriptions.count
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

}
