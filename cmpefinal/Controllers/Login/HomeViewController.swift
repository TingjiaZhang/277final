//
//  HomeViewController.swift
//  cmpe277hw2
//
//  Created by 张廷嘉 on 5/18/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView:UIScrollView={
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    //button 1
    private let Button1:UIButton={
        let button = UIButton()
        button.setTitle("jump test", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20,weight:.bold)
        return button
    }()
    
    //button 2
    private let Button2:UIButton={
        let button = UIButton()
        button.setTitle("sign in", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20,weight:.bold)
        return button
    }()
    
    //button 3
    private let Button3:UIButton={
        let button = UIButton()
        button.setTitle("register", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20,weight:.bold)
        return button
    }()

    //button 4
    private let Button4:UIButton={
        let button = UIButton()
        button.setTitle("homepage", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20,weight:.bold)
        return button
    }()
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MEMO OL"
        view.backgroundColor = .yellow
        
        //button function:
        Button1.addTarget(self,
                             action: #selector(Button1Tapped),
                             for: .touchUpInside)
       
        
        
        //add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(Button1)
        scrollView.addSubview(Button2)
        scrollView.addSubview(Button3)
        scrollView.addSubview(Button4)
        

        

    }
    
    @objc private func Button1Tapped(){
        let vc = MemoViewController()
        vc.title = "Memo View"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 40,
                                 width: size,
                                 height: size)
        
        //button 1
        Button1.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollView.width-60,
                                 height: 52)
        
        
        //button 2
        Button2.frame = CGRect(x: 30,
                                  y: Button1.bottom+10,
                                  width: scrollView.width-60,
                                 height: 52)
        
        //button 3
        Button3.frame = CGRect(x: 30,
                                  y: Button2.bottom+10,
                                  width: scrollView.width-60,
                                 height: 52)
        
        //button 4
        Button4.frame = CGRect(x: 30,
                                  y: Button3.bottom+10,
                                  width: scrollView.width-60,
                                 height: 52)
        
        
        
    }

    

}
