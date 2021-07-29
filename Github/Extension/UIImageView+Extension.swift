//
//  UIImageView+extension.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Kingfisher
import UIKit


// MARK: - UIImageView image downloader from URL's
extension UIImageView {
    func setImage(fromString string: String?, withPlaceholderImage placeholder: UIImage? = nil) {
        guard let string = string, let url = URL(string: string) else {
            self.contentMode = .scaleAspectFit
            self.image = placeholder
            return }
        
        
        self.kf.indicatorType = .activity

        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                break
               // print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let _):
                self.contentMode = .scaleAspectFit
                self.image = placeholder
               // print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
