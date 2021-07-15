//
//  Api.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit
import Alamofire

class Api: NSObject {
    var aApiFuelEntries = [Dictionary<String,Any>]()
    
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
                    self.aApiFuelEntries = aFuelEntries
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
}
