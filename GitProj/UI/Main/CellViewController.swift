//
//  CellViewController.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation
import UIKit

class CellViewController: CellModel {
    var item: TaskModel? {
        didSet {
            guard let item = item else { return }
            
            titleLabel.text = item.name
            deadLineLabel.text = item.date
            
            if let note = item.note {
                noteLabel.text = note
            } else {
                noteLabel.text = "(empty)"
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deadLineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .systemOrange
        return label
    }()
    
    let noteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
   
        
        addSubview(titleLabel)
        addSubview(noteLabel)
        addSubview(deadLineLabel)
        
      NSLayoutConstraint.activate([

            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            noteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            noteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            noteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            noteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            deadLineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            deadLineLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0),
            deadLineLabel.heightAnchor.constraint(equalToConstant: 50),
            
         
        ])
    }
}





class CellProperty: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    func setupView() {}
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


