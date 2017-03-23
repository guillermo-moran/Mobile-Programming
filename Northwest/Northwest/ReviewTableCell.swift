//
//  ReviewTableCell.swift
//  Northwest
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ReviewTableCell: UITableViewCell {
    
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewerImageView: UIImageView!
    @IBOutlet weak var reviewTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Rounded profile picture image
        self.reviewerImageView.layer.cornerRadius = self.reviewerImageView.frame.size.width / 2;
        self.reviewerImageView.clipsToBounds      = true;
        self.reviewerImageView.layer.borderWidth  = 3.0
        self.reviewerImageView.layer.borderColor  = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
