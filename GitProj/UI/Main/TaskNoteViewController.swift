//
//  TaskNoteViewController.swift
//  GitProj
//
//  Created by Sabir Alizade on 16.06.2022.
//

import UIKit

class TaskNoteViewController: UIViewController {
    
    var taskCategory = ["Normal", "Important"]
    
    var viewModel: UpdateViewModel = {
        let model = UpdateViewModel()
        return model
    }()
    
    let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add note"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let noteTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.contentInset = UIEdgeInsets()
        return view
    }()
    
    lazy var categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        return picker
    }()
    
    lazy var categoryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Choose task importance"
        textField.borderStyle = .roundedRect
        textField.inputView = categoryPicker
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.frame = CGRect(x: 100, y: 100, width: 150, height: 35)
        return textField
    }()
    
    lazy var deadlineTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task deadline: dd/MM/yyy hh:mm"
        textField.borderStyle = .roundedRect
        textField.inputView = deadlineDatePicker
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.frame = CGRect(x: 100, y: 100, width: 150, height: 35)
        return textField
    }()
    
    lazy var deadlineDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        picker.timeZone = NSTimeZone.local
        picker.addTarget(self, action: #selector(TaskNoteViewController.datePickerValueChanged(_:)), for: .valueChanged)
        return picker
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker(frame: .zero)
        picker.datePickerMode = .date
        picker.timeZone = .current
        picker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        return picker
    }()
    
    let toolBar: UIToolbar = {
        let bar = UIToolbar()
        bar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let DoneButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(tapDone))//3
        bar.setItems([flexibleSpace, DoneButton], animated: false)
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapUpdate))
        view.addGestureRecognizer(UIGestureRecognizer (target: self, action: #selector (tapDone)))
        
        view.addSubview(noteTitleLabel)
        view.addSubview(noteTextView)
        view.addSubview(categoryTextField)
        view.addSubview(deadlineTextField)
        
        NSLayoutConstraint.activate([
            
            noteTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            noteTitleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            noteTextView.leadingAnchor.constraint(equalTo: noteTitleLabel.leadingAnchor),
            noteTextView.topAnchor.constraint(equalTo: noteTitleLabel.bottomAnchor, constant: 16),
            noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noteTextView.heightAnchor.constraint(equalToConstant: 250),
            
            categoryTextField.leadingAnchor.constraint(equalTo: noteTextView.leadingAnchor),
            categoryTextField.topAnchor.constraint(equalTo: noteTextView.bottomAnchor, constant: 16),
            categoryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoryTextField.heightAnchor.constraint(equalToConstant: 40),
            
            deadlineTextField.leadingAnchor.constraint(equalTo: noteTextView.leadingAnchor),
            deadlineTextField.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 16),
            deadlineTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            deadlineTextField.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
    }
    
    @objc private func didTapUpdate(){
        
        guard let note = noteTextView.text else {return}
        viewModel.updateData(note: note)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapDone() {
        view.endEditing(false)
    }
}

extension TaskNoteViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return taskCategory[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taskCategory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextField.text = taskCategory[row]
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy hh:mm"
        
        let selectedDate: String = dateFormatter.string(from: sender.date)
        deadlineTextField.text = selectedDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
