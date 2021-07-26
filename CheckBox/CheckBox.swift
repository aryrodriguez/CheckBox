//
//  CheckBox.swift
//  CheckBox
//
//  Created by Ary on 16/07/21.
//  Copyright © 2021 Ary. All rights reserved.
//

import UIKit


class CheckBox: UIControl {
    
    enum CheckBoxStyle {
        case square, circle, checkmark
    }
    var isChecked: Bool = false {
        
        didSet{
            if isChecked {
                
                grow()
                
            } else {
                
                shrink()
            }
           sendActions(for: .touchUpInside)
        }
        
    }
    var style: CheckBoxStyle = .square {
        
        didSet {
            configureStyle()
        }
    }
    var color: UIColor = .systemBlue {
        
        didSet {
            configureColor()
        }
    }
    var borderWidth:CGFloat {
        get{
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    private var size: CGFloat = 25.0
    private var position:CGFloat {
        
        return size / 4
    }
    private var coreView: UIControl!
    private var checkmarkView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: self.size, height: self.size)))
        configure()
        configureStyle()
    
    }
    
    init(frame: CBRect, style: CheckBoxStyle = .square) {
        
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: frame.size, height: frame.size)))
        self.size = frame.size
        configure()
        configureStyle()
    }
    
    private func configure() {
        
        layer.borderWidth = size * 0.08
        layer.borderColor = color.cgColor
        layer.cornerRadius = size / 6
        backgroundColor = .clear
        let position = self.position * 2
        //the core of the checkBox
        coreView = UIControl()
        coreView.frame.origin = CGPoint(x: position, y: position)
        coreView.frame.size = .zero
        coreView.backgroundColor = color
        coreView.layer.cornerRadius = size / 8
        coreView.addTarget(self, action: #selector(didCheck), for: .touchUpInside)
        checkmarkView = UIImageView(image: .checkmark)
    
    }
    
    private func configureStyle() {
        
        coreView.removeFromSuperview()
        checkmarkView.removeFromSuperview()
        switch style {
        
        case .square:
            layer.cornerRadius = size / 6
            coreView.layer.cornerRadius = size / 8
            addSubview(coreView)
        case .circle:
            layer.cornerRadius = size / 2
            coreView.layer.cornerRadius = size / 4
            addSubview(coreView)
        case .checkmark:
            layer.cornerRadius = size / 6
            checkmarkView.tintColor = color
            checkmarkView.frame = .zero
            addSubview(checkmarkView)
        }
    }
    
    private func configureColor() {
        
        layer.borderColor = color.cgColor
        coreView.backgroundColor = color
        checkmarkView.tintColor = color
    }
    
    @IBAction func didCheck() {
        
        isChecked.toggle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        isChecked.toggle()
    }
    
    private func grow() {
        
        let size = self.size / 2
        if style == .checkmark {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.backgroundColor = self.color
                self.checkmarkView.frame.size = self.frame.size
               
            })
            
        } else {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.coreView.frame = CGRect(x: self.position, y: self.position, width: size, height: size)
            })
        }
    }
    
    private func shrink() {
        
        let position = self.position * 2
        
        if style == .checkmark {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.backgroundColor = .clear
                self.checkmarkView.frame.size = .zero
                
            })
            
        } else {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.coreView.frame = CGRect(origin: CGPoint(x: position, y: position), size: .zero)
            })
        }

    }
    
    
}


struct CBRect {
    
    var origin: CGPoint
    var size: CGFloat
    
    init(x: CGFloat, y: CGFloat, size: CGFloat) {
        self.origin = CGPoint(x: x, y: y)
        self.size = size
    }
}
