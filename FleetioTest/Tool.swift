//
//  Tool.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

extension UIColor {
    convenience init(rgb: Int, a: CGFloat = 1) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF, a: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: a)
    }
}

class Tool: NSObject {
    var currentDeviceWt: CGFloat = 0
    var currentDeviceHt: CGFloat = 0
    
    static let shared = Tool()
    override init() {
        super.init()
        
        // Set device size
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            currentDeviceWt = UIScreen.main.bounds.width
            currentDeviceHt = UIScreen.main.bounds.height
        } else {
            currentDeviceWt = UIScreen.main.bounds.height
            currentDeviceHt = UIScreen.main.bounds.width
        }
    }
}
