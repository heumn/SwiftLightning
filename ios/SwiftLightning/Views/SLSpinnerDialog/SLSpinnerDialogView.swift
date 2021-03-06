//
//  SLSpinnerDialogView.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-21.
//  Copyright © 2018 BiscottiGelato. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable class SLSpinnerDialogView: NibView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = 15.0
    layer.masksToBounds = true
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 80.0, height: 80.0)
  }
  
  func show(on view: UIView) {    
    UIApplication.shared.beginIgnoringInteractionEvents()
    let displayView = UIApplication.shared.keyWindow ?? view
    displayView.addSubview(self)
    
    self.snp.makeConstraints { (make) in
      make.centerX.equalTo(displayView)
      make.centerY.equalTo(displayView).offset(-20)
    }
  }
  
  func remove() {
    UIApplication.shared.endIgnoringInteractionEvents()
    removeFromSuperview()
  }
}
