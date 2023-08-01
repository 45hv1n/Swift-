//
//  ViewController.swift
//  task2
//
//  Created by Ashvin Alva on 05/07/23.
//

import UIKit


class ViewController: UIViewController, PresenterToViewProtocol {
    
    //presentor
    var viewToPresentor: ViewToPresenterProtocol? 
    
    let stored: Storage = Storage()
    
    //Properties
    var objArr: [String] = []
    
    //Outlets and Actions
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userDepartment: UITextField!
    @IBOutlet weak var userAggregate: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func saveData(_ sender: Any) {

        objArr.removeAll()
        
        objArr.append(userName.text!)
        objArr.append(userId.text!)
        objArr.append(userDepartment.text!)
        objArr.append(userPhone.text!)
        objArr.append(userAggregate.text!)
        objArr.append(userEmail.text!)
        
        if Storage.isUpdating{
            viewToPresentor?.updateUserData(objArrayData: objArr)
            let alert = UIAlertController(title: "Updated Successfully", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert , animated: true, completion: nil)
        }
        else{
            viewToPresentor?.saveTheUserData(objArrayData: objArr)
            let alert = UIAlertController(title: "Saved Successfully", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert , animated: true, completion: nil)
        }
        
        userName.text = ""
        userId.text = ""
        userDepartment.text = ""
        userPhone.text = ""
        userEmail.text = "" 
        userAggregate.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Storage.isUpdating{
            var studentArr: [Storage.StudentDetails] = stored.viewStudentDetails(Storage.updateID)
            print("The value in Student Array \(studentArr)")
            
            userName.text = studentArr[0].name
            userId.text = String(studentArr[0].id)
            userPhone.text = String(studentArr[0].contact)
            userDepartment.text = studentArr[0].department
            userAggregate.text = String(studentArr[0].aggregate)
            userEmail.text = studentArr[0].email
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardTappedAround()
                
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardForHidden), name: UIResponder.keyboardDidHideNotification
                                               , object: nil)
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardForShown), name: UIResponder.keyboardDidShowNotification
                                               , object: nil)
    }
    
    @objc func keyboardForHidden(notification: Notification){
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardForShown(notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
        NSValue{
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.view.frame.height - (userEmail.frame.origin.y + userEmail.frame.height)
            self.view.frame.origin.y += keyboardHeight - bottomSpace -  10
        }
    }
}

extension UIViewController{
    func hideKeyboardTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
