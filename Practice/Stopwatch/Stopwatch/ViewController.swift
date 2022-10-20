//
//  ViewController.swift
//  Stopwatch
//
//  Created by Jose Velazquez on 9/15/22.
//

import UIKit

class ViewController: UIViewController
{

    //Timer
    var timer = Timer()
    
    //Time's Variable
    var second:Int = 0
    var minute:Int = 0
    var hour:Int = 0
    
    //Start the stopwatch>
    var is0:Bool = true
    
    //How many times did you press the mark button
    var counterMark:Int = 0
    
    //All Mark
    var mark:String = ""
    
    //Create the start button
    private let startButton: UIButton =
    {
        let startButton = UIButton()
        startButton.backgroundColor = .green
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
       return startButton
    }()
    
    //Create the stop button
    private let stopButton: UIButton =
    {
        let stopButton = UIButton()
        stopButton.backgroundColor = .gray
        stopButton.setTitle("Reset", for: .normal)
        stopButton.setTitleColor(.white, for: .normal)
        return stopButton
    }()
    
    //Create the time label
    private let timeText: UILabel =
    {
        let timeText = UILabel()
        timeText.font.withSize(64)
        timeText.font = UIFont.systemFont(ofSize: 64.0)
        timeText.textColor = .white
        timeText.textAlignment = .center
        timeText.text = "00:00.00"
        return timeText
    }()
    
    //Create the mark label
    private let markText: UILabel =
    {
        let markText = UILabel()
        markText.numberOfLines = 0
        markText.textColor = .white
        markText.text = ""
        markText.font = UIFont.systemFont(ofSize: 18.0)
        return markText
    }()
    
    //Create the ScrollView
    private let scrollView: UIScrollView =
    {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.contentSize = CGSize(width: 0 , height: 300)
        return scrollView
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        //Positioning the time text
        timeText.frame = CGRect(x: view.center.x - (300 / 2 ), y: 150, width:300 , height:300)
        view.addSubview(timeText)
        
        //Positioning the scroll view
        scrollView.frame = CGRect( x: view.center.x - 150 , y: view.center.y + 110 , width: 300 , height : 300)
        view.addSubview(scrollView)
        
        //Positioning the mark text
        markText.frame = CGRect(x: 0 , y: 0 , width: 300 , height : 300)
        scrollView.addSubview(markText)
            
        view.addSubview(startButton)
        view.addSubview(stopButton)
        
        //Buttons Action
        startButton.addTarget(self, action: #selector(button2StopWatch), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(button1StopWatch), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews()
    {
        let moveX:CGFloat = 100
        
        //Positioning the stop button
        stopButton.frame = CGRect(x:view.center.x - moveX  - (75 / 2), y: view.center.y, width:75 , height : 75)
        stopButton.layer.cornerRadius = 0.5 * stopButton.bounds.size.width
        stopButton.clipsToBounds = true
        
        //Positioning the start button
        startButton.frame = CGRect(x:view.center.x + moveX - (75 / 2), y: view.center.y , width: 75 , height: 75)
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.clipsToBounds = true
    }
    
    @objc func button2StopWatch()
    {
        //If the button is showing "Start"
        if(startButton.backgroundColor == .green)
        {
            //Start timer
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.startCounting), userInfo: nil, repeats: true)
            
            is0 = false
            startButton.backgroundColor = .red
            startButton.setTitle("Stop", for: .normal)
            stopButton.setTitle("Mark", for: .normal)
        }
        //If the button is showing "Stop"
        else
        {
            //Stop timer
            timer.invalidate()
            startButton.backgroundColor = .green
            startButton.setTitle("Start", for: .normal)
            stopButton.setTitle("Reset", for: .normal)
        }
    }
    
    @objc func startCounting()
    {
        second += 1
        if second == 60
        {
            minute += 1
            second = 0
        }
        
        if minute == 60
        {
            hour += 1
            minute = 0
        }
        
        timeText.text = add0(textnumber: hour.description) + ":" + add0(textnumber: minute.description) + ":" + add0(textnumber: second.description)
    }
    
    //Add 0 if the string has one char
    func add0(textnumber:String) -> String
    {
        var textNumber = textnumber
        
        if textnumber.count == 1
        {
            textNumber = "0" + textnumber
        }
        
        return textNumber
    }

    @objc func button1StopWatch()
    {
        //If the time has started and if the button is in green color
        if !is0 && startButton.backgroundColor == .green
        {
            //Set all to 0
            hour = 0
            minute = 0
            second = 0
            counterMark = 0
            mark = ""
            markText.text = ""
            
            timeText.text = add0(textnumber: hour.description) + ":" + add0(textnumber: minute.description) + ":" + add0(textnumber: second.description)
        }
        
        //If the time has started and if the button is in red
        else if(!is0 && startButton.backgroundColor == .red)
        {
            counterMark += 1
            

            
            mark += "Mark " + counterMark.description + "                                " + add0(textnumber: hour.description) + ":" + add0(textnumber: minute.description) + ":" + add0(textnumber: second.description) + "\n"
            
            markText.text = mark.description
            
            //Reset mark when the number can be mod for 13
            if counterMark % 13 == 0 {
                mark = ""
            }
        }
    }
}

