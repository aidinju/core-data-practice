//
//  detailsViewController.swift
//  note saver
//
//  Created by aidin on 7/31/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import CoreData

class detailsViewController: UIViewController {
    
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var ageL: UILabel!
    @IBOutlet weak var longDesL: UILabel!
    var detailedNote : GeneralEntity!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameL.text = "name is \(detailedNote.name)"
        ageL.text = "age is \(detailedNote.age)"
        longDesL.text = "you entered this description : \(detailedNote.longDes)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
