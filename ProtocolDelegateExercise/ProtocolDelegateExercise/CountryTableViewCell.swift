//
//  CountryTableViewCell.swift
//  ProtocolDelegateExercise
//
//  Created by Christoper on 19/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var LabelText: UILabel!
    @IBOutlet weak var DescriptionText: UILabel!
    @IBOutlet weak var ImagesLandscape: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
