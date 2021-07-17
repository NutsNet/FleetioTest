//
//  DetailViewController.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    let detailFx = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    let detailTitleLbt = UILabel()
    let detailExitBt = UIButton()
    
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
        
        // Exit
        detailExitBt.setTitle("\u{02297}",for: .normal)
        detailExitBt.titleLabel?.font = UIFont(name: "Lato-Bold", size: 48)
        detailExitBt.addTarget(self, action: #selector(detailExitBtAction), for: .touchUpInside)
        detailExitBt.translatesAutoresizingMaskIntoConstraints = false
        detailExitBt.layer.shadowOffset = CGSize.zero
        detailExitBt.layer.shadowOpacity = 0.5
        detailExitBt.layer.shadowRadius = 4
        view.addSubview(detailExitBt)
        
        let wtDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let htDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 64)
        let hlDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let vtDetailExitBtCst = NSLayoutConstraint(item: detailExitBt, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtDetailExitBtCst, htDetailExitBtCst, hlDetailExitBtCst, vtDetailExitBtCst])
        
        // Title
        detailTitleLbt.textAlignment = .center
        detailTitleLbt.text = "fuel entrie detail"
        detailTitleLbt.font =  UIFont(name: "Lato-Bold", size: 24)
        detailTitleLbt.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLbt.layer.shadowOffset = CGSize.zero
        detailTitleLbt.layer.shadowOpacity = 0.5
        detailTitleLbt.layer.shadowRadius = 4
        view.addSubview(detailTitleLbt)
        
        let hlDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let hrDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let vtDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .top, relatedBy: .equal, toItem: detailExitBt, attribute: .top, multiplier: 1, constant: 0)
        let vbDetailTitleLbCst = NSLayoutConstraint(item: detailTitleLbt, attribute: .bottom, relatedBy: .equal, toItem: detailExitBt, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([hlDetailTitleLbCst, hrDetailTitleLbCst, vtDetailTitleLbCst, vbDetailTitleLbCst])
    }
    
    @objc private func detailExitBtAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
}
