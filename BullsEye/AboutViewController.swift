//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Max Gabriel on 2024-05-27.
//
    import UIKit

    class AboutViewController: UIViewController {
      @IBAction func close() {
        dismiss(animated: true, completion: nil)
      }
    }

//    @IBAction func infoPrint(){
//        let info = "To play the game you need to slide the bar" +
//        "\nto the approximate desired number location"
//        let alert = UIAlertController(
//            title: "How to play",
//            message: info,
//            preferredStyle: .alert)
//        
//        let action = UIAlertAction(
//            title: "OK",
//            style: .default,
//            handler: nil)
//        
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
//
//}
