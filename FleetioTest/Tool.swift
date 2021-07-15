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

enum Orientation { case none, portrait, landscape }

class Tool: NSObject {
    var orientation = Orientation.none
    
    var currentDeviceWt: CGFloat = 0
    var currentDeviceHt: CGFloat = 0
    
    static let shared = Tool()
    override init() {
        super.init()
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.checkDeviceOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        // Set device size
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            currentDeviceWt = UIScreen.main.bounds.width
            currentDeviceHt = UIScreen.main.bounds.height
        } else {
            currentDeviceWt = UIScreen.main.bounds.height
            currentDeviceHt = UIScreen.main.bounds.width
        }
    }
    
    @objc private func checkDeviceOrientation() {
        if (UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown) && orientation != .portrait {
            orientation = .portrait
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateOrientation"), object: nil)
        } else if (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight) && orientation != .landscape {
            orientation = .landscape
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateOrientation"), object: nil)
        }
    }
    
}
