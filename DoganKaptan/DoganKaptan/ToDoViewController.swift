//
//  ToDoViewController.swift
//  DoganKaptan
//
//  Created by dogankaptan on 09/01/2023.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var task: String?
    
    @IBOutlet weak var suppr: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = task

        
    }
    
    @objc func deleteTache() {
        
        //    let newCount = count + 1
       
     //   UserDefaults().setValue(newCount, forKey: "count")
        
     //   UserDefaults().setValue(nil, forKey: "tache_\(newCount)")
    
        
    }
    
}
