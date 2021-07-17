//
//  Api.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit
import Alamofire

class Api: NSObject {
    var aApiFuelEntries = [FuelEntrie]()
    var aApiFilteredFuelEntries = [FuelEntrie]()
    
    var userLoc = [0.0, 0.0]
    
    static let shared = Api()
    override init() {
        super.init()
        
        
    }
    
    func apiGetFuelEntries(escap:@escaping (Bool) -> Void) {
        let url: String =  "https://secure.fleetio.com/api/v1/fuel_entries"
        
        let headers: HTTPHeaders = [
            "Account-Token": "798819214b",
            "Content-Type": "application/json",
            "Authorization": "Token token=a3ddc620b35b609682192c167de1b1f3f5100387",
            
        ]
        
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let aFuelEntries = value as? Array<Dictionary<String, Any>> {
                    for fe in aFuelEntries {
                        let fuelEntrie = FuelEntrie()
                        
                        if let date = fe["date"] { if date as? String != nil { fuelEntrie.date = date as! String }}
                        if let reference = fe["reference"] { if reference as? String != nil { fuelEntrie.reference = reference as! String }}
                        if let vendor_name = fe["vendor_name"] { if vendor_name as? String != nil { fuelEntrie.vendor_name = vendor_name as! String }}
                        if let vehicle_name = fe["vehicle_name"] { if vehicle_name as? String != nil { fuelEntrie.vehicle_name = vehicle_name as! String }}
                        if let fuel_type_name = fe["fuel_type_name"] { if fuel_type_name as? String != nil { fuelEntrie.fuel_type_name = fuel_type_name as! String }}
                        
                        if let cost_per_hr = fe["cost_per_hr"] { if cost_per_hr as? Double != nil { fuelEntrie.cost_per_hr = cost_per_hr as! Double }}
                        if let cost_per_mi = fe["cost_per_mi"] { if cost_per_mi as? Double != nil { fuelEntrie.cost_per_mi = cost_per_mi as! Double }}
                        
                        if let geolocation = fe["geolocation"] as? Dictionary<String, Any> {
                            if let latitude = geolocation["latitude"], let longitude = geolocation["longitude"] {
                                if latitude as? Double != nil { fuelEntrie.latitude = latitude as! Double }
                                if longitude as? Double != nil { fuelEntrie.longitude = longitude as! Double }
                            }
                        }
                        
                        fuelEntrie.distance_mi = self.apiGetDistance()
                        
                        self.aApiFuelEntries.append(fuelEntrie)
                        
                        //self.apiPrintFuelEntries()
                    }
                    
                    self.aApiFilteredFuelEntries = self.aApiFuelEntries
                    
                    escap(false)
                } else {
                    escap(true)
                }
            case .failure(let error):
                escap(true)
                print("Error in apiGetFuelEntries: \(error.localizedDescription)")
            }
        }
    }
    
    func apiGetDistance() -> Double {
        let distance: Double = -1
        return distance
    }
    
    func apiPrintFuelEntries() {
        for fe in aApiFuelEntries {
            print("********** ********** ********** **********")
            print("date                  : \(fe.date)")
            print("reference             : \(fe.reference)")
            print("vendor_name           : \(fe.vendor_name)")
            print("vehicle_name          : \(fe.vehicle_name)")
            print("fuel_type_name        : \(fe.fuel_type_name)")
            
            print("cost_per_hr           : \(fe.cost_per_hr)")
            print("cost_per_mi           : \(fe.cost_per_mi)")
            
            print("us_gallons            : \(fe.cost_per_hr)")
            print("price_per_volume_unit : \(fe.cost_per_mi)")
            
            print("latitude              : \(fe.latitude)")
            print("longitude             : \(fe.longitude)")
            print("distance_mi           : \(fe.distance_mi)")
        }
    }
}
