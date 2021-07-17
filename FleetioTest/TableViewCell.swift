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
    
    let tvcPicIv = UIImageView()
    let tvcVendorLb = UILabel()
    let tvcVehicleLb = UILabel()
    let tvcFuelLb = UILabel()
    let tvcCostLb = UILabel()
    
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
        
        // Picture
        tvcPicIv.backgroundColor = UIColor(rgb: 0xeeeeee)
        tvcPicIv.image = UIImage(named: "logo")
        tvcPicIv.translatesAutoresizingMaskIntoConstraints = false
        tvcPicIv.layer.cornerRadius = 8
        tvcBackVi.addSubview(tvcPicIv)
        
        let wtTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 112)
        let htTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 112)
        let hlTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .left, relatedBy: .equal, toItem: tvcBackVi, attribute: .left, multiplier: 1, constant: 8)
        let vtTvcPicIvCst = NSLayoutConstraint(item: tvcPicIv, attribute: .top, relatedBy: .equal, toItem: tvcBackVi, attribute: .top, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([wtTvcPicIvCst, htTvcPicIvCst, hlTvcPicIvCst, vtTvcPicIvCst])
        
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
        let hrTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .right, relatedBy: .equal, toItem: tvcBackVi, attribute: .right, multiplier: 1, constant: -8)
        let vtTvcDetailBtCst = NSLayoutConstraint(item: tvcDetailBt, attribute: .top, relatedBy: .equal, toItem: tvcBackVi, attribute: .top, multiplier: 1, constant: 8)
        NSLayoutConstraint.activate([wtTvcDetailBtCst, htTvcDetailBtCst, hrTvcDetailBtCst, vtTvcDetailBtCst])
        
        // Vendor
        tvcVendorLb.textColor = .darkGray
        tvcVendorLb.font =  UIFont(name: "Lato-Bold", size: 16)
        tvcVendorLb.translatesAutoresizingMaskIntoConstraints = false
        tvcVendorLb.layer.shadowOffset = CGSize.zero
        tvcVendorLb.layer.shadowOpacity = 0.25
        tvcVendorLb.layer.shadowRadius = 2
        tvcBackVi.addSubview(tvcVendorLb)
        
        let htTvcVendorLbCst = NSLayoutConstraint(item: tvcVendorLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        let hlTvcVendorLbCst = NSLayoutConstraint(item: tvcVendorLb, attribute: .left, relatedBy: .equal, toItem: tvcPicIv, attribute: .right, multiplier: 1, constant: 8)
        let hrTvcVendorLbCst = NSLayoutConstraint(item: tvcVendorLb, attribute: .right, relatedBy: .equal, toItem: tvcDetailBt, attribute: .left, multiplier: 1, constant: -8)
        let vtTvcVendorLbCst = NSLayoutConstraint(item: tvcVendorLb, attribute: .top, relatedBy: .equal, toItem: tvcPicIv, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([htTvcVendorLbCst, hlTvcVendorLbCst, hrTvcVendorLbCst, vtTvcVendorLbCst])
        
        // Vehicule
        tvcVehicleLb.textColor = .darkGray
        tvcVehicleLb.font =  UIFont(name: "Lato-Regular", size: 16)
        tvcVehicleLb.translatesAutoresizingMaskIntoConstraints = false
        tvcVehicleLb.layer.shadowOffset = CGSize.zero
        tvcVehicleLb.layer.shadowOpacity = 0.25
        tvcVehicleLb.layer.shadowRadius = 2
        tvcBackVi.addSubview(tvcVehicleLb)
        
        let htTvcVehicleLbCst = NSLayoutConstraint(item: tvcVehicleLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        let hlTvcVehicleLbCst = NSLayoutConstraint(item: tvcVehicleLb, attribute: .left, relatedBy: .equal, toItem: tvcVendorLb, attribute: .left, multiplier: 1, constant: 0)
        let hrTvcVehicleLbCst = NSLayoutConstraint(item: tvcVehicleLb, attribute: .right, relatedBy: .equal, toItem: tvcDetailBt, attribute: .right, multiplier: 1, constant: 0)
        let vtTvcVehicleLbCst = NSLayoutConstraint(item: tvcVehicleLb, attribute: .top, relatedBy: .equal, toItem: tvcVendorLb, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([htTvcVehicleLbCst, hlTvcVehicleLbCst, hrTvcVehicleLbCst, vtTvcVehicleLbCst])
        
        // Fuel
        tvcFuelLb.textColor = .darkGray
        tvcFuelLb.font =  UIFont(name: "Lato-Regular", size: 16)
        tvcFuelLb.translatesAutoresizingMaskIntoConstraints = false
        tvcFuelLb.layer.shadowOffset = CGSize.zero
        tvcFuelLb.layer.shadowOpacity = 0.25
        tvcFuelLb.layer.shadowRadius = 2
        tvcBackVi.addSubview(tvcFuelLb)
        
        let htTvcFuelLbCst = NSLayoutConstraint(item: tvcFuelLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        let hlTvcFuelLbCst = NSLayoutConstraint(item: tvcFuelLb, attribute: .left, relatedBy: .equal, toItem: tvcVehicleLb, attribute: .left, multiplier: 1, constant: 0)
        let hrTvcFuelLbCst = NSLayoutConstraint(item: tvcFuelLb, attribute: .right, relatedBy: .equal, toItem: tvcVehicleLb, attribute: .right, multiplier: 1, constant: 0)
        let vtTvcFuelLbCst = NSLayoutConstraint(item: tvcFuelLb, attribute: .top, relatedBy: .equal, toItem: tvcVehicleLb, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([htTvcFuelLbCst, hlTvcFuelLbCst, hrTvcFuelLbCst, vtTvcFuelLbCst])
        
        // Cost
        tvcCostLb.textColor = .darkGray
        tvcCostLb.font =  UIFont(name: "Lato-Italic", size: 16)
        tvcCostLb.translatesAutoresizingMaskIntoConstraints = false
        tvcCostLb.layer.shadowOffset = CGSize.zero
        tvcCostLb.layer.shadowOpacity = 0.25
        tvcCostLb.layer.shadowRadius = 2
        tvcBackVi.addSubview(tvcCostLb)
        
        let htTvcCostLbCst = NSLayoutConstraint(item: tvcCostLb, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28)
        let hlTvcCostLbCst = NSLayoutConstraint(item: tvcCostLb, attribute: .left, relatedBy: .equal, toItem: tvcFuelLb, attribute: .left, multiplier: 1, constant: 0)
        let hrTvcCostLbCst = NSLayoutConstraint(item: tvcCostLb, attribute: .right, relatedBy: .equal, toItem: tvcFuelLb, attribute: .right, multiplier: 1, constant: 0)
        let vtTvcCostLbCst = NSLayoutConstraint(item: tvcCostLb, attribute: .top, relatedBy: .equal, toItem: tvcFuelLb, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([htTvcCostLbCst, hlTvcCostLbCst, hrTvcCostLbCst, vtTvcCostLbCst])
    }
    
    @objc private func tvcDetailBtAction(sender: UIButton!) {
        tvcDelegate?.tvOpenDetail(nb: UInt(sender.tag))
    }
}
