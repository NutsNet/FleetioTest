//
//  MainViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

class MainViewController: UIViewController {
    let api = Api.shared
    let tool = Tool.shared
    
    let mainAc = UIActivityIndicatorView(style: .large)
    
    let mainTv = TableView()
    var hcMainTvCst: NSLayoutConstraint!
    var vcMainTvCst: NSLayoutConstraint!
    
    let mainLogoIv = UIImageView()
    
    var dhw: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(self.mainUpdateOrientation), name: NSNotification.Name(rawValue: "updateOrientation"), object: nil)
        
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
        
        // Table
        dhw = tool.currentDeviceWt - 48
        if dhw > (tool.currentDeviceHt - 96)/2 { dhw = (tool.currentDeviceHt - 96)/2 }
        
        // Table
        mainTv.alpha = 0
        mainTv.backgroundColor = .red
        mainTv.rowHeight = UITableView.automaticDimension
        mainTv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainTv)
        
        let wtMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        let htMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -(24 + dhw/2))
        NSLayoutConstraint.activate([wtMainTvCst, htMainTvCst, hcMainTvCst, vcMainTvCst])
        
        // Map
        
        // Logo
        mainLogoIv.image = UIImage(named: "logo")
        mainLogoIv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLogoIv)
        
        let wtMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        let htMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        let hcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtMainLogoIvCst, htMainLogoIvCst, hcMainLogoIvCst, vcMainLogoIvCst])
        
        // Start
        UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
            self.mainLogoIv.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
        }) { (finished) -> Void in
            self.mainGetFuelEntries()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func mainUpdateOrientation() {
        NSLayoutConstraint.deactivate([hcMainTvCst, vcMainTvCst])
        
        if tool.orientation == .portrait {
            hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -(24 + dhw/2))
        } else {
            hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -(24 + dhw/2))
            vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        }
        
        NSLayoutConstraint.activate([hcMainTvCst, vcMainTvCst])
    }
    
    private func mainGetFuelEntries() {
        mainAc.startAnimating()
        api.apiGetFuelEntries { isError in
            self.mainAc.stopAnimating()
            
            if isError {
                self.mainDisplayAlert(nb: 1, txt: "Something went wrong when loading the fuel entries.\n\nPlease restart the app later or contact the support team.")
            } else {
                if self.api.aApiFuelEntries.isEmpty {
                    self.mainDisplayAlert(nb: 1, txt: "There are no fuel entries.")
                } else {
                    UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
                        self.mainTv.alpha = 1
                    }) { (finished) -> Void in
                        
                    }
                }
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

