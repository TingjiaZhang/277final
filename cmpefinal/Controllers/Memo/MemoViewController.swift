//
//  MemoViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var tasks = [String]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title="Memo Tasks"
//        tableView.delegate = self
//        tableView.dataSource = self
        
        
        //set up
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0,forKey: "count")
            
        }
        // get all saved tasks
        updateTasks()
    }
    
    func updateTasks() {
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count")as?Int else{
            return
        }
        for x in 0..<count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)")as? String{
                tasks.append(task)
            }
            
        }
        tableView.reloadData()
    }
    
    @IBAction func TapAdd(){
        
        let vc = storyboard?.instantiateViewController(identifier: "entry")as! EntryViewController
        vc.title = "New Memo"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MemoViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task")as! TaskViewController
        vc.title = "New Memo"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension MemoViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
}
