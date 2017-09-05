//
//  FLEXButton.swift
//  MogoRenter
//
//  Created by song on 16/5/25.
//  Copyright © 2016年 MogoRoom. All rights reserved.
//

import UIKit
import FLEX


class FLEXButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addtagetForSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addtagetForSelf(){
        self.addTarget(self, action: #selector(selectTouch), for: .touchUpInside)
    }

    func selectTouch (){
        FLEXManager.shared().showExplorer()
    }
}
