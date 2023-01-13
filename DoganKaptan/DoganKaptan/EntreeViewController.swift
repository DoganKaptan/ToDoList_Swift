//
//  EntreeViewController.swift
//  DoganKaptan
//
//  Created by dogankaptan on 09/01/2023.
//

import UIKit

class EntreeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTache))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        saveTache()
        return true
    }

    @objc func saveTache() {
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "tache_\(newCount)")
        
        update?()
        
        
        navigationController?.popViewController(animated: true)
        
    }
}
