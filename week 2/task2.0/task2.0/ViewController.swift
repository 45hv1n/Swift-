//
//  ViewController.swift
//  task2.0
//
//  Created by Ashvin Alva on 05/07/23.
//

import UIKit

class ViewController: UIViewController {

    //Outlet for all the components
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userDepartment: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userAgg: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    //Object of the storage class, where all the instance of the students are stored
    var storage = Storage()
    
    var studentId: Int = 0
    
    var stud : Storage.StudentDetails? = nil
    
    var update : Bool = false
    
    var departmentArr = ["ME", "CSE", "ISE"]
    var departmentPicker = UIPickerView()
    
    
    // Actions to perform when the button is clicked
    @IBAction func SaveBtn(_ sender: Any) {
        
        // Instantiating the Second Screen
        let secondView = UIStoryboard(name: "Main", bundle: nil)
        let secondController = secondView.instantiateViewController(withIdentifier: "secondControllerView") as! SecondViewController
        
        //secondController.modalPresentationStyle = .fullScreen
        
        secondController.completionInstance = {
            (boolean , studentDetailArr, id) in
                self.update = boolean
            
                self.userName.text = studentDetailArr.name
                self.userId.text = String(studentDetailArr.id)
                self.userDepartment.text = studentDetailArr.department
                self.userPhone.text = String(studentDetailArr.contact)
                self.userAgg.text = String(studentDetailArr.aggregate)
                self.userEmail.text = studentDetailArr.email
            
                self.studentId = id
                self.stud = studentDetailArr
        }
        
        print("\n\n\nEdit Option : \(update)\n\n\n")
        
        if(!self.update){
            //Adding new student data
            storage.addStudentDetails(studentDetail: Storage.StudentDetails(name: userName.text!, id: Int(userId.text!)! , contact: Int( userPhone.text!)!, aggregate: Int(userAgg.text!)!, department: userDepartment.text!, email: userEmail.text!))
        }
        else{
            // update the details
            print("\n\n\nMeow update\n\n\n\n")
            print(storage.updateStudentDetail(elementId: stud! ,name: userName.text!, id: Int(userId.text!)! , contact: Int( userPhone.text!)!, aggregate: Int(userAgg.text!)!, department: userDepartment.text!, email: userEmail.text!,studentId : self.studentId))
            print(storage.viewStudentDetails())
        }
        //print(storage.studentDetailArr[0].name)
        
        userName.text = ""
        userId.text = ""
        userDepartment.text = ""
        userPhone.text = ""
        userAgg.text = ""
        userEmail.text = ""

        //setup the necessary valuesfor the sencond controller
        
        //self.dismiss(animated: true)
        
        self.update = false
        
        //self.navigationController?.pushViewController(secondController , animated: true)
       
        self.present(secondController, animated: true)
        
        //print(storage.viewStudentDetails())
        secondController.setup()
        
        
                
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userDepartment.inputView = departmentPicker
        
        //bottomImage.image = UIImage(named: "undraw_cat_epte")
        
        departmentPicker.delegate = self
        departmentPicker.dataSource = self
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departmentArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departmentArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userDepartment.text = departmentArr[row]
    }
}

