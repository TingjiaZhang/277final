//
//  ViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/17/21.
//

import UIKit
import FirebaseAuth


class ConversactionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .blue
        
        //DatabaseManager.shared.test()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
        //let isLogged_in = UserDefaults.standard.bool(forKey: "Logged_in")
    }
    
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated:false)
        }
    }
    
    

}

