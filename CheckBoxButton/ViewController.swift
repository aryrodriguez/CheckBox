//
//  ViewController.swift
//  CheckBoxButton
//
//  Created by Ary on 16/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var whiteLabel: UILabel!
    var blackLabel: UILabel!
    var redLabel: UILabel!
    var greenLabel: UILabel!
    var blueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureCheckBox()
        configureLabel()
    }

    func configureCheckBox(){
        
        let whiteCheckBox = CheckBoxButton(frame: CGRect(x: 80, y: 200, width: 30, height: 30))
        whiteCheckBox.addTarget(self, action: #selector(whiteCheck(_:)), for: .valueChanged)
     
        let blackCheckBox = CheckBoxButton(frame: CGRect(x: 80, y: 250, width: 30, height: 30))
        blackCheckBox.color = .black
        blackCheckBox.addTarget(self, action: #selector(blackCheck(_:)), for: .valueChanged)
        
        let redCheckBox = CheckBoxButton(frame: CGRect(x: 80, y: 300, width: 30, height: 30))
        redCheckBox.color = .red
        redCheckBox.addTarget(self, action: #selector(redCheck(_:)), for: .valueChanged)
        
        let greenCheckBox = CheckBoxButton(frame: CGRect(x: 80, y: 350, width: 30, height: 30))
        greenCheckBox.color = .greenColor
        
        greenCheckBox.addTarget(self, action: #selector(greenCheck(_:)), for: .valueChanged)
        
        
        let blueCheckBox = CheckBoxButton(frame: CGRect(x: 80, y: 400, width: 30, height: 30))
        blueCheckBox.color =  .blueColor
        blueCheckBox.addTarget(self, action: #selector(blueCheck(_:)), for: .valueChanged)
        
        
        
        blackCheckBox.checkMark = .heavy
        greenCheckBox.checkMark = .heavy
        
        view.addSubview(whiteCheckBox)
        view.addSubview(blackCheckBox)
        view.addSubview(redCheckBox)
        view.addSubview(greenCheckBox)
        view.addSubview(blueCheckBox)
        
    }
    
    func configureLabel() {
        
        whiteLabel = UILabel(frame: CGRect(x: 130, y: 200, width: 100, height: 21))
        whiteLabel.text = "white"
        
        blackLabel = UILabel(frame: CGRect(x: 130, y: 250, width: 100, height: 21))
        blackLabel.text = "black"
        
        redLabel = UILabel(frame: CGRect(x: 130, y: 300, width: 100, height: 21))
        redLabel.text = "red"
        
        greenLabel = UILabel(frame: CGRect(x: 130, y: 350, width: 100, height: 21))
        greenLabel.text = "green"
        
        blueLabel = UILabel(frame: CGRect(x: 130, y: 400, width: 100, height: 21))
        blueLabel.text = "blue"
        
        view.addSubview(whiteLabel)
        view.addSubview(blackLabel)
        view.addSubview(redLabel)
        view.addSubview(greenLabel)
        view.addSubview(blueLabel)
    }
    
    @objc func whiteCheck(_ button:CheckBoxButton) {
        
        whiteLabel.isHidden = !button.isChecked
        
    }
    
    @objc func blackCheck(_ button:CheckBoxButton) {
        
        blackLabel.isHidden = !button.isChecked
        
    }
    
    @objc func redCheck(_ button:CheckBoxButton) {
        
        redLabel.isHidden = !button.isChecked
        
    }
    
    @objc func greenCheck(_ button:CheckBoxButton) {
        
        greenLabel.isHidden = !button.isChecked
        
    }
    
    @objc func blueCheck(_ button:CheckBoxButton) {
        
        blueLabel.isHidden = !button.isChecked
        
    }
    
}


extension UIColor {
    
    
    public class var greenColor:UIColor {
        
        return UIColor(red: 0.1201601252, green: 0.6746216416, blue: 0.1585870385, alpha: 1)
    }
    
    public class var blueColor:UIColor {
        
        return UIColor(red: 0.07396946102, green: 0.5104116797, blue: 1, alpha: 1)
    }
}
