//
//  MainViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

class MainViewController: UIViewController, TableViewDelegate, MapViewDelegate, FilterViewControllerDelegate {
    let api = Api.shared
    let tool = Tool.shared
    
    let mainAc = UIActivityIndicatorView(style: .large)
    
    let mainTv = TableView()
    var hcMainTvCst: NSLayoutConstraint!
    var vcMainTvCst: NSLayoutConstraint!
    
    let mapVi = MapView()
    var hcMapViCst: NSLayoutConstraint!
    var vcMapViCst: NSLayoutConstraint!
    
    let mainLogoIv = UIImageView()
    
    let mainFilterBt = UIButton()
    var hrMainFilterBtCst: NSLayoutConstraint!
    
    let mainUserLocBt = UIButton()
    var hlMainUserLocBtCst: NSLayoutConstraint!
    var vtMainUserLocBtCst: NSLayoutConstraint!
    
    var dhw: CGFloat = 0
    
    var mainFilterLvl = 0
    
    var mainCurrentAlert: AlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(self.mainUpdateOrientation), name: NSNotification.Name(rawValue: "updateOrientation"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.mainGetLoc), name: NSNotification.Name(rawValue: "mainGetLoc"), object: nil)
        
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
        mainTv.tableViewDelegate = self
        view.addSubview(mainTv)
        
        let wtMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        let htMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: dhw/2)
        NSLayoutConstraint.activate([wtMainTvCst, htMainTvCst, hcMainTvCst, vcMainTvCst])
        
        // Map
        mapVi.alpha = 0
        mapVi.mapViewDelegate = self
        view.addSubview(mapVi)
        
        let wtMapViCst = NSLayoutConstraint(item: mapVi, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        let htMapViCst = NSLayoutConstraint(item: mapVi, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw)
        hcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        vcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -dhw/2)
        NSLayoutConstraint.activate([wtMapViCst, htMapViCst, hcMapViCst, vcMapViCst])
        
        // Logo
        mainLogoIv.image = UIImage(named: "logo")
        mainLogoIv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLogoIv)
        
        let wtMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        let htMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        let hcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let vcMainLogoIvCst = NSLayoutConstraint(item: mainLogoIv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtMainLogoIvCst, htMainLogoIvCst, hcMainLogoIvCst, vcMainLogoIvCst])
        
        // Filter button
        mainFilterBt.alpha = 0
        mainFilterBt.setImage(UIImage(named: "filter"), for: .normal)
        mainFilterBt.translatesAutoresizingMaskIntoConstraints = false
        mainFilterBt.addTarget(self, action: #selector(mainFilterBtAction), for: .touchUpInside)
        mainFilterBt.layer.shadowOffset = CGSize.zero
        mainFilterBt.layer.shadowOpacity = 0.25
        mainFilterBt.layer.shadowRadius = 2
        view.addSubview(mainFilterBt)
        
        let wtMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let htMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        hrMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let vtMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([wtMainFilterBtCst, htMainFilterBtCst, hrMainFilterBtCst, vtMainFilterBtCst])
        
        // Filter button
        mainUserLocBt.alpha = 0
        mainUserLocBt.setImage(UIImage(named: "loc"), for: .normal)
        mainUserLocBt.translatesAutoresizingMaskIntoConstraints = false
        mainUserLocBt.addTarget(self, action: #selector(mainUserLocBtAction), for: .touchUpInside)
        mainUserLocBt.layer.shadowOffset = CGSize.zero
        mainUserLocBt.layer.shadowOpacity = 0.25
        mainUserLocBt.layer.shadowRadius = 2
        view.addSubview(mainUserLocBt)
        
        let wtMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let htMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        hlMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        vtMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([wtMainUserLocBtCst, htMainUserLocBtCst, hlMainUserLocBtCst, vtMainUserLocBtCst])
        
        // Start
        UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
            self.mainLogoIv.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
        }) { (finished) -> Void in
            self.mainGetFuelEntries()
            self.mainUpdateOrientation()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func mainUpdateOrientation() {
        NSLayoutConstraint.deactivate([hcMainTvCst, vcMainTvCst, hcMapViCst, vcMapViCst, hrMainFilterBtCst, hlMainUserLocBtCst, vtMainUserLocBtCst])
        
        if tool.orientation == .portrait {
            hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: dhw/2)
            hcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            vcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -dhw/2)
            hrMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
            hlMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
            vtMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 8)
        } else {
            hcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: dhw/2)
            vcMainTvCst = NSLayoutConstraint(item: mainTv, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
            hcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -(24 + dhw/2))
            vcMapViCst = NSLayoutConstraint(item: mapVi, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
            hrMainFilterBtCst = NSLayoutConstraint(item: mainFilterBt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -12)
            hlMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .centerX, relatedBy: .equal, toItem: mainFilterBt, attribute: .centerX, multiplier: 1, constant: 0)
            vtMainUserLocBtCst = NSLayoutConstraint(item: mainUserLocBt, attribute: .top, relatedBy: .equal, toItem: mainFilterBt, attribute: .bottom, multiplier: 1, constant: -12)
        }
        
        NSLayoutConstraint.activate([hcMainTvCst, vcMainTvCst, hcMapViCst, vcMapViCst, hrMainFilterBtCst, hlMainUserLocBtCst, vtMainUserLocBtCst])
    }
    
    @objc private func mainGetLoc() {
        mapVi.mapLocCheck() { eta in
            if eta == 2 {
                self.mainDisplayAlert(nb: 2, txt: "")
            } else {
                self.mapVi.mapLocGet()
            }
        }
        
    }
    
    private func mainGetFuelEntries() {
        mapVi.alpha = 0
        mainTv.alpha = 0
        mainFilterBt.alpha = 0
        mainUserLocBt.alpha = 0
        
        mainAc.startAnimating()
        api.apiGetFuelEntries { isError in
            self.mainAc.stopAnimating()
            
            if isError {
                self.mainDisplayAlert(nb: 1, txt: "Something went wrong when loading the fuel entries.\n\nPlease restart the app later or contact the support team.")
            } else {
                if self.api.aApiFilteredFuelEntries.isEmpty {
                    self.mainDisplayAlert(nb: 1, txt: "There are no fuel entries.")
                } else {
                    UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
                        self.mainTv.alpha = 1
                    }) { (finished) -> Void in
                        self.mainTv.reloadData()
                        
                        UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
                            self.mapVi.alpha = 1
                        }) { (finished) -> Void in
                            UIView.animate(withDuration: 0.25, delay: 0.25, options: .curveEaseOut, animations: { () -> Void in
                                self.mainFilterBt.alpha = 1
                                self.mainUserLocBt.alpha = 1
                            }) { (finished) -> Void in
                                self.mainGetLoc()
                                self.mapVi.mapDisplayFuelEntries()
                            }
                        }
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
        
        if mainCurrentAlert == nil {
            mainCurrentAlert = AlertView()
            alertVi.alertDisplay(nb: nb, txt: txt)
            mainCurrentAlert = alertVi
        } else {
            mainCurrentAlert?.alertDismiss {
                alertVi.alertDisplay(nb: nb, txt: txt)
                self.mainCurrentAlert = alertVi
            }
        }
    }
    
    @objc private func mainFilterBtAction(sender: UIButton!) {
        let filterVc = FilterViewController(filterLvl: mainFilterLvl)
        filterVc.filterViewControllerDelegate = self
        filterVc.modalPresentationStyle = .formSheet
        filterVc.modalTransitionStyle = .coverVertical
        self.present(filterVc, animated: true, completion: { filterVc.filterUpdateOrientation() })
    }
    
    @objc private func mainUserLocBtAction(sender: UIButton!) {
        if api.userLoc[0] != 0 && api.userLoc[1] != 0 {
            mapVi.mapCenterToCoordinates(latitude: api.userLoc[0], longitude: api.userLoc[1])
        } else {
            mainGetLoc()
        }
    }
    
    // TableViewDelegate
    func mainTablevRefresh() {
        self.mainGetFuelEntries()
    }
    
    func mainOpenDetail(fuelEntrie: FuelEntrie) {
        let detailVc = DetailViewController(fuelEntrie: fuelEntrie)
        detailVc.modalPresentationStyle = .formSheet
        detailVc.modalTransitionStyle = .coverVertical
        self.present(detailVc, animated: true, completion: { detailVc.detailUpdateOrientation() })
    }
    
    func mainShowFuelEntrieOnMap(fuelEntrie: FuelEntrie) {
        mapVi.mapCenterToCoordinates(latitude: fuelEntrie.latitude, longitude: fuelEntrie.longitude)
    }
    
    // MapViewDelegate
    func mainTableMoveToCell(nb: Int) {
        mainTv.scrollToRow(at: NSIndexPath(row: nb, section: 0) as IndexPath, at: .top, animated: true)
    }
    
    // FilterViewControllerDelegate
    func mainSetFilterLvl(lvl: Int) {
        mainFilterLvl = lvl
    }
}
