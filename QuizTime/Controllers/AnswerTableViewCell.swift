//
//  AnswerTableViewCell.swift
//  QuizTime
//
//  Created by Quyen on 5/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var ansView: UIView!
    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var ansContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
