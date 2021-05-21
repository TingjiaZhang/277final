//
//  TaskViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label:UILabel!
    var tasks = [String]()
    
    var task:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Remove",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(removeTasks))
    }
    @objc func removeTasks(){
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
