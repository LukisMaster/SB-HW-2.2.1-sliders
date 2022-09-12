//
//  ViewController.swift
//  SB-HW-2.2.1-sliders
//
//  Created by Sergey Nestroyniy on 03.09.2022.
//

import UIKit

protocol EditViewControllerDelegate : AnyObject {
    func saveColor (color: [CGFloat])
}

class EditViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redText: UITextField!
    @IBOutlet var greenText: UITextField!
    @IBOutlet var blueText: UITextField!
    
    
    weak var delegate : EditViewControllerDelegate?
    
    var rgba : [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 16
        
        slidersUpdate()
        colorViewUpdate()
        labelsUpdate()
        textFieldsUpdate()
    }
    
    // MARK: Private func
    private func colorViewUpdate () {
        colorView.backgroundColor = UIColor(red: rgba[0]/255, green: rgba[1]/255, blue: rgba[2]/255, alpha: rgba[3]/255)
    }
    
    private func labelsUpdate () {
        redLabel.text = String(Int(rgba[0]))
        greenLabel.text = String(Int(rgba[1]))
        blueLabel.text = String(Int(rgba[2]))
    }
    
    private func slidersUpdate () {
        redSlider.value = Float(rgba[0])
        greenSlider.value = Float(rgba[1])
        blueSlider.value = Float(rgba[2])
    }
 
    private func textFieldsUpdate () {
        redText.text = String(Int(rgba[0]))
        greenText.text = String(Int(rgba[1]))
        blueText.text = String(Int(rgba[2]))
    }
    
    
    
    // MARK: Action func
    @IBAction func changeSlider(_ sender: UISlider) {
        rgba[sender.tag] = CGFloat(sender.value)
        colorViewUpdate()
        textFieldsUpdate()
        labelsUpdate ()
    }
    
    @IBAction func changeTextField(_ sender: UITextField) {
        rgba[sender.tag] = CGFloat(Int(sender.text!)!)
        colorViewUpdate()
        slidersUpdate()
        labelsUpdate ()
    }
    
    // MARK: Delegate func
    @IBAction func doneButton() {
        delegate?.saveColor(color: rgba)
        dismiss(animated: true)
    }
    
}
