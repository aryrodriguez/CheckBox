//
//  ViewController.swift
//  CheckBoxButton
//
//  Created by Ary on 17/07/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let checkBox = CheckBox(frame: CGRect(x: 112, y: 340, width: 30, height: 30))
        checkBox.isChecked = false
        checkBox.addTarget(self, action: #selector(self.tapAction(checkbox:)), for: .valueChanged)

        let blackCheckBox = CheckBox(frame: CGRect(x: 152, y: 340, width: 30, height: 30))
        blackCheckBox.color = .black
        let greenCheckBox = CheckBox(frame: CGRect(x: 192, y: 340, width: 30, height: 30))
        greenCheckBox.color = .green
        let redCheckBox   = CheckBox(frame: CGRect(x: 232, y: 340, width: 30, height: 30))
        redCheckBox.color = .red
        
        
        view.addSubview(checkBox)
        view.addSubview(blackCheckBox)
        view.addSubview(greenCheckBox)
        view.addSubview(redCheckBox)
        
        
       
        
    }

    @objc func tapAction(checkbox:CheckBox)
    {
        label.text = (!checkbox.isChecked).description
    }
    
}

