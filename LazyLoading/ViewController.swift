//
//  ViewController.swift
//  LazyLoading
//
//  Created by 홍정아 on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    // MARK: Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    // MARK: Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellImageView.image = UIImage(systemName: "photo")
        cell.updateLabelAndBackground(at: indexPath)
        
        if indexPath.row <= 2 {
            cell.updateImage(at: indexPath, of: tableView)
        }

        return cell
    }
}
