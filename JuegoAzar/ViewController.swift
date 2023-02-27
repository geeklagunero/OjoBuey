//
//  ViewController.swift
//  JuegoAzar
//
//  Created by Ricardo Roman Landeros on 08/02/23.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert(){
        let message = "El valor del slider is now \(currentValue)"
        let alert = UIAlertController(title: "Hello, Word", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("El valor del slider is now \(sender.value)")
    }
    
}

