//
//  ViewController.swift
//  IdentifyDevice
//
//  Created by Jose Velazquez on 9/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let text:UILabel =
    {
        let text:UILabel = UILabel()
        text.font.withSize(72)
        text.textColor = .white
        text.text = "Devices"
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        text.frame = CGRect(x: 0,y: 0, width : 300 ,height : 300)
        text.center = view.center
        view.addSubview(text)
        
        text.text = UIDevice.current.name + "\n" + UIDevice.current.systemName + " " + UIDevice.current.systemVersion
    }


}

