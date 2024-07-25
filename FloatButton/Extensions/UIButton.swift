//
//  UIButton.swift
//  FloatButton
//
//  Created by Wai Thura Tun on 7/25/24.
//

import Foundation
import UIKit

extension UIButton {
    
    func addShadow(
        color: UIColor = .black,
        offset: CGSize = .init(width: 0, height: 0),
        opacity: Float = 0.4,
        radius: CGFloat = 5
    )
    {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius =  radius
    }
}
