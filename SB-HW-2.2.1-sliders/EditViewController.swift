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
        
        addDoneButtonToKeyboard(textFields: redText, greenText, blueText)
    }
    
    // MARK: Private func
    private func colorViewUpdate () {
        colorView.backgroundColor = UIColor(red: rgba[0]/255, green: rgba[1]/255, blue: rgba[2]/255, alpha: rgba[3]/255)
    }
    
    // MARK: Labels Update
    private func labelsUpdate () {
        redLabel.text = String(Int(rgba[0]))
        greenLabel.text = String(Int(rgba[1]))
        blueLabel.text = String(Int(rgba[2]))
    }
    
    private func labelUpdate (colorTagIndex: Int) {
        switch colorTagIndex {
        case 0: redLabel.text = String(Int(rgba[colorTagIndex]))
        case 1: greenLabel.text = String(Int(rgba[colorTagIndex]))
        case 2: blueLabel.text = String(Int(rgba[colorTagIndex]))
        default: fatalError()
        }
    }
    
    // MARK: Sliders update
    private func slidersUpdate () {
        redSlider.value = Float(rgba[0])
        greenSlider.value = Float(rgba[1])
        blueSlider.value = Float(rgba[2])
    }
    
    private func sliderUpdate (colorTagIndex: Int)  {
        switch colorTagIndex {
        case 0: redSlider.value = Float(rgba[colorTagIndex])
        case 1: greenSlider.value = Float(rgba[colorTagIndex])
        case 2: blueSlider.value = Float(rgba[colorTagIndex])
        default: fatalError()
        }
    }
    
    // MARK: Text fields update
    private func textFieldsUpdate () {
        redText.text = String(Int(rgba[0]))
        greenText.text = String(Int(rgba[1]))
        blueText.text = String(Int(rgba[2]))
    }
    
    private func textFieldUpdate (colorTagIndex: Int) {
        switch colorTagIndex {
        case 0: redText.text = String(Int(rgba[colorTagIndex]))
        case 1: greenText.text = String(Int(rgba[colorTagIndex]))
        case 2: blueText.text = String(Int(rgba[colorTagIndex]))
        default: fatalError()
        }
    }
    
    private func addDoneButtonToKeyboard (textFields: UITextField...) {
        textFields.forEach { textField in
            let doneButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let toolBarForKeyboard = UIToolbar()
            toolBarForKeyboard.sizeToFit()
            toolBarForKeyboard.items = [flexSpace, doneButtonItem]
            textField.inputAccessoryView = toolBarForKeyboard
            
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
                                                 
    
    
    // MARK: Action func
    @IBAction func changeSlider(_ sender: UISlider) {
        rgba[sender.tag] = CGFloat(sender.value)
        colorViewUpdate()
        textFieldsUpdate()
        labelsUpdate ()
    }
    
    // MARK: Delegate func
    @IBAction func doneButton() {
        delegate?.saveColor(color: rgba)
        dismiss(animated: true)
    }
    
}

extension EditViewController : UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let colorChannelIndex = textField.tag
        guard let textColor = textField.text, textColor.count > 0 else {
            textFieldUpdate(colorTagIndex: colorChannelIndex)
            return
        }
        var uIntColor = UInt(textColor)!
        if uIntColor > 255 {
            uIntColor = 255
            textField.text = "255"
        }
        rgba[colorChannelIndex] = CGFloat(uIntColor)
        colorViewUpdate()
        sliderUpdate(colorTagIndex: colorChannelIndex)
        labelUpdate(colorTagIndex: colorChannelIndex)
    }
    
}
