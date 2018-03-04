//
//  PrescriptionViewController.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 27/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var names : [String] = []
    
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
            self.names.append(nameToSave)
            self.prescriptionTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",
                                         style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
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
        cell.nomMedoc.text = self.names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.names.count
    }
    
    //MARK: - Prescriptions data management -
    
    /// delete a prescription from collection according to its index
    ///
    /// - Precondition: index must be into bound of collection
    /// - Parameter prescriptionWithIndex: index of prescription to delete
    /// - Returns: true if deleton occurs, else false
    func delete(prescriptionWithIndex index: Int)-> Bool{
        guard let context
    }
    
    //MARK: - TableView data source protocol -
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        if(editingStyle==UITableViewCellEditingStyle.delete){
            self.prescriptionTable.beginUpdates()
            if self.delete(prescriptionWithIndex: IndexPath.row){
                self.prescriptionTable.deleteRows(at: [IndexPath], with: UITableViewRowAnimation.automatic)
            }
            self.prescriptionTable.endUpdates()
        }
    }
    
    // MARK: - Helper methods -
    
    func getContext(errorMsg: String, userInfoMsg: String = "could not retrieve data context") -> NSManagedObjectContext?{
        
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
