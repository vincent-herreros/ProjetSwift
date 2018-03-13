//
//  PrescriptionViewController.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit
import CoreData

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    /// Collection de prescriptions affiché dans prescriptionTable
    
    
    var prescriptions : [Prescriptions] = []
    
    @IBOutlet weak var prescriptionTable: UITableView!
    
    @IBOutlet weak var pickerMedicament: UIPickerView!
    
    var pickerData : [Medicaments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerMedicament.delegate = self
        pickerMedicament.dataSource = self
        
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
        //Load pickerData
        request : NSFetchRequest<Medicaments> = Medicaments.fetchRequest()
        do{
            try self.pickerData = context.fetch(request)
        }
        catch let error as NSError{
            self.alert(error: error)
        }
    }
    
    
    /// Enelve une prescription de la collection à l'index indiqué
    ///
    /// - Preconditions: L'index doit appartenir à la collection
    /// - Parameter prescriptionWithIndex:Index de la prescription à supprimer
    /// - Returns: True, si la suppression est faite, sinon false
    func delete(prescriptionWithIndex index: Int) -> Bool{
        guard let context = getContext(errorMsg: "Could not delete Prescription") else {
            return false
        }
        let prescription = self.prescriptions[index]
        context.delete(prescription)
        do{
            try context.save()
            self.prescriptions.remove(at: index)
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
    
    //MARK: - Picker View Function
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].nom
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //Indique si on appelle la fonction pour un effacement de ligne ou non
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.prescriptionTable.beginUpdates()
            if self.delete(prescriptionWithIndex: indexPath.row){
                self.prescriptionTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.prescriptionTable.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    

}
