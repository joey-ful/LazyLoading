//
//  MyCell.swift
//  LazyLoading
//
//  Created by 홍정아 on 2021/08/12.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    let imageURLs = [
        "https://wallpaperaccess.com/download/europe-4k-1369012",
        "https://wallpaperaccess.com/download/europe-4k-1318341",
        "https://wallpaperaccess.com/download/europe-4k-1379801"
    ]
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func prepareForReuse() {
        self.cellLabel.text = .none
        self.cellImageView.image = .none
        self.backgroundColor = .none
    }
    
    func updateImage(at indexPath: IndexPath, of tableView: UITableView) {
        guard let imagePath = URL(string: imageURLs[indexPath.row]) else {
            return
        }
        
        ImageLoader.shared.loadImage(imagePath: imagePath) { imageView in
            if indexPath == tableView.indexPath(for: self) {
                self.cellImageView.image = imageView
            }
        }
    }
    
    func updateLabelAndBackground(at indexPath: IndexPath) {
        if indexPath.section <= 4 {
            self.cellLabel.text = "Section \(indexPath.section) Row \(indexPath.row)"
        }

        if indexPath.row == 3 {
            self.backgroundColor = .red
        }
    }
}
