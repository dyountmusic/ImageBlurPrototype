//
//  BlurOptionsTableViewController.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/23/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

enum BlurOptions: String {
    case appleLight = "Light Blur "
    case appleDark = "Dark Blur "
    case appleExtraLight = "Extra Light Blur "
    case uiVisualEffectLight = "Light Blur"
    case uiVisualEffectDark = "Dark Blur"
    case uiVisualEffectProminant = "Prominant Blur"
    case uiVisualEffectExtraLight = "Extra Light Blur"
}

protocol ImageBlurDelegate: class {
    func blur(withOption: BlurOptions)
}

class BlurOptionsTableViewController: UITableViewController {

    weak var blurDelegate: ImageBlurDelegate?

    var blurOptions: [BlurOptions] = [.appleLight, .appleDark, .appleExtraLight]
    var uiVisualEffectBlurOptions: [BlurOptions] = [.uiVisualEffectLight, .uiVisualEffectDark, .uiVisualEffectExtraLight, .uiVisualEffectProminant]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Apple Blur"
        } else if section == 1 {
            return "UI Visual Effect Blur"
        } else { return "" }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return blurOptions.count
        } else if section == 1 {
            return uiVisualEffectBlurOptions.count
        } else { return 0 }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "blurOptionsCell", for: indexPath) as? BlurOptionsTableViewCell else  { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.textLabel?.text = blurOptions[indexPath.row].rawValue
            cell.blurOption = blurOptions[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = uiVisualEffectBlurOptions[indexPath.row].rawValue
            cell.blurOption = uiVisualEffectBlurOptions[indexPath.row]
        } else { return cell }

        setupSize()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BlurOptionsTableViewCell else { return }
        guard let blurOption = cell.blurOption else { return }
        blurDelegate?.blur(withOption: blurOption)
        dismiss(animated: true, completion: nil)
    }
}

extension BlurOptionsTableViewController {
    func setupTableView() {
        tableView.register(BlurOptionsTableViewCell.self, forCellReuseIdentifier: "blurOptionsCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setupSize() {
        let height = tableView.contentSize.height
        let size = CGSize(width: 300, height: height)
        self.preferredContentSize = size
    }
}
