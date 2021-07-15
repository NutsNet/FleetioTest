//
//  Tool.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

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
