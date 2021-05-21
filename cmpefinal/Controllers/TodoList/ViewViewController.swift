//
//  ViewViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import UIKit
import RealmSwift

class ViewViewController: UIViewController {
    public var  item:ToDoListItem?
    public var deleionHandler:(()->Void)?
    
    
    @IBOutlet var itemlabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    
    private let realm = try! Realm()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemlabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from:item!.date)
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(TapDelete))
        // Do any additional setup after loading the view.
    }
    @objc private func TapDelete(){
        guard let item = self.item else{
            return
        }
        
        
        realm.beginWrite()
        realm.delete(item)
        try! realm.commitWrite()
        
        deleionHandler?()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
