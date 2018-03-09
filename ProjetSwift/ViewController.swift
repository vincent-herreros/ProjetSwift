//
//  ViewController.swift
//  ProjetSwift
//
//  Created by Vincent HERREROS on 19/02/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var medButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
}

