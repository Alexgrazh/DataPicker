//
//  ViewController.swift
//  dataPicker
//
//  Created by Alex Grazhdan on 10.04.2023.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker()
    
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var pickerbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatepicker()
    }
    

    func createToolBar() -> UIToolbar{
       let toolbar = UIToolbar()
       toolbar.sizeToFit()
       
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
       toolbar.setItems([doneBtn], animated: true)
       
       
       return toolbar
   }

    func createDatepicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdayField.textAlignment = .center
        birthdayField.inputView = datePicker
        birthdayField.inputAccessoryView = createToolBar()
    }
    
   @objc func donePressed(){
        let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .none
        
       self.birthdayField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

