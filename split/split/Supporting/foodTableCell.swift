//
//  foodTableCell.swift
//  split
//
//  Created by Collin Qian on 7/16/22.
//

import UIKit

protocol foodTableCellDelegate {
    func didTapButton(with title: String)
}

class foodTableCell: UITableViewCell {
    
    var delegate : foodTableCellDelegate?
    
    static let identifier = "foodTableCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "foodTableCell", bundle: nil)
    }
    
    @IBOutlet weak var switchButton: UIButton!
    
    @IBAction func addPerson(_ sender: UIButton) {
        delegate?.didTapButton(with: title)
    }
    
    private var title: String = ""
    
    func configure(with title: String) {
        self.title = title
        switchButton.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        switchButton.setTitleColor(.link, for: .normal)
        // Initialization code
    }
    
}
