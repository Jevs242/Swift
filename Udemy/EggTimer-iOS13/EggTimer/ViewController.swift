//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300 , "Medium": 420, "Hard": 720]
    
    var hardness = ""
    
    var secondsRemaining = 0
    
    var timer = Timer()
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func PressButton(_ sender: UIButton) {
        
        timer.invalidate()
        hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        barProgress.progress = 1
        
        titleLabel.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil,repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0{
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
            barProgress.progress = Float(secondsRemaining) / Float(eggTimes[hardness]!)
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound(name: "alarm_sound")
        }
    }
    


    

    func playSound(name : String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
