//
//  TaskViewController.swift
//  GitProj
//
//  Created by Sabir Alizade on 15.06.2022.
//

import Foundation
import UIKit
class CreateTaskViewController: UIViewController {
    

    var viewModel: CreateTaskViewModel = {
        let model = CreateTaskViewModel()
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapCreate))
    }
    @objc func didTapCreate(){
        
    }
}
