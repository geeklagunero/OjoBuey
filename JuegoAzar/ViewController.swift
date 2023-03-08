//
//  ViewController.swift
//  JuegoAzar
//
//  Created by Ricardo Roman Landeros on 08/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    //Etiqueta para mostrar el valor de targetValue
    @IBOutlet var targetLabel: UILabel!
    
    //guarda el valor del slider
    var currentValue: Int = 0
    //valor objetivo es el valor que el usuario debe atinarle
    var targetValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //mandamos llamar el metodo para iniciar la ronda numero 1
        startNewRound()
    }
    
    //metodo que usamos para crear una nueva ronda
    //seteamos todos lo valores por defecto y mandamos llamar aun nuevo numero aletorio
    func startNewRound(){
        self.targetValue = Int.random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(currentValue)
        updateLabels()
    }
    
    //metodo para asiganar el valor correspondiente a todas las label que tenemos en storyboard
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }
    
    @IBAction func showAlert(){
        let message = "El valor del slider is now \(currentValue)" + "\nel valor objetivo es \(targetValue)"
        let alert = UIAlertController(title: "Hello, Word", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //depues que presentamos todo la infomacion, mandamos llamar el metodo para iniciar una nueva ronda
        startNewRound()
    }

    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("El valor del slider is now \(sender.value)")
    }
    
}

