//
//  Double.swift
//  FloatButton
//
//  Created by Wai Thura Tun on 7/25/24.
//

import Foundation

extension Double {
    func toString(_ decimalPoint: UInt32 = 1) -> String {
        return String(format: "%.\(decimalPoint)f", self)
    }
}
