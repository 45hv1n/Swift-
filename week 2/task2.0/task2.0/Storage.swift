//
//  Storage.swift
//  task2.0
//
//  Created by Ashvin Alva on 06/07/23.
//

import Foundation


class Storage{
    
    static private var studentDetailArr : [StudentDetails] = []
    
    // Structure to store the details of the students - [Modal]
    struct StudentDetails{
        var name : String
        var id: Int
        var contact : Int
        var aggregate : Int
        var department : String
        var email : String
        
        init(name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String ){
            self.name = name
            self.id = id
            self.contact = contact
            self.aggregate = aggregate
            self.department = department
            self.email = email
        }
        
        mutating func updateDetails(name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String ){
            self.name = name
            self.id = id
            self.contact = contact
            self.aggregate = aggregate
            self.department = department
            self.email = email
        }
    }
    
    // Function to add an new entry to the struct
    func addStudentDetails(studentDetail : StudentDetails){
        Storage.studentDetailArr.append(studentDetail)
    }
    
    // Function to get the studentArr
    func viewStudentDetails() -> [StudentDetails] {
        return Storage.studentDetailArr
    }
    
    // Function to remove the Student detail bsed on the id of that student
    func removeStudentDetail(id : Int) -> [StudentDetails]{
        for (index,element) in Storage.studentDetailArr.enumerated(){
            if element.id == id{
                Storage.studentDetailArr.remove(at: index)
            }
        }
        return Storage.studentDetailArr
    }
    
    //Function to update the value of a student based on his id
    func updateStudentDetail(elementId : Storage.StudentDetails, name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String, studentId: Int) -> [Storage.StudentDetails] {
        
        print("--------------Meow Storage Meow------------")
        for (index, element) in Storage.studentDetailArr.enumerated() {
            //print(" Storage meow: \(type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))")
            if(element.id == studentId) {
                Storage.studentDetailArr[index] = (type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))
            }
        }
        return Storage.studentDetailArr
    }
}



