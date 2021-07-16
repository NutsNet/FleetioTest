//
//  FilterViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class FilterViewController: UIViewController {
    let filterFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
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
    }
}
