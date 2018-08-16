//
//  addViewController.swift
//  note saver
//
//  Created by aidin on 7/31/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import CoreData

class addViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var shortText: UITextField!
    @IBOutlet weak var longText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addViewButton(_ sender: UIButton) {
        if sender.tag == 1 {
            if self.nameText.text == "" || self.ageText.text == "" || self.shortText.text == "" || self.longText.text == "" {
                let warningAlert = UIAlertController(title: "Attention!", message: "Please fill all fields", preferredStyle: UIAlertControllerStyle.alert)
                let OKButton = UIAlertAction(title: "OK", style: .cancel) { (a : UIAlertAction) in
                }
                warningAlert.addAction(OKButton)
                self.present(warningAlert, animated: true) {
                    () -> Void in
                }
            } else {
                self.dataAdder(name: self.nameText.text!, age: self.ageText.text!, shortDesc: self.shortText.text!, longDesc: self.longText.text!)
                self.dismiss(animated: true) {
                }
            }
            
        } else {
            self.dismiss(animated: true) {
            }
        }
    }
    
    func dataAdder(name : String , age : String , shortDesc : String , longDesc : String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "GeneralEntity", in: contex)
        let newNote = GeneralEntity(entity: entity!, insertInto: contex)
        newNote.name = name
        newNote.age = age
        newNote.shortDes = shortDesc
        newNote.longDes = longDesc
        do {
            try contex.save()
        } catch {
            print("error too func dataAdder")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
