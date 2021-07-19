//
//  MapView.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit
import MapKit
import CoreLocation

protocol MapViewDelegate {
    func mainTableMoveToCell(nb: Int)
}

class MapView: UIView, CLLocationManagerDelegate, MKMapViewDelegate {
    var mapViewDelegate: MapViewDelegate?
    
    let api = Api.shared
    
    let mapMkVi = MKMapView()
    let mapLb = UILabel()
    
    let mapLoc = CLLocationManager()

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
        mapMkVi.delegate = self
        mapMkVi.translatesAutoresizingMaskIntoConstraints = false
        mapMkVi.layer.cornerRadius = 8
        addSubview(mapMkVi)
        
        let hlMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 4)
        let hrMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -4)
        let vtMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4)
        let vbMapMkViCst = NSLayoutConstraint(item: mapMkVi, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -32)
        NSLayoutConstraint.activate([hlMapMkViCst, hrMapMkViCst, vtMapMkViCst, vbMapMkViCst])
        
        // Label
        mapLb.textColor = .darkGray
        mapLb.text = "f u e l    e n t r i e s"
        mapLb.textAlignment = .center
        mapLb.font =  UIFont(name: "Lato-Bold", size: 24)
        mapLb.translatesAutoresizingMaskIntoConstraints = false
        mapLb.layer.shadowOffset = CGSize.zero
        mapLb.layer.shadowOpacity = 0.5
        mapLb.layer.shadowRadius = 4
        addSubview(mapLb)
        
        let hlMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let hrMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let vtMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .top, relatedBy: .equal, toItem: mapMkVi, attribute: .bottom, multiplier: 1, constant: 0)
        let vbMapLbCst = NSLayoutConstraint(item: mapLb, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlMapLbCst, hrMapLbCst, vtMapLbCst, vbMapLbCst])
        
        mapUpdateUserLoc()
    }
    
    private func mapUpdateUserLoc() {
        if let mapLocation = mapLoc.location {
            api.userLoc[0] = mapLocation.coordinate.latitude
            api.userLoc[1] = mapLocation.coordinate.longitude
        } else {
            print("Cannot update the user location")
        }
    }
    
    func mapLocCheck(escap: @escaping (UInt) -> Void) {
        if CLLocationManager.locationServicesEnabled() {
            switch mapLoc.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                mapUpdateUserLoc()
                escap(1)
                break
            case .denied:
                escap(2)
                break
            default:
                escap(0)
                break
            }
        } else {
            escap(0)
        }
    }
    
    func mapLocGet() {
        mapLoc.delegate = self
        mapLoc.requestLocation()
    }
    
    func mapCenterToCoordinates(latitude: Double, longitude: Double) {
        var region = MKCoordinateRegion (
            center: CLLocationCoordinate2D(latitude: 45, longitude: -100),
            latitudinalMeters: CLLocationDistance(exactly: 5000000)!,longitudinalMeters: CLLocationDistance(exactly: 5000000)!)
        mapMkVi.setRegion(mapMkVi.regionThatFits(region), animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            region = MKCoordinateRegion (
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                latitudinalMeters: CLLocationDistance(exactly: 1000)!,longitudinalMeters: CLLocationDistance(exactly: 1000)!)
            self.mapMkVi.setRegion(self.mapMkVi.regionThatFits(region), animated: true)
        }
    }
    
    func mapDisplayFuelEntries() {
        mapMkVi.removeAnnotations(mapMkVi.annotations)
        
        for (idx, fe) in api.aApiFilteredFuelEntries.enumerated() {
            if fe.latitude != -1 && fe.longitude != -1 {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: fe.latitude, longitude: fe.longitude)
                annotation.title = String(idx)
                annotation.subtitle = fe.vehicle_name
                mapMkVi.addAnnotation(annotation)
            }
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: api.userLoc[0], longitude: api.userLoc[1])
        annotation.title = "Me"
        mapMkVi.addAnnotation(annotation)
    }
    
    // MKMapViewDelegate
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.annotation?.title != "Me" {
            mapViewDelegate?.mainTableMoveToCell(nb: Int(view.annotation!.title!!)!)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) { return nil }
        
        if annotation.title == "Me" {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "anoId")
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "anoId")
            }
            else {
                annotationView!.annotation = annotation
            }
            
            annotationView!.image = UIImage(named: "pin")
            
            return annotationView
        } else {
            return nil
        }
    }
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        mapLoc.requestWhenInUseAuthorization()
        print ("Error locationManager: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapLoc.requestLocation()
        } else {
            mapLoc.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            mapDisplayFuelEntries()
        }
    }
}
