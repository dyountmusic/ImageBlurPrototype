//
//  BlurOptionsTableViewController.swift
//  ImageBlurPrototype
//
//  Created by Daniel Yount on 4/23/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

enum BlurOptions: String {
    case appleLight = "Apple Light Blur"
    case appleDark = "Apple Dark Blur"
    case appleExtraLight = "Apple Extra Light Blur"
    case uiVisualEffect = "UIVisualEffect Blur"
}

protocol ImageBlurDelegate: class {
    func blur(withOption: BlurOptions)
}

class BlurOptionsTableViewController: UITableViewController {

    weak var blurDelegate: ImageBlurDelegate?

    var blurOptions: [BlurOptions] = [.appleDark, .appleLight, .appleExtraLight, .uiVisualEffect]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blurOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "blurOptionsCell", for: indexPath) as? BlurOptionsTableViewCell else  { return UITableViewCell() }
        cell.textLabel?.text = blurOptions[indexPath.row].rawValue
        cell.blurOption = blurOptions[indexPath.row]
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
