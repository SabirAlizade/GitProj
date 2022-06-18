//
//  MainViewController.swift
//  GitProj
//
//  Created by Sabir Alizade on 12.06.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    
    var viewModel: MainViewModel = {
        let model = MainViewModel()
        return model
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(DashboardCell.self, forCellReuseIdentifier: DashboardCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didAddTask))
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            tableView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func didAddTask() {
        didAdd { taskName in
            self.viewModel.addData(name: taskName)
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return viewModel.mainTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DashboardCell.description() , for: indexPath) as? DashboardCell {
            cell.item = viewModel.mainTask[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskId = viewModel.mainTask[indexPath.row].id
        showCreateController(taskId: taskId.description)
        
    }
    
    func tableView(_ tableVIew: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    private func showCreateController(taskId: String) {
        let vc = TaskNoteViewController()
        vc.viewModel.taskId = taskId
        show(vc,sender: self)
    }
}

extension MainViewController {
    func didAdd(completion: @escaping(String) -> Void) {
        var rootTextField = UITextField()
        let alertController = UIAlertController(title: "Choose task name", message: "Task lenhgth should be max. 20 characters!", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Type task name"
            rootTextField = textField
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        let save = UIAlertAction(title: "Save", style: .default) { alert in
            guard let text = rootTextField.text else {return}
            completion(text)
        }
        alertController.addAction(cancel)
        alertController.addAction(save)
        present(alertController, animated: true)
    }
}

extension MainViewController: UpdateProtocol {
    func update(note: String, index: Int) {
        viewModel.data[index].note = note
        tableView.reloadData()
        viewModel.saveData()
    }
}
