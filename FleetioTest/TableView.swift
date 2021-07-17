//
//  TableView.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

protocol TableViewDelegate {
    func mainTablevRefresh()
    func mainOpenDetail(fuelEntrie: FuelEntrie)
}

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    var tableViewDelegate: TableViewDelegate?
    
    let tableRc = UIRefreshControl()
    
    let api = Api.shared
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        // View
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = .clear
        refreshControl = tableRc
        showsVerticalScrollIndicator = false
        rowHeight = UITableView.automaticDimension
        translatesAutoresizingMaskIntoConstraints = false
        register(TableViewCell.self as AnyClass, forCellReuseIdentifier: "TableViewCell")
        
        // Refreash
        tableRc.addTarget(self, action: #selector(tablevRefresh(_:)), for: .valueChanged)
    }
    
    @objc private func tablevRefresh(_ sender: Any) {
        tableRc.endRefreshing()
        tableViewDelegate?.mainTablevRefresh()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let foot = UIView()
        
        return foot
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return api.aApiFilteredFuelEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fe = api.aApiFilteredFuelEntries[indexPath.row]
        
        let cell:TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell)!
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.tvcDelegate = self
        
        // Detail button
        cell.tvcDetailBt.tag = indexPath.row
        
        // Vendor
        if fe.vendor_name == "blank" {
            cell.tvcVendorLb.text = "Vendor unknown"
        } else {
            cell.tvcVendorLb.text = fe.vendor_name
        }
        
        // Vehicle
        if fe.vehicle_name == "blank" {
            cell.tvcVehicleLb.text = "Vehicle unknown"
        } else {
            cell.tvcVehicleLb.text = fe.vehicle_name
        }
        
        // Fuel
        if fe.fuel_type_name == "blank" {
            cell.tvcFuelLb.text = "Fuel unknown"
        } else {
            cell.tvcFuelLb.text = fe.fuel_type_name
        }
        
        // Fuel
        if fe.cost_per_hr == -1 && fe.cost_per_mi == -1 {
            cell.tvcCostLb.text = "Cost unknown"
        } else if fe.cost_per_hr == -1 {
            cell.tvcCostLb.text = "$\(fe.cost_per_mi)/mi"
        } else if fe.cost_per_mi == -1 {
            cell.tvcCostLb.text = "$\(fe.cost_per_hr)/hr"
        } else {
            cell.tvcCostLb.text = "$\(fe.cost_per_hr)/hr + $\(fe.cost_per_mi)/mi"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewDelegate?.mainOpenDetail(fuelEntrie: api.aApiFilteredFuelEntries[indexPath.row])
        //tableViewDelegate?.mainOpenCell(companie: api.aApiFilteredFuelEntries[indexPath.row])
    }
    
    // TableViewCellDelegate
    func tvOpenDetail(nb: UInt) {
        //tableViewDelegate?.mainOpenDetail(fuelEntrie: <#T##FuelEntrie#>)
    }
}
