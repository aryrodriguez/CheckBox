//
//  CheckButton.swift
//  CheckBoxButton
//
//  Created by Ary on 16/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    
    var titleColor: UIColor = .black
    var backColor: UIColor = .white
    var checkMark: CheckMark = .normal {
        
        didSet{
            setTitle(checkMark.rawValue, for: .normal)
        }
    }
    var isChecked: Bool = true {
        
        didSet
        {
            if isChecked {
                
                 setTitle(checkMark.rawValue, for: .normal)
                 self.backgroundColor = self.backColor
            }
            else {
                
                 setTitle("", for: .normal)
                 self.backgroundColor = .white
            }
            self.sendActions(for: .valueChanged)
        }
    }
    var color: UIColor = .black {
        didSet
        {
            self.titleColor = .white
            setTitleColor(titleColor, for: .normal)
            self.backColor = self.color
            self.backgroundColor = self.backColor
            layer.borderColor = color.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
       
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        layer.borderColor = color.cgColor
        layer.borderWidth = 1.0
        setTitleColor(titleColor, for: .normal)
        setTitle(checkMark.rawValue, for: .normal)
        let size = frame.size.height < frame.size.width ? frame.size.height / 2 : frame.size.width / 2
        titleLabel?.font = UIFont.systemFont(ofSize: size)
        layer.cornerRadius = 5.0
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.isChecked.toggle()
    }
}


enum CheckMark:String {
    
    case normal = "✓"
    case heavy = "✔︎"
}
