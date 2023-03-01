//
//  ClassroomScheduleTableViewCell.swift
//  Kulasroom
//
//  Created by Batuhan Arat on 6.01.2023.
//

import UIKit

class ClassroomScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var classTimeLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
