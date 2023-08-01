//
//  MainInteractor.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation

//Has a reference to the presenter, data model

class Interactor: PresenterToInteractorProtocol{
    
    var presentor: InteractorToPresenterProtocol?
    
    let stored = Storage()
        
    func dbConnect(obj: [String]) {
        
        print("DB function: interactor")
        Storage.studentDetailArr.append( Storage.StudentDetails(name: obj[0], id : Int(obj[1])!, contact: Int(obj[3])!,aggregate: Int(obj[4])!, department: obj[2], email: obj[5]))

//        stored.addStudentDetails(studentDetail: Storage.StudentDetails(name: obj[0], id : Int(obj[1])!, contact: Int(obj[3])!,aggregate: Int(obj[4])!, department: obj[2], email: obj[5] ))
//        print(stored.viewStudentDetails())
    }
    
    func update(obj: [String]) {
        print("Update function: interactor")
        
//        stored.updateStudentDetail(name: obj[0], id: Int(obj[1])!, contact: Int(obj[3])!, aggregate: Int(obj[4])!, department: obj[2], email: obj[5])
        
        for (index, element) in Storage.studentDetailArr.enumerated() {
                //print(" Storage meow: \(type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))")
            if(element.id == Storage.updateID) {
                Storage.studentDetailArr[index] = (type(of: element).init(name: obj[0], id: Int(obj[1])!, contact: Int(obj[3])!, aggregate: Int(obj[4])!, department: obj[2], email: obj[5]))
            }
        }
        
        Storage.isUpdating = false
        Storage.updateID = nil
        print("Updated: \(stored.viewStudentDetails())")
    }
    
}
