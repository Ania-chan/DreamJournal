//
//  ChecklistTableViewCell.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/30.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    @IBOutlet weak var dreamItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
