//
//  ViewController.swift
//  SB-HW-2.2.1-sliders
//
//  Created by Sergey Nestroyniy on 03.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: colorView
        colorView.layer.cornerRadius = 16
        
        // MARK: sliders
        redSlider.value = 70
        greenSlider.value = 135
        blueSlider.value = 200
        colorViewUpdate()
        
        // MARK: labels
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))

    }
    
    func colorViewUpdate () {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        colorViewUpdate()
        switch sender.tag {
        case 0: redLabel.text = String(Int(sender.value))
        case 1: greenLabel.text = String(Int(sender.value))
        case 2: blueLabel.text = String(Int(sender.value))
        default: fatalError("неизвестный слайдер")
        }
    }
    
}
