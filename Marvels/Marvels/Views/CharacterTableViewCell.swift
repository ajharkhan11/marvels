//
//  CharacterTableViewCell.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func refreshWithCharacter(_ character: CharacterDataModel) {
        characterNameLabel.text = character.name
        guard let charThumbnail = character.thumbnail, let path = charThumbnail.path, let imageExtension = charThumbnail.imageExtension else {return}
        let imageURLString = path + ".\(imageExtension)"
        characterImageView.loadImageUsingCache(withUrl: imageURLString)
        characterImageView.layer.cornerRadius = 5
    }
    
}
