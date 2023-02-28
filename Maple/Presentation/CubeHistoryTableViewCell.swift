//
//  CubeHistoryTableViewCell.swift
//  Maple
//
//  Created by 성제 on 2023/02/28.
//

import Foundation
import UIKit

class CubeHistoryTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var usedEquipment: UILabel!
    @IBOutlet weak var cubeType: UILabel!
    @IBOutlet weak var cubeResult: UILabel!
    @IBOutlet weak var potential_option_grade: UILabel!
    @IBOutlet weak var additional_potential_option_grade: UILabel!
    @IBOutlet weak var usedDate: UILabel!
}
