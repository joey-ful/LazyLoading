//
//  ImageLoader.swift
//  LazyLoading
//
//  Created by 홍정아 on 2021/08/12.
//

import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    var cache: [URL:UIImage] = [:]
    
    func loadImage(imagePath: URL, completionHandler: @escaping (UIImage) -> ()) {
        if let imageView = cache[imagePath] {
            DispatchQueue.main.async {
                completionHandler(imageView)
            }
        } else {
            URLSession.shared.dataTask(with: imagePath) { (data, response, error) in
                guard error == nil else { return }
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                      (200..<300).contains(statusCode) else { return }
                guard let data = try? Data(contentsOf: imagePath) else { return }
                guard let imageView = UIImage(data: data) else { return }
                
                self.cache[imagePath] = imageView
                
                DispatchQueue.main.async {
                    completionHandler(imageView)
                }
                
            }.resume()
        }
    }
}
