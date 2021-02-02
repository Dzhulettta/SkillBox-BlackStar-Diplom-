//
//  SizeTableViewCell.swift
//  Diplom(BlackStar)
//
//  Created by Юлия Чужинова on 25.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class SizeTableViewCell: UITableViewCell {

    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var done: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        done.tintColor = .systemGreen
        done.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //MARK: - Запись data
    
    func initCell(item: String){
            
        self.done.isHidden = true
        self.size.text = item
    }
}
