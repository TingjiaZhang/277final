//
//  ProfileViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/17/21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let data = ["Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
extension ProfileViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionsheet = UIAlertController(title: "",
                                            message:"",
                                            preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "log out",
                                            style: .destructive,
                                            handler: {[weak self] _ in
                                                
                                                guard let StrongSelf = self else{
                                                    return
                                                }
                                                
                                                do{
                                                    try FirebaseAuth.Auth.auth().signOut()
                                                    
                                                    let vc = LoginViewController()
                                                    let nav = UINavigationController(rootViewController: vc)
                                                    nav.modalPresentationStyle = .fullScreen
                                                    StrongSelf.present(nav, animated:true)
                                                }
                                                catch{
                                                    print("fail to log out,sry...")
                                                }
                                                
                                            }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionsheet,animated: true)
        
        
        
    }
}
