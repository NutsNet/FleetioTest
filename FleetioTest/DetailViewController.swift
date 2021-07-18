//
//  DetailViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    let detailFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    let detailTitleLbt = UILabel()
    let detailExitBt = UIButton()
    
    let detailSv = UIScrollView()
        
    let detailLogoIv = UIImageView()
    let detailDateLb = UILabel()
    let detailRefLb = UILabel()
    let detailVendorLb = UILabel()
    let detailVehicleLb = UILabel()
    let detailFuelLb = UILabel()
    
    let detailCostHrLb = UILabel()
    let detailCostMiLb = UILabel()
    
    let detailGallonLB = UILabel()
    let detailPriceLb = UILabel()
    
    let detailLatitudeLb = UILabel()
    let detailLongitudeLb = UILabel()
    let detailDistanceLb = UILabel()
    
    var fuelEntrie = FuelEntrie()
    
    convenience init(fuelEntrie: FuelEntrie) {
        self.init()
        
        self.fuelEntrie = fuelEntrie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(self.detailUpdateOrientation), name: NSNotification.Name(rawValue: "updateOrientation"), object: nil)
        
        // Fx
        detailFx.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailFx)
        
        let hlDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let vbDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlDetailFxCst, hrDetailFxCst, vtDetailFxCst, vbDetailFxCst])
        
        // Exit
        detailExitBt.setTitle("\u{02297}",for: .normal)
        detailExitBt.titleLabel?.font = UIFont(name: "Lato-Bold", size: 48)
        detailExitBt.addTarget(self, action: #selector(detailExitBtAction), for: .touchUpInside)
        detailExitBt.translatesAutoresizingMaskIntoConstraints = false
        detailExitBt.layer.shadowOffset = CGSize.zero
        detailExitBt.layer.shadowOpacity = 0.5
        detailExitBt.layer.shadowRadius = 4
        view.addSubview(detailExitBt)
        
        let wtDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let htDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let hlDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtDetailExitBtCst, htDetailExitBtCst, hlDetailExitBtCst, vtDetailExitBtCst])
        
        // Title
        detailTitleLbt.textAlignment = .center
        detailTitleLbt.text = "Fuel Entrie Detail"
        detailTitleLbt.font =  UIFont(name: "Lato-Bold", size: 24)
        detailTitleLbt.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLbt.layer.shadowOffset = CGSize.zero
        detailTitleLbt.layer.shadowOpacity = 0.5
        detailTitleLbt.layer.shadowRadius = 4
        view.addSubview(detailTitleLbt)
        
        let hlDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .top, relatedBy: .equal, toItem: detailExitBt, attribute: .top, multiplier: 1, constant: 0)
        let vbDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .bottom, relatedBy: .equal, toItem: detailExitBt, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlDetailTitleLbCst, hrDetailTitleLbCst, vtDetailTitleLbCst, vbDetailTitleLbCst])
        
        // Scroll view
        detailSv.showsVerticalScrollIndicator = false
        detailSv.contentInsetAdjustmentBehavior = .never
        detailSv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailSv)
        
        let hlDetailSvCst = NSLayoutConstraint(item: detailSv, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrDetailSvCst = NSLayoutConstraint(item: detailSv, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtDetailSvCst = NSLayoutConstraint(item: detailSv, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 64)
        let vbDetailSvCst = NSLayoutConstraint(item: detailSv, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlDetailSvCst, hrDetailSvCst, vtDetailSvCst, vbDetailSvCst])
        
        // Logo
        detailLogoIv.alpha = 1
        detailLogoIv.backgroundColor = .white
        detailLogoIv.image = UIImage(named: "logo")
        detailLogoIv.translatesAutoresizingMaskIntoConstraints = false
        detailLogoIv.layer.cornerRadius = 64
        detailLogoIv.layer.shadowOffset = CGSize.zero
        detailLogoIv.layer.shadowOpacity = 1
        detailLogoIv.layer.shadowRadius = 4
        detailSv.addSubview(detailLogoIv)
        
        let wtDetailLogoIvCst = NSLayoutConstraint(item: detailLogoIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128)
        let htDetailLogoIvCst = NSLayoutConstraint(item: detailLogoIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128)
        let hcDetailLogoIvCst = NSLayoutConstraint(item: detailLogoIv, attribute: .centerX, relatedBy: .equal, toItem: detailSv, attribute: .centerX, multiplier: 1, constant: 0)
        let vtDetailLogoIvCst = NSLayoutConstraint(item: detailLogoIv, attribute: .top, relatedBy: .equal, toItem: detailSv, attribute: .top, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([wtDetailLogoIvCst, htDetailLogoIvCst, hcDetailLogoIvCst, vtDetailLogoIvCst])
        
        // Date
        detailDateLb.text = "Date: unknown"
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "MMM dd, YYYY h:mm a"
        newDateFormatter.amSymbol = "am"
        newDateFormatter.pmSymbol = "pm"
        
        if let date = dateFormatter.date(from: fuelEntrie.date) {
            detailDateLb.text = "Date: " + newDateFormatter.string(from: date)
        }
        
        detailDateLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailDateLb.sizeToFit()
        detailDateLb.translatesAutoresizingMaskIntoConstraints = false
        detailDateLb.layer.shadowOffset = CGSize.zero
        detailDateLb.layer.shadowOpacity = 0.5
        detailDateLb.layer.shadowRadius = 4
        detailSv.addSubview(detailDateLb)
        
        let hlDetailDateLbCst = NSLayoutConstraint(item: detailDateLb, attribute: .left, relatedBy: .equal, toItem: detailSv, attribute: .left, multiplier: 1, constant: 48)
        let vtDetailDateLbCst = NSLayoutConstraint(item: detailDateLb, attribute: .top, relatedBy: .equal, toItem: detailLogoIv, attribute: .bottom, multiplier: 1, constant: 48)
        NSLayoutConstraint.activate([hlDetailDateLbCst, vtDetailDateLbCst])
        
        // Reference
        if fuelEntrie.reference == "blank" {
            detailRefLb.text = "Reference: unknown"
        } else {
            detailRefLb.text = "Reference: \(fuelEntrie.reference)"
        }
        
        detailRefLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailRefLb.sizeToFit()
        detailRefLb.translatesAutoresizingMaskIntoConstraints = false
        detailRefLb.layer.shadowOffset = CGSize.zero
        detailRefLb.layer.shadowOpacity = 0.5
        detailRefLb.layer.shadowRadius = 4
        detailSv.addSubview(detailRefLb)
        
        let hlDetailRefLbCst = NSLayoutConstraint(item: detailRefLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailRefLbCst = NSLayoutConstraint(item: detailRefLb, attribute: .top, relatedBy: .equal, toItem: detailDateLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailRefLbCst, vtDetailRefLbCst])
        
        // Vendor
        if fuelEntrie.vendor_name == "blank" {
            detailVendorLb.text = "Vendor: unknown"
        } else {
            detailVendorLb.text = "Vendor: \(fuelEntrie.vendor_name)"
        }
        
        detailVendorLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailVendorLb.sizeToFit()
        detailVendorLb.translatesAutoresizingMaskIntoConstraints = false
        detailVendorLb.layer.shadowOffset = CGSize.zero
        detailVendorLb.layer.shadowOpacity = 0.5
        detailVendorLb.layer.shadowRadius = 4
        detailSv.addSubview(detailVendorLb)
        
        let hlDetailVendorLbCst = NSLayoutConstraint(item: detailVendorLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailVendorLbCst = NSLayoutConstraint(item: detailVendorLb, attribute: .top, relatedBy: .equal, toItem: detailRefLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailVendorLbCst, vtDetailVendorLbCst])
        
        // Vehicle
        if fuelEntrie.vehicle_name == "blank" {
            detailVehicleLb.text = "Vehicle: unknown"
        } else {
            detailVehicleLb.text = "Vehicle: \(fuelEntrie.vehicle_name)"
        }
        
        detailVehicleLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailVehicleLb.sizeToFit()
        detailVehicleLb.translatesAutoresizingMaskIntoConstraints = false
        detailVehicleLb.layer.shadowOffset = CGSize.zero
        detailVehicleLb.layer.shadowOpacity = 0.5
        detailVehicleLb.layer.shadowRadius = 4
        detailSv.addSubview(detailVehicleLb)
        
        let hlDetailVehicleLbCst = NSLayoutConstraint(item: detailVehicleLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailVehicleLbCst = NSLayoutConstraint(item: detailVehicleLb, attribute: .top, relatedBy: .equal, toItem: detailVendorLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailVehicleLbCst, vtDetailVehicleLbCst])
        
        // Fuel
        if fuelEntrie.fuel_type_name == "blank" {
            detailFuelLb.text = "Fuel: unknown"
        } else {
            detailFuelLb.text = "Fuel: \(fuelEntrie.fuel_type_name)"
        }
        
        detailFuelLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailFuelLb.sizeToFit()
        detailFuelLb.translatesAutoresizingMaskIntoConstraints = false
        detailFuelLb.layer.shadowOffset = CGSize.zero
        detailFuelLb.layer.shadowOpacity = 0.5
        detailFuelLb.layer.shadowRadius = 4
        detailSv.addSubview(detailFuelLb)
        
        let hlDetailFuelLbCst = NSLayoutConstraint(item: detailFuelLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailFuelLbCst = NSLayoutConstraint(item: detailFuelLb, attribute: .top, relatedBy: .equal, toItem: detailVehicleLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailFuelLbCst, vtDetailFuelLbCst])
        
        // Cost Hr
        if fuelEntrie.cost_per_hr == -1 {
            detailCostHrLb.text = "Cost per hour: unknown"
        } else {
            detailCostHrLb.text = "Cost per hour: $\(fuelEntrie.cost_per_hr)"
        }
        
        detailCostHrLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailCostHrLb.sizeToFit()
        detailCostHrLb.translatesAutoresizingMaskIntoConstraints = false
        detailCostHrLb.layer.shadowOffset = CGSize.zero
        detailCostHrLb.layer.shadowOpacity = 0.5
        detailCostHrLb.layer.shadowRadius = 4
        detailSv.addSubview(detailCostHrLb)
        
        let hlDetailCostHrLbCst = NSLayoutConstraint(item: detailCostHrLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailCostHrLbCst = NSLayoutConstraint(item: detailCostHrLb, attribute: .top, relatedBy: .equal, toItem: detailFuelLb, attribute: .bottom, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([hlDetailCostHrLbCst, vtDetailCostHrLbCst])
        
        // Cost Mi
        if fuelEntrie.cost_per_mi == -1 {
            detailCostMiLb.text = "Cost per mile: unknown"
        } else {
            detailCostMiLb.text = "Cost per mile: $\(fuelEntrie.cost_per_mi)"
        }
        
        detailCostMiLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailCostMiLb.sizeToFit()
        detailCostMiLb.translatesAutoresizingMaskIntoConstraints = false
        detailCostMiLb.layer.shadowOffset = CGSize.zero
        detailCostMiLb.layer.shadowOpacity = 0.5
        detailCostMiLb.layer.shadowRadius = 4
        detailSv.addSubview(detailCostMiLb)
        
        let hlDetailCostMiLbCst = NSLayoutConstraint(item: detailCostMiLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailCostMiLbCst = NSLayoutConstraint(item: detailCostMiLb, attribute: .top, relatedBy: .equal, toItem: detailCostHrLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailCostMiLbCst, vtDetailCostMiLbCst])
        
        // Gallon
        if fuelEntrie.us_gallons == -1 {
            detailGallonLB.text = "Gallons: unknown"
        } else {
            detailGallonLB.text = "Gallons: \(fuelEntrie.us_gallons)"
        }
        
        detailGallonLB.font =  UIFont(name: "Lato-Regular", size: 20)
        detailGallonLB.sizeToFit()
        detailGallonLB.translatesAutoresizingMaskIntoConstraints = false
        detailGallonLB.layer.shadowOffset = CGSize.zero
        detailGallonLB.layer.shadowOpacity = 0.5
        detailGallonLB.layer.shadowRadius = 4
        detailSv.addSubview(detailGallonLB)
        
        let hlDetailGallonLbCst = NSLayoutConstraint(item: detailGallonLB, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailGallonLbCst = NSLayoutConstraint(item: detailGallonLB, attribute: .top, relatedBy: .equal, toItem: detailCostMiLb, attribute: .bottom, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([hlDetailGallonLbCst, vtDetailGallonLbCst])
        
        // Price
        if fuelEntrie.price_per_volume_unit == -1 {
            detailPriceLb.text = "Price per gallon: unknown"
        } else {
            detailPriceLb.text = "Price per gallon: $\(fuelEntrie.price_per_volume_unit)"
        }
        
        detailPriceLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailPriceLb.sizeToFit()
        detailPriceLb.translatesAutoresizingMaskIntoConstraints = false
        detailPriceLb.layer.shadowOffset = CGSize.zero
        detailPriceLb.layer.shadowOpacity = 0.5
        detailPriceLb.layer.shadowRadius = 4
        detailSv.addSubview(detailPriceLb)
        
        let hlDetailPriceLbCst = NSLayoutConstraint(item: detailPriceLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailPriceLbCst = NSLayoutConstraint(item: detailPriceLb, attribute: .top, relatedBy: .equal, toItem: detailGallonLB, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailPriceLbCst, vtDetailPriceLbCst])
        
        // Latitude
        if fuelEntrie.latitude == -1 {
            detailLatitudeLb.text = "Latitude: unknown"
        } else {
            detailLatitudeLb.text = "Latitude: \(fuelEntrie.latitude)"
        }
        
        detailLatitudeLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailLatitudeLb.sizeToFit()
        detailLatitudeLb.translatesAutoresizingMaskIntoConstraints = false
        detailLatitudeLb.layer.shadowOffset = CGSize.zero
        detailLatitudeLb.layer.shadowOpacity = 0.5
        detailLatitudeLb.layer.shadowRadius = 4
        detailSv.addSubview(detailLatitudeLb)
        
        let hlDetailLatitudeLbCst = NSLayoutConstraint(item: detailLatitudeLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailLatitudeLbCst = NSLayoutConstraint(item: detailLatitudeLb, attribute: .top, relatedBy: .equal, toItem: detailPriceLb, attribute: .bottom, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([hlDetailLatitudeLbCst, vtDetailLatitudeLbCst])
        
        // Longitude
        if fuelEntrie.longitude == -1 {
            detailLongitudeLb.text = "Longitude: unknown"
        } else {
            detailLongitudeLb.text = "Longitude: \(fuelEntrie.longitude)"
        }
        
        detailLongitudeLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailLongitudeLb.sizeToFit()
        detailLongitudeLb.translatesAutoresizingMaskIntoConstraints = false
        detailLongitudeLb.layer.shadowOffset = CGSize.zero
        detailLongitudeLb.layer.shadowOpacity = 0.5
        detailLongitudeLb.layer.shadowRadius = 4
        detailSv.addSubview(detailLongitudeLb)
        
        let hlDetailLongitudeLbCst = NSLayoutConstraint(item: detailLongitudeLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailLongitudeLbCst = NSLayoutConstraint(item: detailLongitudeLb, attribute: .top, relatedBy: .equal, toItem: detailLatitudeLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailLongitudeLbCst, vtDetailLongitudeLbCst])
        
        // Distance
        if fuelEntrie.distance == -1 {
            detailDistanceLb.text = "Longitude: unknown"
        } else {
            detailDistanceLb.text = "Longitude: \(fuelEntrie.distance)"
        }
        
        detailDistanceLb.font =  UIFont(name: "Lato-Regular", size: 20)
        detailDistanceLb.sizeToFit()
        detailDistanceLb.translatesAutoresizingMaskIntoConstraints = false
        detailDistanceLb.layer.shadowOffset = CGSize.zero
        detailDistanceLb.layer.shadowOpacity = 0.5
        detailDistanceLb.layer.shadowRadius = 4
        detailSv.addSubview(detailDistanceLb)
        
        let hlDetailDistanceLbCst = NSLayoutConstraint(item: detailDistanceLb, attribute: .left, relatedBy: .equal, toItem: detailDateLb, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailDistanceLbCst = NSLayoutConstraint(item: detailDistanceLb, attribute: .top, relatedBy: .equal, toItem: detailLongitudeLb, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlDetailDistanceLbCst, vtDetailDistanceLbCst])
    }
    
    @objc func detailUpdateOrientation() {
        detailSv.contentSize.height = detailDistanceLb.frame.origin.y + detailDistanceLb.frame.height + 48
    }
    
    @objc private func detailExitBtAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
