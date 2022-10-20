//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceButton: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func pressButton(_ sender: UIButton) {
        storyBrain.nextStory(next:sender.tag)
        updateUI()
    }
    
    func updateUI()
    {
        storyLabel.text = storyBrain.getTitle()
        choiceButton.setTitle(storyBrain.getTextButton(button: 0), for: .normal)
        choice2Button.setTitle(storyBrain.getTextButton(button: 1), for: .normal)
    }
}

