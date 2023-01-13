//
//  ViewController.swift
//  DoganKaptan
//
//  Created by dogankaptan on 05/01/2023.
//
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tâches"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }
        
        updateTache()
        
    }
    func updateTache() {
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey:	 "count") as? Int else {
            return}
    
        for x in 0..<count {
               if let task = UserDefaults().value(forKey: "tache_\(x+1)") as? String
               {
                tasks.append(task)
               }
            }
        
        tableView.reloadData()
    }
    @IBAction func TapAjout() {
        
        let viewcont =  storyboard?.instantiateViewController(identifier: "entree") as! EntreeViewController
        viewcont.title = " Nouvelle tâche"
        viewcont.update = {
            DispatchQueue.main.async {
                self.updateTache()
            }
        }
        navigationController?.pushViewController(viewcont, animated: true)
    }
    

}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewcont =  storyboard?.instantiateViewController(identifier: "todo") as! ToDoViewController
        
        viewcont.title = " Nouvelle tâche"
        viewcont.task = tasks[indexPath.row]
        
        navigationController?.pushViewController(viewcont, animated: true)
    
}
    }
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
    
    @IBAction func supprimer(_ unwindSegue: UIStoryboardSegue) {
        //   if let v = unwindSegue.source as? ToDoViewController{
        //    let row = tableView.indexPathForSelectedRow!
        }
        // Use data from the view controller which initiated the unwind segue
    
}
