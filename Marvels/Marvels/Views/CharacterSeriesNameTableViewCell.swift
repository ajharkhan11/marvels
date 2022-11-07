//
//  CharacterSeriesNameTableViewCell.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 02/02/22.
//

import UIKit

class CharacterSeriesNameTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var seriesNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func refreshSeriesName(_ seriesName: String) {
        seriesNameLabel.text = seriesName
    }
}
