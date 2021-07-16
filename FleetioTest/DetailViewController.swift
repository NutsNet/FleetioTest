//
//  DetailViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    let detailFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Self
        
        // Fx
        detailFx.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailFx)
        
        let hlDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let vbDetailFxCst = NSLayoutConstraint(item: detailFx, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlDetailFxCst, hrDetailFxCst, vtDetailFxCst, vbDetailFxCst])
    }
}
