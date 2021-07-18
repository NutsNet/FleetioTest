//
//  FuelEntrie.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class FuelEntrie: NSObject {
    var date: String = "blank"
    var reference: String = "blank"
    var vendor_name: String = "blank"
    var vehicle_name: String = "blank"
    var fuel_type_name: String = "blank"
    
    var cost_per_hr: Double = -1
    var cost_per_mi: Double = -1
    
    var us_gallons: Double = -1
    var price_per_volume_unit: Double = -1
    
    var latitude: Double = -1
    var longitude: Double = -1
}
