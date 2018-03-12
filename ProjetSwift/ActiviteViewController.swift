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
    
    var activites: [String]=[]

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
            self.activites.append(nameToSave)
            self.activiteTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.activiteTable.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActiviteTableViewCell
        cell.labelActivite.text = self.activites[indexPath.row]
        return cell
        
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
