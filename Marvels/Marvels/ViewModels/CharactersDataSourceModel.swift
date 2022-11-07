//
//  CharactersDataSourceModel.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 20/02/22.
//

import UIKit

class CharactersDataSourceModel<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource,UITableViewDelegate {
    
    private var cellIdentifier : String!
    
    private var items : [T]!
    
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    var handleCick : ((_ movie : T) -> ()) = {_ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let item = self.items[indexPath.row]
        self.configureCell(cell as! CELL, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ((items[indexPath.row] as? CharacterSeriesItem) != nil) {
            return UITableView.automaticDimension
        }
        return 225.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.handleCick(item)
    }
}
