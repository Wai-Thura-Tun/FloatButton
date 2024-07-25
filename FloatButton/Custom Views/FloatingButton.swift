//
//  FloatingButton.swift
//  FloatButton
//
//  Created by Wai Thura Tun on 7/25/24.
//

import Foundation
import UIKit

class FloatingButton: UIButton {
    private let badge: UIView = .init()
    
    init(image: UIImage?, bgColor: UIColor = .white, cornerRadius: CGFloat = 5, tintColor: UIColor = .black) {
        super.init(frame: .zero)
        self.setImage(image, for: .normal)
        self.backgroundColor = bgColor
        self.tintColor = tintColor
        self.addShadow()
        self.layer.cornerRadius = cornerRadius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setBadgeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(_ superview: UIView) {
        superview.addSubview(self)
        setUpContraints(in: superview)
    }
    
    func remove() {
        NSLayoutConstraint.deactivate(self.constraints)
        self.removeFromSuperview()
    }
    
    private func setBadgeView() {
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.backgroundColor = .red
        badge.layer.cornerRadius = 4
        self.addSubview(badge)
        
        NSLayoutConstraint.activate([
            badge.widthAnchor.constraint(equalToConstant: 8),
            badge.heightAnchor.constraint(equalToConstant: 8),
            badge.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            badge.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpContraints(in superview: UIView) {
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(
                equalTo: superview.trailingAnchor,
                constant: -20
            ),
            self.bottomAnchor.constraint(
                equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
                constant: -20
            ),
            self.widthAnchor.constraint(equalToConstant: 50),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
