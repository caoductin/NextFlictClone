//
//  UIImage+Extensions.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 16/1/25.
//

import Foundation
import UIKit
extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
