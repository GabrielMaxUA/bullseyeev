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
    var round = 1
    @IBOutlet var slot: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var total: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var info: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert() {
        let difference = abs(num - currentValue)
        var points = 100 - difference

      // add these lines
        let title: String
            if difference == 0 {
                title = "Perfect!"
                points += 100                   // add this line
            } 
            else if difference < 5 {
                title = "You almost had it!"
                if difference == 1 {            // add these lines
                    points += 50                  // add these lines
                }                               // add these lines
            } 
            else if difference < 10 {
                title = "Pretty good!"
            } 
            else {
                title = "Not even close..."
            }
            score += points
            round += 1

        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,  // change this
            message: message,
            preferredStyle: .alert)

        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
            self.startOver()
        })

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
    
    @IBAction func startNewGame() {
      score = 0
      round = 1
      startOver()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
          name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
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

