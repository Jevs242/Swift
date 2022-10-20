//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Jose Velazquez on 9/14/22.
//

import UIKit

class ViewController: UIViewController {

    //Create the image
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Create the button
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //Array
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemPink,
        .systemTeal,
        .systemGray,
        .systemGreen,
        .systemOrange
    
    ]
    
    //Define and create setting defore the program change
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        
        
        imageView.frame = CGRect(x: 0, y:0, width: 300, height:300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    //This funtion is the call of the button
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    //Create the button's frame
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 30,
                              y:view.frame.size.height-150-view
                                .safeAreaInsets.bottom,
                              width:view.frame.size.width-60,
                              height: 55)
    }
    
    //This is a Funtion for change the color of the background
    
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {return}
        imageView.image = UIImage(data: data)
    }
    

}

