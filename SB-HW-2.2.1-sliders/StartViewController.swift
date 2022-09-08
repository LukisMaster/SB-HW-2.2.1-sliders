//
//  StartViewController.swift
//  SB-HW-2.2.1-sliders
//
//  Created by Sergey Nestroyniy on 08.09.2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! EditViewController
        editVC.delegate = self
    }
    
}

extension StartViewController : EditViewControllerDelegate {
    func saveColor(color: UIColor) {
        view.backgroundColor = color
        
    }
}


