//
//  FilterViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class FilterViewController: UIViewController {
    let filterFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    let filterTitleLb = UILabel()
    let filterExitBt = UIButton()
    
    let filterSv = UIScrollView()
        
    let filterLogoIv = UIImageView()
    let filterNoneBt = UIButton()
    let filterFuelBt = UIButton()
    let filterGallonBt = UIButton()
    let filterCostHrBt = UIButton()
    let filterCostMiBt = UIButton()
    let filterPriceGallonBt = UIButton()
    let filterDistanceBt = UIButton()
    
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
        filterTitleLb.textAlignment = .center
        filterTitleLb.text = "Fuel Entries Filter"
        filterTitleLb.font =  UIFont(name: "Lato-Bold", size: 24)
        filterTitleLb.translatesAutoresizingMaskIntoConstraints = false
        filterTitleLb.layer.shadowOffset = CGSize.zero
        filterTitleLb.layer.shadowOpacity = 0.5
        filterTitleLb.layer.shadowRadius = 4
        view.addSubview(filterTitleLb)
        
        let hlFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLb, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLb, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLb, attribute: .top, relatedBy: .equal, toItem: filterExitBt, attribute: .top, multiplier: 1, constant: 0)
        let vbFilterTitleLbCst = NSLayoutConstraint(item: filterTitleLb, attribute: .bottom, relatedBy: .equal, toItem: filterExitBt, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlFilterTitleLbCst, hrFilterTitleLbCst, vtFilterTitleLbCst, vbFilterTitleLbCst])
        
        // Scroll view
        filterSv.showsVerticalScrollIndicator = false
        filterSv.contentInsetAdjustmentBehavior = .never
        filterSv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterSv)
        
        let hlFilterSvCst = NSLayoutConstraint(item: filterSv, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrFilterSvCst = NSLayoutConstraint(item: filterSv, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtFilterSvCst = NSLayoutConstraint(item: filterSv, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 64)
        let vbFilterSvCst = NSLayoutConstraint(item: filterSv, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlFilterSvCst, hrFilterSvCst, vtFilterSvCst, vbFilterSvCst])
        
        // Logo
        filterLogoIv.alpha = 1
        filterLogoIv.backgroundColor = .white
        filterLogoIv.image = UIImage(named: "logo")
        filterLogoIv.translatesAutoresizingMaskIntoConstraints = false
        filterLogoIv.layer.cornerRadius = 64
        filterLogoIv.layer.shadowOffset = CGSize.zero
        filterLogoIv.layer.shadowOpacity = 1
        filterLogoIv.layer.shadowRadius = 4
        filterSv.addSubview(filterLogoIv)
        
        let wtDetailLogoIvCst = NSLayoutConstraint(item: filterLogoIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128)
        let htDetailLogoIvCst = NSLayoutConstraint(item: filterLogoIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128)
        let hcDetailLogoIvCst = NSLayoutConstraint(item: filterLogoIv, attribute: .centerX, relatedBy: .equal, toItem: filterSv, attribute: .centerX, multiplier: 1, constant: 0)
        let vtDetailLogoIvCst = NSLayoutConstraint(item: filterLogoIv, attribute: .top, relatedBy: .equal, toItem: filterSv, attribute: .top, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([wtDetailLogoIvCst, htDetailLogoIvCst, hcDetailLogoIvCst, vtDetailLogoIvCst])
        
        // None
        filterNoneBt.setTitle("\u{02713}  No filter",for: .normal)
        filterNoneBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterNoneBt.addTarget(self, action: #selector(filterNoneBtAction), for: .touchUpInside)
        filterNoneBt.translatesAutoresizingMaskIntoConstraints = false
        filterNoneBt.layer.shadowOffset = CGSize.zero
        filterNoneBt.layer.shadowOpacity = 0.5
        filterNoneBt.layer.shadowRadius = 4
        filterSv.addSubview(filterNoneBt)
        
        let hlFilterNoneBtCst = NSLayoutConstraint(item: filterNoneBt, attribute: .left, relatedBy: .equal, toItem: filterSv, attribute: .left, multiplier: 1, constant: 48)
        let vtFilterNoneBtCst = NSLayoutConstraint(item: filterNoneBt, attribute: .top, relatedBy: .equal, toItem: filterLogoIv, attribute: .bottom, multiplier: 1, constant: 48)
        NSLayoutConstraint.activate([hlFilterNoneBtCst, vtFilterNoneBtCst])
        
        // Fuel
        filterFuelBt.setTitle("\u{02717}   Group by type of fuel",for: .normal)
        filterFuelBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterFuelBt.addTarget(self, action: #selector(filterFuelBtAction), for: .touchUpInside)
        filterFuelBt.translatesAutoresizingMaskIntoConstraints = false
        filterFuelBt.layer.shadowOffset = CGSize.zero
        filterFuelBt.layer.shadowOpacity = 0.5
        filterFuelBt.layer.shadowRadius = 4
        filterSv.addSubview(filterFuelBt)
        
        let hlFilterFuelBtCst = NSLayoutConstraint(item: filterFuelBt, attribute: .left, relatedBy: .equal, toItem: filterNoneBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterFuelBtCst = NSLayoutConstraint(item: filterFuelBt, attribute: .top, relatedBy: .equal, toItem: filterNoneBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterFuelBtCst, vtFilterFuelBtCst])
        
        // Gallon level
        filterGallonBt.setTitle("\u{02717}   Gallon's level",for: .normal)
        filterGallonBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterGallonBt.addTarget(self, action: #selector(filterGallonBtAction), for: .touchUpInside)
        filterGallonBt.translatesAutoresizingMaskIntoConstraints = false
        filterGallonBt.layer.shadowOffset = CGSize.zero
        filterGallonBt.layer.shadowOpacity = 0.5
        filterGallonBt.layer.shadowRadius = 4
        filterSv.addSubview(filterGallonBt)
        
        let hlFilterGallonBtCst = NSLayoutConstraint(item: filterGallonBt, attribute: .left, relatedBy: .equal, toItem: filterFuelBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterGallonBtCst = NSLayoutConstraint(item: filterGallonBt, attribute: .top, relatedBy: .equal, toItem: filterFuelBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterGallonBtCst, vtFilterGallonBtCst])
        
        // Cost per hour
        filterCostHrBt.setTitle("\u{02717}   Cost per hour",for: .normal)
        filterCostHrBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterCostHrBt.addTarget(self, action: #selector(filterCostHrBtAction), for: .touchUpInside)
        filterCostHrBt.translatesAutoresizingMaskIntoConstraints = false
        filterCostHrBt.layer.shadowOffset = CGSize.zero
        filterCostHrBt.layer.shadowOpacity = 0.5
        filterCostHrBt.layer.shadowRadius = 4
        filterSv.addSubview(filterCostHrBt)
        
        let hlFilterCostHrBtCst = NSLayoutConstraint(item: filterCostHrBt, attribute: .left, relatedBy: .equal, toItem: filterGallonBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterCostHrBtCst = NSLayoutConstraint(item: filterCostHrBt, attribute: .top, relatedBy: .equal, toItem: filterGallonBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterCostHrBtCst, vtFilterCostHrBtCst])
        
        // Cost per mile
        filterCostMiBt.setTitle("\u{02717}   Cost per mile",for: .normal)
        filterCostMiBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterCostMiBt.addTarget(self, action: #selector(filterCostMiBtAction), for: .touchUpInside)
        filterCostMiBt.translatesAutoresizingMaskIntoConstraints = false
        filterCostMiBt.layer.shadowOffset = CGSize.zero
        filterCostMiBt.layer.shadowOpacity = 0.5
        filterCostMiBt.layer.shadowRadius = 4
        filterSv.addSubview(filterCostMiBt)
        
        let hlFilterCostMiBtCst = NSLayoutConstraint(item: filterCostMiBt, attribute: .left, relatedBy: .equal, toItem: filterCostHrBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterCostMiBtCst = NSLayoutConstraint(item: filterCostMiBt, attribute: .top, relatedBy: .equal, toItem: filterCostHrBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterCostMiBtCst, vtFilterCostMiBtCst])
        
        // Price per gallon
        filterPriceGallonBt.setTitle("\u{02717}   Price per gallon",for: .normal)
        filterPriceGallonBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterPriceGallonBt.addTarget(self, action: #selector(filterPriceGallonBtAction), for: .touchUpInside)
        filterPriceGallonBt.translatesAutoresizingMaskIntoConstraints = false
        filterPriceGallonBt.layer.shadowOffset = CGSize.zero
        filterPriceGallonBt.layer.shadowOpacity = 0.5
        filterPriceGallonBt.layer.shadowRadius = 4
        filterSv.addSubview(filterPriceGallonBt)
        
        let hlFilterPriceGallonBtCst = NSLayoutConstraint(item: filterPriceGallonBt, attribute: .left, relatedBy: .equal, toItem: filterCostMiBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterPriceGallonBtCst = NSLayoutConstraint(item: filterPriceGallonBt, attribute: .top, relatedBy: .equal, toItem: filterCostMiBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterPriceGallonBtCst, vtFilterPriceGallonBtCst])
        
        // Distance
        filterDistanceBt.setTitle("\u{02717}   Price per gallon",for: .normal)
        filterDistanceBt.titleLabel?.font = UIFont(name: "Lato-Regular", size: 20)
        filterDistanceBt.addTarget(self, action: #selector(filterDistanceBtAction), for: .touchUpInside)
        filterDistanceBt.translatesAutoresizingMaskIntoConstraints = false
        filterDistanceBt.layer.shadowOffset = CGSize.zero
        filterDistanceBt.layer.shadowOpacity = 0.5
        filterDistanceBt.layer.shadowRadius = 4
        filterSv.addSubview(filterDistanceBt)
        
        let hlFilterDistanceBtCst = NSLayoutConstraint(item: filterDistanceBt, attribute: .left, relatedBy: .equal, toItem: filterPriceGallonBt, attribute: .left, multiplier: 1, constant: 0)
        let vtFilterDistanceBtCst = NSLayoutConstraint(item: filterDistanceBt, attribute: .top, relatedBy: .equal, toItem: filterPriceGallonBt, attribute: .bottom, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([hlFilterDistanceBtCst, vtFilterDistanceBtCst])
    }
    
    @objc private func filterExitBtAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func filterNoneBtAction(sender: UIButton!) {
        filterResetButton()
        filterNoneBt.setTitle("\u{02713}  No filter",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterFuelBtAction(sender: UIButton!) {
        filterResetButton()
        filterFuelBt.setTitle("\u{02713}  Group by type of fuel",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterGallonBtAction(sender: UIButton!) {
        filterResetButton()
        filterGallonBt.setTitle("\u{02713}  Gallon's level",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterCostHrBtAction(sender: UIButton!) {
        filterResetButton()
        filterCostHrBt.setTitle("\u{02713}  Cost per hour",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterCostMiBtAction(sender: UIButton!) {
        filterResetButton()
        filterCostMiBt.setTitle("\u{02713}  Cost per mile",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterPriceGallonBtAction(sender: UIButton!) {
        filterResetButton()
        filterPriceGallonBt.setTitle("\u{02713}  Price per gallon",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterDistanceBtAction(sender: UIButton!) {
        filterResetButton()
        filterDistanceBt.setTitle("\u{02713}  Price per gallon",for: .normal)
        filterExitBt.sendActions(for: .touchUpInside)
    }
    
    @objc private func filterResetButton() {
        filterNoneBt.setTitle("\u{02717}   No filter",for: .normal)
        filterFuelBt.setTitle("\u{02717}   Group by type of fuel",for: .normal)
        filterGallonBt.setTitle("\u{02717}   Gallon's level",for: .normal)
        filterCostHrBt.setTitle("\u{02717}   Cost per hour",for: .normal)
        filterCostMiBt.setTitle("\u{02717}   Cost per mile",for: .normal)
        filterPriceGallonBt.setTitle("\u{02717}   Price per gallon",for: .normal)
        filterDistanceBt.setTitle("\u{02717}   Price per gallon",for: .normal)
    }
}
