//
//  ViewController.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class HeroImageViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }

    func setupImageView() {
        let image = UIImage(named: "hero")
        heroImageView.image = image
        heroImageView.contentMode = .scaleAspectFill
    }

    private func resetImage() {
        setupImageView()
    }

    @IBAction func darkBlurButtonTapped(_ sender: Any) {
        resetImage()
        heroImageView.image = heroImageView.image?.applyDarkEffect()
    }

    @IBAction func lightBlurButtonTapped(_ sender: Any) {
        resetImage()
        heroImageView.applyBlur()
    }
}

