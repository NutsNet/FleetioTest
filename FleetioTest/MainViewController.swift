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
            
            if status == "error" {
                print("ERROR")
            } else {
                print(aFuelEntries)
            }
        }
    }
}

