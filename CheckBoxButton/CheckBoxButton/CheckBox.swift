//
//  CheckBox.swift
//  CheckBoxButton
//
//  Created by Ary on 17/07/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

     var isChecked: Bool
    {
        willSet
        {
           self.sendActions(for: .valueChanged)
        }
        didSet
        {
            if !isChecked{setUnCheckedState()}
        }
    }
    
   var color:UIColor
    {
        didSet
        {
            backgroundColor = color
            layer.borderColor = color.cgColor
        }
    }
    

    override init(frame: CGRect) {
        isChecked = true
        color = UIButton().tintColor
        super.init(frame: frame)
        setCheckedState()
    }
    
    required init?(coder aDecoder: NSCoder){
      isChecked = true
      color = UIButton().tintColor
      super.init(coder: aDecoder)
      setCheckedState()
    }
  
   
    
    private func setCheckedState()
    {
        backgroundColor = color
        setTitleColor(.white, for: .normal)
        setTitle("✓", for: .normal)
        let size = frame.size.height < frame.size.width ? frame.size.height : frame.size.width
        titleLabel?.font = UIFont.systemFont(ofSize: size)
        layer.cornerRadius = 5
    }
    
    private func setUnCheckedState()
    {
        setTitle("", for: .normal)
        layer.borderColor = color.cgColor
        backgroundColor = .white
        layer.borderWidth = 1.0
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.3, animations:
        {
            if self.isChecked
            {
               self.setUnCheckedState()
            }
            else{
                self.setCheckedState()
            }
        })
         self.isChecked.toggle()
    }
    
  

    
    
    
}
