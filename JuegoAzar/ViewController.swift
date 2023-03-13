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
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    //guarda el valor del slider
    var currentValue: Int = 0
    //valor objetivo es el valor que el usuario debe atinarle
    var targetValue = 0
    //variable para guardar la puntuacion total en lo que va de las rondas jugadas
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configuracion personlizada del slider
        let imagenNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(imagenNormal, for: .normal)
        
        let imagenSeleccionado = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(imagenSeleccionado, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let tracketLeftImage = UIImage(named: "SliderTrackLeft")!
        let tracketResizable = tracketLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(tracketResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        //mandamos llamar el metodo para iniciar la ronda numero 1
        startNewgame()
    }
    
    //metodo que usamos para crear una nueva ronda
    //seteamos todos lo valores por defecto y mandamos llamar aun nuevo numero aletorio
    func startNewRound(){
        self.round += 1
        self.targetValue = Int.random(in: 1...100)
        self.currentValue = 50
        self.slider.value = Float(currentValue)
        updateLabels()
    }
    
    //metodo para asiganar el valor correspondiente a todas las label que tenemos en storyboard
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewgame(){
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    @IBAction func showAlert(){
        
        //la funcion abs calcula el valor absoluto que es un entero sin signo
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "Perfecto"
            points += 100
        } else if difference < 5 {
            title = "Casi lo tienes"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Buen Trabajo"
        } else {
            title = "Ni Serca Mejora"
        }
        
        self.score += points
        
//        let message = "El valor del slider is now \(currentValue)" + "\nel valor objetivo es \(targetValue)" + "\nLa diferencia es \(difference)"
        let message = "Tu puntuacion en esta ronda es de \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //pasar una funcion como parametro a otra funcion es un callback
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            //depues que presentamos todo la infomacion, mandamos llamar el metodo para iniciar una nueva ronda
            //con este clouser que es una funcion que guarda el contexto de su funcion padre
            //podemos hacer que se detenga la ejecucion de la app hasta que presionemos el boton de ok
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //depues que presentamos todo la infomacion, mandamos llamar el metodo para iniciar una nueva ronda
        
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        print("El valor del slider is now \(sender.value)")
    }
    
    
    @IBAction func starrOver(_ sender: UIButton) {
        startNewgame()
    }
    
    
}

