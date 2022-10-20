//
//  ViewController.swift
//  CounterClick
//
//  Created by Jose Velazquez on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    private let text: UILabel = {
        let text = UILabel()
        text.text = "Hi Bro!"
        text.textColor = .black
        text.font.withSize(24)
        text.textAlignment = .center
        return text
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Click me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(text)
        

        text.frame = CGRect(x: 150, y: 150, width: 100, height: 20)
        text.center = view.center
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(ClickButton), for: .touchUpInside)
    
    }
    
    @objc func ClickButton(){
        counter += 1
        text.text = counter.description
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 30,
                              y:view.frame.size.height-150-view
                                .safeAreaInsets.bottom,
                              width:view.frame.size.width-60,
                              height: 55)
    }

    
    
    
}

