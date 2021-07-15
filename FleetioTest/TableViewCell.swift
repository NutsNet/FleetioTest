//
//  TableViewCell.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    let tool = Tool.shared
    
    let tvcBackVi = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Self
        backgroundColor = .clear
        
        // Back
        tvcBackVi.backgroundColor = .white
        tvcBackVi.contentMode = UIView.ContentMode.scaleAspectFill
        tvcBackVi.translatesAutoresizingMaskIntoConstraints = false
        tvcBackVi.layer.cornerRadius = 10
        tvcBackVi.layer.shadowColor = UIColor.black.cgColor
        tvcBackVi.layer.shadowOffset = CGSize(width: 0, height: 0)
        tvcBackVi.layer.shadowRadius = 4
        tvcBackVi.layer.shadowOpacity = 0.1
        addSubview(tvcBackVi)
        
        let wtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: tool.currentDeviceWt - 20)
        let htTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let hcTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let vtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        let vbTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtTvcBackViCst, htTvcBackViCst, hcTvcBackViCst, vtTvcBackViCst, vbTvcBackViCst])
    }
}
