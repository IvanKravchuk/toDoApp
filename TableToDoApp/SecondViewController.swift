//
//  SecondViewController.swift
//  TableToDoApp
//
//  Created by Admin on 02.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    func containsName(list:[(String, Bool, Bool)], textFieldValue:String) -> Bool {
        
        for task in list { if task.0 == textFieldValue  { return true } }
        return false
    }
    @IBOutlet weak var input: UITextField!
    
    var isImp = true
    
    @IBAction func isImpSwitch(_ sender: UISwitch) {
        isImp = sender.isOn
    }
    
    @IBAction func addTask(_ sender: Any) {
        if input.text != "" {
            if (containsName(list: list, textFieldValue: input.text!) ||
                input.text == "you already have that task") {
                input.text = "you already have that task"
                input.textColor = UIColor.red
            }else{
                list.append((name: input.text!,isImportant: isImp, isDone: false))
                input.text = ""
            }
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

