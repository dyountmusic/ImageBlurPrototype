//
//  ViewController.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class HeroImageViewController: UIViewController, ImageBlurDelegate {

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

    @IBAction func blurOptionsButtonTapped(_ sender: Any) {
        let popoverView = BlurOptionsTableViewController()
        popoverView.modalPresentationStyle = .popover
        popoverView.popoverPresentationController?.barButtonItem = self.navigationItem.leftBarButtonItem
        popoverView.blurDelegate = self
        self.present(popoverView, animated: true, completion: nil)
    }

    @IBAction func resetImageButtonTapped(_ sender: Any) {
        resetImage()
    }

    func blur(withOption: BlurOptions) {
        resetImage()
        switch withOption {
        case .apple:
            heroImageView.image = heroImageView.image?.applyDarkEffect()
        case .uiVisualEffect:
            heroImageView.applyUIVisualEffectBlur()
        }
    }
}
