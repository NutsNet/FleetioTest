//
//  FilterViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class FilterViewController: UIViewController {
    let filterFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    let filterTitleLbt = UILabel()
    let filterExitBt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Self
        
        // Fx
        filterFx.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterFx)
        
        let hlFilterFxCst = NSLayoutConstraint(item: filterFx, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrFilterFxCst = NSLayoutConstraint(item: filterFx, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtFilterFxCst = NSLayoutConstraint(item: filterFx, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let vbFilterFxCst = NSLayoutConstraint(item: filterFx, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlFilterFxCst, hrFilterFxCst, vtFilterFxCst, vbFilterFxCst])
        
        // Exit
        filterExitBt.setTitle("\u{02297}",for: .normal)
        filterExitBt.titleLabel?.font = UIFont(name: "Lato-Bold", size: 48)
        filterExitBt.addTarget(self, action: #selector(filterExitBtAction), for: .touchUpInside)
        filterExitBt.translatesAutoresizingMaskIntoConstraints = false
        filterExitBt.layer.shadowOffset = CGSize.zero
        filterExitBt.layer.shadowOpacity = 0.5
        filterExitBt.layer.shadowRadius = 4
        view.addSubview(filterExitBt)
        
        let wtFilterExitBtCst = NSLayoutConstraint(item: filterExitBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let htFilterExitBtCst = NSLayoutConstraint(item: filterExitBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let hlFilterExitBtCst = NSLayoutConstraint(item: filterExitBt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterExitBtCst = NSLayoutConstraint(item: filterExitBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtFilterExitBtCst, htFilterExitBtCst, hlFilterExitBtCst, vtFilterExitBtCst])
        
        // Title
        filterTitleLbt.textAlignment = .center
        filterTitleLbt.text = "Fuel Entries Filter"
        filterTitleLbt.font =  UIFont(name: "Lato-Bold", size: 24)
        filterTitleLbt.translatesAutoresizingMaskIntoConstraints = false
        filterTitleLbt.layer.shadowOffset = CGSize.zero
        filterTitleLbt.layer.shadowOpacity = 0.5
        filterTitleLbt.layer.shadowRadius = 4
        view.addSubview(filterTitleLbt)
        
        let hlFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLbt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLbt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLbt, attribute: .top, relatedBy: .equal, toItem: filterExitBt, attribute: .top, multiplier: 1, constant: 0)
        let vbFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLbt, attribute: .bottom, relatedBy: .equal, toItem: filterExitBt, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlFilterTitleLbCst, hrFilterTitleLbCst, vtFilterTitleLbCst, vbFilterTitleLbCst])
    }
    
    @objc private func filterExitBtAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
