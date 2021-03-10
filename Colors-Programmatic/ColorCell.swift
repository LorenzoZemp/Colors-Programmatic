//
//  ColorCell.swift
//  Colors-Programmatic
//
//  Created by Lorenzo Zemp on 10/03/21.
//

import UIKit

class ColorCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(color: UIColor) {
        backgroundColor = color
    }
    
}
