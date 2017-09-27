//
//  FirstViewController.swift
//  TableToDoApp
//
//  Created by Admin on 02.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

var list:[(name: String, isImportant: Bool, isDone: Bool)] = [(name: "first task", isImportant: false,isDone: false),
                                                (name: "second task", isImportant: true,isDone: false),
                                                (name: "third task", isImportant: false,isDone: false)]

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if list[indexPath.row].isImportant == true{
            cell.backgroundColor = UIColor(red: 70/255, green: 20/255, blue: 0/255, alpha: 0.7)
        }else{
            cell.backgroundColor = UIColor(red: 0/255, green: 20/255, blue: 20/255, alpha: 0.7)
        }
        
        cell.textLabel?.textColor=UIColor.white
        cell.textLabel?.font = UIFont.init(name: "Helvetica", size: 30)
        
        if list[indexPath.row].isDone == true{
            cell.textLabel?.textColor=UIColor.red
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row].name
        
        return cell
    }
    
//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            list.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "DELETE"){(action, indexPath) in
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let done = UITableViewRowAction(style: .normal, title: "DONE"){(action, indexPath) in
            list[indexPath.row].isDone=true
            tableView.reloadData()
        }
//        let update = UITableViewRowAction(style: .default, title: "UPDATE"){(action, indexPath) in
//            list.   [indexPath.row]=true
//            tableView.reloadData()
//        }

        return[delete,done]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

