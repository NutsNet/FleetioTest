//
//  TableView.swift
//  FleetioTest
//
//  Created by Christophe Vichery on 7/15/21.
//

import UIKit

protocol TableViewDelegate {
    //func mainOpenCell(companie: Companie)
}

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var tableViewDelegate: TableViewDelegate?
    
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
        register(TableViewCell.self as AnyClass, forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let foot = UIView()
        
        return foot
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return api.aApiFuelEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let companie = api.aApiFuelEntries[indexPath.row]
        
        let cell:TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell)!
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableViewDelegate?.mainOpenCell(companie: api.aApiFuelEntries[indexPath.row])
    }
}
