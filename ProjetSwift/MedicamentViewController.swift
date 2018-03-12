//
//  MedicamentViewController.swift
//  ProjetSwift
//
//  Created by Sheena Maucuer on 10/03/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit
import CoreData

class MedicamentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate{
    

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
    }
    
    func saveNewMedicament(withName name: String, withDose dose: String){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source protocol -
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.medicamentTable.dequeueReusableCell(withIdentifier: "medicamentCell", for: indexPath) as! MedicamentTableViewCell
        cell.nomMedicament.text = self.medicaments[indexPath.row].nom
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.medicaments.count
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
