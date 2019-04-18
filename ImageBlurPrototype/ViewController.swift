//
//  ViewController.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }

    func setupImageView() {
        let image = UIImage(named: "hero")
        heroImageView.image = image
        heroImageView.contentMode = .scaleAspectFit
        heroImageView.blur()
    }


}

extension UIImageView {

    func blur() {
        print("Blurring image")
    }

}

