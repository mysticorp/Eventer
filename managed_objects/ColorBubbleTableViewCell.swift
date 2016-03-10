//
//  ColorBubbleTableViewCell.swift
//  MysticEvents
//
//  Created by Erik Walter on 3/10/16.
//  Copyright © 2016 Erik Walter. All rights reserved.
//

import UIKit

class ColorBubbleTableViewCell: UITableViewCell {
    @IBOutlet weak var bubbleRect: RoundRectView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
