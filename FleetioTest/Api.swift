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
                        
                        self.aApiFuelEntries.append(fuelEntrie)
                    }
                    
                    self.aApiFilteredFuelEntries = self.aApiFuelEntries
                    
                    //self.apiPrintFuelEntries()
                    
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
            
            print("us_gallons            : \(fe.us_gallons)")
            print("price_per_volume_unit : \(fe.price_per_volume_unit)")
            
            print("latitude              : \(fe.latitude)")
            print("longitude             : \(fe.longitude)")
        }
    }
    
    func apiFilterNone() {
        aApiFilteredFuelEntries = aApiFuelEntries
    }
    
    func apiFilterFuel() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.fuel_type_name != "blank" {
                if aApiFilteredFuelEntries.count < 2 {
                    aApiFilteredFuelEntries.append(fe)
                } else {
                    for (idx, ffe) in aApiFilteredFuelEntries.enumerated() {
                        if fe.fuel_type_name == ffe.fuel_type_name {
                            aApiFilteredFuelEntries.insert(fe, at: idx)
                            break
                        } else  if idx == aApiFilteredFuelEntries.count - 1 {
                            aApiFilteredFuelEntries.append(fe)
                        }
                    }
                }
            }
        }
    }
    
    func apiFilterGallon() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.us_gallons != -1 {
                if aApiFilteredFuelEntries.count == 0 {
                    aApiFilteredFuelEntries.append(fe)
                } else {
                    for (idx, ffe) in aApiFilteredFuelEntries.enumerated() {
                        if fe.us_gallons > ffe.us_gallons {
                            aApiFilteredFuelEntries.insert(fe, at: idx)
                        } else {
                            aApiFilteredFuelEntries.append(fe)
                        }
                    }
                }
            }
        }
    }
    
    func apiFilterHr() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.cost_per_hr > 0 {
                if aApiFilteredFuelEntries.count == 0 {
                    aApiFilteredFuelEntries.append(fe)
                } else {
                    for (idx, ffe) in aApiFilteredFuelEntries.enumerated() {
                        if fe.cost_per_hr < ffe.cost_per_hr {
                            aApiFilteredFuelEntries.insert(fe, at: idx)
                            break
                        } else if idx == aApiFilteredFuelEntries.count - 1 {
                            aApiFilteredFuelEntries.append(fe)
                        }
                    }
                }
            }
        }
    }
    
    func apiFilterMi() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.cost_per_mi > 0 {
                if aApiFilteredFuelEntries.count == 0 {
                    aApiFilteredFuelEntries.append(fe)
                } else {
                    for (idx, ffe) in aApiFilteredFuelEntries.enumerated() {
                        if fe.cost_per_mi < ffe.cost_per_mi {
                            aApiFilteredFuelEntries.insert(fe, at: idx)
                            break
                        } else if idx == aApiFilteredFuelEntries.count - 1 {
                            aApiFilteredFuelEntries.append(fe)
                        }
                    }
                }
            }
        }
    }
    
    func apiFilterPrice() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.price_per_volume_unit != -1 {
                if aApiFilteredFuelEntries.count == 0 {
                    aApiFilteredFuelEntries.append(fe)
                } else {
                    for (idx, ffe) in aApiFilteredFuelEntries.enumerated() {
                        if fe.price_per_volume_unit < ffe.price_per_volume_unit {
                            aApiFilteredFuelEntries.insert(fe, at: idx)
                        } else {
                            aApiFilteredFuelEntries.append(fe)
                        }
                    }
                }
            }
        }
    }
    
    func apiFilterDistance() {
        aApiFilteredFuelEntries.removeAll()
        
        for fe in aApiFuelEntries {
            if fe.latitude != -1 && fe.longitude != -1{
                aApiFilteredFuelEntries.append(fe)
            }
        }
    }
}
