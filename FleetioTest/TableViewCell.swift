//
//  TableViewCell.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

protocol TableViewCellDelegate {
    func tvOpenDetail(nb: UInt)
}

class TableViewCell: UITableViewCell {
    var tvcDelegate: TableViewCellDelegate?
    
    let tool = Tool.shared
    
    let tvcBackVi = UIView()
    let tvcDetailBt = UIButton()
    
    var dhw: CGFloat = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Self
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = true
        
        // Back
        dhw = tool.currentDeviceWt - 48
        if dhw > (tool.currentDeviceHt - 96)/2 { dhw = (tool.currentDeviceHt - 96)/2 }
        
        tvcBackVi.backgroundColor = .white
        tvcBackVi.contentMode = UIView.ContentMode.scaleAspectFill
        tvcBackVi.translatesAutoresizingMaskIntoConstraints = false
        tvcBackVi.layer.cornerRadius = 8
        tvcBackVi.layer.shadowColor = UIColor.black.cgColor
        tvcBackVi.layer.shadowOffset = CGSize(width: 0, height: 0)
        tvcBackVi.layer.shadowRadius = 4
        tvcBackVi.layer.shadowOpacity = 0.15
        addSubview(tvcBackVi)
        
        let wtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: dhw - 8)
        let htTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128)
        let hcTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let vtTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24)
        let vbTvcBackViCst = NSLayoutConstraint(item: tvcBackVi, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtTvcBackViCst, htTvcBackViCst, hcTvcBackViCst, vtTvcBackViCst, vbTvcBackViCst])
        
        // Detail
        tvcDetailBt.tag = 0
        tvcDetailBt.setImage(UIImage(named: "detail"), for: .normal)
        tvcDetailBt.translatesAutoresizingMaskIntoConstraints = false
        tvcDetailBt.addTarget(self, action: #selector(tvcDetailBtAction), for: .touchUpInside)
        tvcDetailBt.layer.shadowOffset = CGSize.zero
        tvcDetailBt.layer.shadowOpacity = 0.5
        tvcDetailBt.layer.shadowRadius = 2
        tvcBackVi.addSubview(tvcDetailBt)
        
        let wtTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 32)
        let htTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 32)
        let hrTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .right, relatedBy: .equal, toItem: tvcBackVi, attribute: .right, multiplier: 1, constant: 0)
        let vbTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .bottom, relatedBy: .equal, toItem: tvcBackVi, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([wtTvcDetailBtCst, htTvcDetailBtCst, hrTvcDetailBtCst, vbTvcDetailBtCst])
    }
    
    @objc private func tvcDetailBtAction(sender: UIButton!) {
        tvcDelegate?.tvOpenDetail(nb: UInt(sender.tag))
    }
}
