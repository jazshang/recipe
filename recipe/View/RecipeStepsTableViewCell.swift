//
//  RecipeStepsTableViewCell.swift
//  recipe
//
//  Created by Jasmine Shang on 12/9/21.
//

import UIKit

class RecipeStepsTableViewCell: UITableViewCell {

    @IBOutlet weak var stepLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }

}
