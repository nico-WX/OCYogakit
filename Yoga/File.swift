//
//  File.swift
//  Yoga
//
//  Created by pwx on 2023/7/13.
//

import FlexLayout

class ACView:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.flex.define { flex in
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
