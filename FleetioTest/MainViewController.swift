//
//  MainViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

class MainViewController: UIViewController {
    let api = Api.shared
    
    let mainAc = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Self
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Activity
        mainAc.color = .black
        mainAc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainAc)
        
        let hcMainAcCst = NSLayoutConstraint(item: mainAc, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vcMainAcCst = NSLayoutConstraint(item: mainAc, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hcMainAcCst, vcMainAcCst])
        
        // Start
        mainGetFuelEntries()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func mainGetFuelEntries() {
        mainAc.startAnimating()
        api.apiGetFuelEntries { status, aFuelEntries in
            self.mainAc.stopAnimating()
            
            if status != "error" {
                self.mainDisplayAlert(nb: 1, txt: "Something went wrong when loading the fuel entries.\n\nPlease restart the app later or contact the support team.")
            } else {
                print(aFuelEntries)
            }
        }
    }
    
    private func mainDisplayAlert(nb: UInt, txt: String) {
        view.endEditing(true)
        
        let alertVi = AlertView()
        alertVi.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertVi)
        
        let hlAlertCst = NSLayoutConstraint(item: alertVi, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrAlertCst = NSLayoutConstraint(item: alertVi, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtAlertCst = NSLayoutConstraint(item: alertVi, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let vbAlertCst = NSLayoutConstraint(item: alertVi, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlAlertCst, hrAlertCst, vtAlertCst, vbAlertCst])
        
        alertVi.alertDisplay(nb: nb, txt: txt)
    }
}

