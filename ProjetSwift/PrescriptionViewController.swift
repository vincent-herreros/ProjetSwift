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
    
    var names : [String] = []
    var prescriptions : [Prescriptions] = []
    
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
    
    func saveNewPrescription(withName name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            self.alertError(errorMsg: "Could not save person", userInfo: "unknown reason")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let prescription = Prescriptions(context: context)
        prescription.nomPrescri = name
        do{
            try context.save()
            self.prescriptions.append(prescription)
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
            return
        }
    }
    
    func alertError(errorMsg error : String, userInfo user: String = ""){
        let alert = UIAlertController(title: error,
                                      message: user,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    @IBOutlet weak var prescriptionTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.prescriptionTable.dequeueReusableCell(withIdentifier: "prescriptionCell", for: indexPath) as! PrescriptionTableViewCell
        cell.nomMedoc.text = self.prescriptions[indexPath.row].nomPrescri
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.prescriptions.count
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
