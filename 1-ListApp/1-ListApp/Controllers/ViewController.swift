//
//  ViewController.swift
//  1-ListApp
//
//  Created by Timucin AYDOGDU on 16.10.2022.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var tableView : UITableView!
    
    

    var data = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text=data[indexPath.row]
        
        
        return cell
    }
    
   
    @IBAction func didAddBarButtonTabbed(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "New Item Add", message: "", preferredStyle: .alert)
        let defaultButton = UIAlertAction(title: "Ekle", style:.default) { _ in
            
            let text = alertController.textFields?.first?.text
            
            if text != "" {
                self.data.append((text)!)
                self.tableView.reloadData()
            }else {
                let alertController = UIAlertController(title: "Uyarı", message: "Liste Elemanı Boş Bırakma", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "Tamam", style: .cancel)
                alertController.addAction(cancelButton)
                
                self.present(alertController, animated: true)
            }
            
        }
        let cancelButton = UIAlertAction(title: "İptal", style: .cancel)
        
        alertController.addTextField()
        
        alertController.addAction(defaultButton)
        alertController.addAction(cancelButton)
        present(alertController,animated: true)

    }
    
    

}

