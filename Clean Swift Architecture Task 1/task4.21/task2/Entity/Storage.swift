//
//  Storage.swift
//  task2.0
//
//  Created by Ashvin Alva on 06/07/23.
//

import Foundation


class Storage{
    
    static var studentDetailArr : [StudentDetails] = []
    static var isUpdating: Bool = false
    static var updateID: Int?
    
    // Structure to store the details of the students - [Modal]
    struct StudentDetails: Hashable{
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
        
    }
  
//  Function to get the studentArr
    func viewStudentDetails(_ studentId: Int? = nil) -> [StudentDetails] {

        var studentArr: [StudentDetails] = []

        if studentId != nil{
            for element in Storage.studentDetailArr{
                if element.id == Storage.updateID{
                    studentArr.append(element)
                }
            }
            return studentArr
        }
        return Storage.studentDetailArr
    }
    
}



