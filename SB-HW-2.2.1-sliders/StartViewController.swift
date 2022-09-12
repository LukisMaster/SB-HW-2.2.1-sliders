//
//  StartViewController.swift
//  SB-HW-2.2.1-sliders
//
//  Created by Sergey Nestroyniy on 08.09.2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    private(set) var rgba : [CGFloat] = [255, 255, 255, 255]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(red: rgba[0]/255, green: rgba[1]/255, blue: rgba[2]/255, alpha: rgba[3]/255)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! EditViewController
        editVC.delegate = self
        editVC.rgba = rgba
    }

}

extension StartViewController : EditViewControllerDelegate {
    func saveColor(color: [CGFloat]) {
        rgba = color
    }
}


