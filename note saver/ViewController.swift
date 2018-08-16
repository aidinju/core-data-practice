//
//  ViewController.swift
//  note saver
//
//  Created by aidin on 7/31/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import CoreData

class ViewController : UIViewController , UITableViewDelegate , UITableViewDataSource  {
    
    var generalArray : [GeneralEntity] = [] {
        didSet {
            self.tableview.reloadData()
        }
    }
    @IBOutlet weak var tableview: UITableView!
    var generation : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        dataLoader()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellClass
        cell.nameLabel.text = generalArray[indexPath.row].name
        cell.shortDesLabel.text = generalArray[indexPath.row].shortDes
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let contex = appDelegate.persistentContainer.viewContext
            let deletedObject = generalArray[indexPath.row]
            contex.delete(deletedObject)
            do {
               try contex.save()
            } catch {
                print("error too delete kardan dar tableview")
            }
            dataLoader()
        }
    }
    
    func dataLoader() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GeneralEntity")
        request.sortDescriptors = [
        NSSortDescriptor(key: "name", ascending: true)
        ]
        do {
            self.generalArray = []
            let results = try contex.fetch(request)
            for data in results as! [GeneralEntity] {
                self.generalArray.append(data)
            }
        } catch {
            print("error too func dataLoader")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg2" {
            let destination = segue.destination as! detailsViewController
            let selectedNote = tableview.indexPathForSelectedRow
            destination.detailedNote = generalArray[(selectedNote?.row)!]
        } else {
            return
        }
    }
    
    /*
     for filtering
     after writing codes for fetching data write this: ( it's name is request as always)
     let filter = NSPeredicate(format : "someattribute =[c] %@ , the word that tou want to filter)
     request.predicate = filter
     
 */
    
}

