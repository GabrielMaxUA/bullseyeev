//  ViewController.swift
//  BullsEye
//
//  Created by Max Gabriel on 2024-05-21.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var num = 0
    var score = 0
    var round = 0
    @IBOutlet var slot: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var total: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var info: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
    }

    @IBAction func showAlert(){
        let difference = abs(num - currentValue)
        let points = 100 - difference
        score += points
        round += 1
        let message = "You set your number at: \(currentValue)" +
        "\nThe target number is: \(num)" +
        "\nYou got \(points) points"
        let alert = UIAlertController(
            title: "Hello World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK!",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startOver()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        num = Int.random(in: 1...100)
        currentValue = 0
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func updateLabels(){
        slot.text = "\(num)"
        total.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    @IBAction func infoPrint(){
        let info = "To play the game you need to slide the bar" +
        "\nto the approximate desired number location"
        let alert = UIAlertController(
            title: "How to play",
            message: info,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

