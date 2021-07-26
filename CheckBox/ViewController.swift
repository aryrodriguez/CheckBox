//
//  ViewController.swift
//  CheckBox
//
//  Created by Ary on 16/07/21.
//  Copyright © 2021 Ary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        
        let square = CheckBox()
        square.addTarget(self, action: #selector(didCheck(_:)), for: .touchUpInside)
        square.center = view.center
        view.addSubview(square)
        
        let circle = CheckBox(frame: CBRect(x: 175, y: 286, size: 25))
        circle.addTarget(self, action: #selector(didCheck(_:)), for: .touchUpInside)
        circle.style = .circle
        circle.color = .systemRed
        view.addSubview(circle)
        
        let checkMark = CheckBox(frame: CBRect(x: 175, y: 356, size: 25), style: .checkmark)
        checkMark.addTarget(self, action: #selector(didCheck(_:)), for: .touchUpInside)
        checkMark.color = .systemGreen
        view.addSubview(checkMark)
        
        
    }

    
    @IBAction func didCheck(_ checkBox: CheckBox) {
    
        print(checkBox.isChecked)
    }

    
   
    
    
}

