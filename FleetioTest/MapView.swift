//
//  MapView.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit
import MapKit

class MapView: UIView {
    let mapMkVi = MKMapView()
    let mapLb = UILabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Self
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
        
        // Map
        mapMkVi.translatesAutoresizingMaskIntoConstraints = false
        mapMkVi.layer.cornerRadius = 8
        addSubview(mapMkVi)
        
        let hlMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 4)
        let hrMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -4)
        let vtMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4)
        let vbMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -32)
        NSLayoutConstraint.activate([hlMapMkViCst, hrMapMkViCst, vtMapMkViCst, vbMapMkViCst])
        
        // Label
        mapLb.textColor = .black
        mapLb.text = "f u e l    e n t r i e s"
        mapLb.textAlignment = .center
        mapLb.font =  UIFont(name: "Lato-Bold", size: 24)
        mapLb.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mapLb)
        
        let hlMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let hrMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let vtMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .top, relatedBy: .equal, toItem: mapMkVi, attribute: .bottom, multiplier: 1, constant: 0)
        let vbMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlMapLbCst, hrMapLbCst, vtMapLbCst, vbMapLbCst])
    }
}
