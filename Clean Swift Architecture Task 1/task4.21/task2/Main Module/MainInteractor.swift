//
//  MainInteractor.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation
import Firebase
import FirebaseCore

//Has a reference to the presenter, data model

class Interactor: InteractorProtocolMainModule{
    
    var presenter: PresenterProtocolMainModule?
    
    let stored = Storage()
    
//    var ref: DatabaseReference!
    
    func addStudentData(obj: [String]) {
        print("DB function: interactor")
        do {
            try Storage.studentDetailArr.append(Storage.StudentDetails(name: obj[0], id : Int(obj[1])!, contact: Int(obj[3])!,aggregate: Int(obj[4])!, department: obj[2], email: obj[5] ))
            print(stored.viewStudentDetails())
            presenter?.messageSuccess(msg: "Saved Successfully")
        }
        catch{
            presenter!.messageFailed(msg: "Failed")
        }
        
    }
    
    func updateStudentData(name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String) {
    
        print("------------Meow Storage Meow------------")
        for (index, element) in Storage.studentDetailArr.enumerated() {
                //print(" Storage meow: \(type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))")
            if(element.id == Storage.updateID) {
                
                do {
                    try Storage.studentDetailArr[index] = (type(of: element).init(name: name, id: id, contact: contact, aggregate: aggregate,department: department, email: email))
                    print(stored.viewStudentDetails())
                   
                    Storage.isUpdating = false
                    Storage.updateID = nil
                    
                    presenter?.messageSuccess(msg: "Update Successfully")
                }
                catch{
                    presenter!.messageFailed(msg: "Update Failed")
                }
            }
        }
        
    }
    
}
