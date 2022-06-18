//
//  CellModel.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation
import UIKit

class CellModel: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    func setupView() {
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
}
