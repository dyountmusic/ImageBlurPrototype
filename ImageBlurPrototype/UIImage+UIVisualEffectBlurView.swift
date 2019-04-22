//
//  UIImage+UIVisualEffectBlurView.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/22/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func applyBlur() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blurView)
    }

}
