//
//  entryViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import UIKit
import RealmSwift

class EEntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
        textField.delegate = self
        
        datePicker.setDate(Date(), animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(TapSaveButton))
    }
    
    func textFieldShouldReturn(_ textField:UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @objc func TapSaveButton(){
        if let text = textField.text,!text.isEmpty{
            let date = datePicker.date
            
            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
            
        }else{
            print("Please add a new item here")
        }
    }

    
}
