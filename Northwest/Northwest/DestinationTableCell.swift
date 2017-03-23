//
//  DestinationTableCell.swift
//  Northwest
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class DestinationTableCell: UITableViewCell {
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var coloredOverlayView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
