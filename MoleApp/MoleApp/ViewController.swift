//
//  ViewController.swift
//  MoleApp
//
//  Created by Peluso, Bartholomew C on 2/24/20.
//  Copyright © 2020 Peluso, Bartholomew C. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // variables
    var score:Int = 0
    var counter:Int = 30
    var name:String = ""
    var timer = Timer()
    var isTimerRunning:Bool = false //This will be used to make sure only one timer is created at a time.
    var binary = 0
     var chars:Int = Int(arc4random_uniform(5) + 1)
    
    
    

    
    
    // outlets
    
    
    @IBOutlet weak var myName: UITextField!
    
    @IBOutlet weak var myGreeting: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var moleULbutton: UIButton!
 
    @IBOutlet weak var moleURbutton: UIButton!
    
    @IBOutlet weak var moleMbutton: UIButton!
    
    @IBOutlet weak var moleDLbutton: UIButton!
    
    @IBOutlet weak var moleDRbutton: UIButton!
    
    
    @IBOutlet weak var myStart: UIButton!
    
    
    
       // actions part 1
    @IBAction func mySubmit(_ sender: UIButton) {
        
        
        name = myName.text!
           
                  myGreeting.text = "Hey, \(name)!"
                  myName.resignFirstResponder()
    }
    
    
    @IBAction func mySwitch(_ sender: UISwitch) {
        
        
           if sender.isOn {
          binary = 1
              }
           else {
            binary = 0
        }
            
    //code
        
        
    }
    
    
    
    @IBAction func myStart(_ sender: UIButton) {
        
        
        if isTimerRunning == false && binary == 1{
        runTimer()
        }
        
        moleULbutton.isHidden = true
        moleURbutton.isHidden = true
        moleMbutton.isHidden = true
        moleDLbutton.isHidden = true
        moleDRbutton.isHidden = true
        
       
        
Hide()
        
        
    }
    
    
    func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
   
    }
    
    @objc func updateTimer() {
        counter -= 1
        timerLabel.text = "\(counter)"
        if(counter == 0) {
            timerLabel.text = "STOP!"
           
           
                   moleULbutton.isHidden = true
                   moleURbutton.isHidden = true
                   moleMbutton.isHidden = true
                   moleDLbutton.isHidden = true
                   moleDRbutton.isHidden = true
            
            if timerLabel.text == "STOP!" {
                      myStart.isHidden = true
                   }
            
             timer.invalidate()
        }
    }
   
    
    
    
    @IBAction func myRestart(_ sender: Any) {
        
        score = 0
        myScore.text = "\(score)"
        timer.invalidate()
        counter = 30
        timerLabel.text = "0"
        isTimerRunning = false
        
              moleULbutton.isHidden = false
              moleURbutton.isHidden = false
              moleMbutton.isHidden = false
              moleDLbutton.isHidden = false
              moleDRbutton.isHidden = false
        
        myStart.isHidden = false
        
              
    }
    
    
           
    // actions part 2
    func didScore(points:Int){
       score = score + points
       myScore.text = "\(score)"
    }
    
    func Hide(){
        
        if chars == 1{
            moleULbutton.isHidden = false
            
            
        }
        
        if chars == 2{
            moleURbutton.isHidden = false
        }
        
        if chars == 3{
            moleMbutton.isHidden = false
        }
        
        if chars == 4{
            moleDLbutton.isHidden = false
        }
        
        if chars == 5{
            moleDRbutton.isHidden = false
        }
        
        
        
    }
    
    func Rando(){
        
        chars = Int(arc4random_uniform(5) + 1)
    }
    
    
    
    @IBAction func moleUL(_ sender: UIButton) {
        
  didScore(points:1)
        moleULbutton.isHidden = true
          Rando()
        Hide()
        
    }
    
    
    @IBAction func moleUR(_ sender: UIButton) {
         didScore(points:1)
        moleURbutton.isHidden = true
       Rando()
          Hide()
        
    }
    
     
    @IBAction func moleM(_ sender: UIButton) {
         didScore(points:1)
        moleMbutton.isHidden = true
       Rando()
          Hide()
        
    }
    
    
    @IBAction func moleDL(_ sender: UIButton) {
         didScore(points:1)
        moleDLbutton.isHidden = true
        Rando()
    Hide()
        
    }
    
    
    @IBAction func moleDR(_ sender: UIButton) {
         didScore(points:1)
        moleDRbutton.isHidden = true
      Rando()
        Hide()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

