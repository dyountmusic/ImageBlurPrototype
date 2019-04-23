//
//  UIImageView+UIVisualEffectBlurView.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/22/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func applyUIVisualEffectBlur(with option: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: option)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blurView)
        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

}
