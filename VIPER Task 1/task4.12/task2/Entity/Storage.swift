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
    
    // Function to add an new entry to the struct
//    func addStudentDetails(studentDetail : StudentDetails){
//        Storage.studentDetailArr.append(studentDetail)
//    }
    
    // Function to get the studentArr
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
    
    // Function to remove the Student detail bsed on the id of that student
//    func removeStudentDetail(id : Int) -> [StudentDetails]{
//        for (index,element) in Storage.studentDetailArr.enumerated(){
//            if element.id == id{
//                Storage.studentDetailArr.remove(at: index)
//            }
//        }
//        return Storage.studentDetailArr
//    }
    
    //Function to update the value of a student based on his id
//    func updateStudentDetail(structElement : Storage.StudentDetails, name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String, studentId: Int) -> [Storage.StudentDetails] {
//
//        print("--------------Meow Storage Meow------------")
//        for (index, element) in Storage.studentDetailArr.enumerated() {
//            //print(" Storage meow: \(type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))")
//            if(element.id == studentId) {
//                Storage.studentDetailArr[index] = (type(of: structElement).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))
//            }
//        }
//        return Storage.studentDetailArr
//    }
    
//    func updateStudentDetail(name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String) {
//
//        print("--------------Meow Storage Meow------------")
//        for (index, element) in Storage.studentDetailArr.enumerated() {
//                //print(" Storage meow: \(type(of: elementId).init(name: name, id: id, contact: contact, aggregate: aggregate, department: department, email: email))")
//            if(element.id == Storage.updateID) {
//                Storage.studentDetailArr[index] = (type(of: element).init(name: name, id: id, contact: contact, aggregate: aggregate,department: department, email: email))
//            }
//        }
//        //return Storage.studentDetailArr
//    }
//
    
//    func filterData(filterType: String, filterSet: Set<Storage.StudentDetails>, selectedindex: Int) -> Set<Storage.StudentDetails> {
//
//        var filter = filterSet
//
//        if(filterType == "Aggregate"){
//            switch selectedindex{
//                case 1: for ele in Storage.studentDetailArr{
//                            if ele.aggregate < 60{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 2: for ele in Storage.studentDetailArr{
//                    if ele.aggregate >= 60 && ele.aggregate <= 80{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 3: for ele in Storage.studentDetailArr{
//                            if ele.aggregate > 80{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                default: break
//            }
//        }
//
//        if(filterType == "Department"){
//            switch selectedindex{
//                case 1: for ele in Storage.studentDetailArr{
//                            if ele.department == "CS"{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 2: for ele in Storage.studentDetailArr{
//                    if ele.department == "ME"{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 3: for ele in Storage.studentDetailArr{
//                            if ele.department == "EC"{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 4: for ele in Storage.studentDetailArr{
//                            if ele.department == "ISE"{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                case 5: for ele in Storage.studentDetailArr{
//                            if ele.department == "EEE"{
//                                filter.insert(ele)
//                            }
//                        }
//                break
//
//                default: break
//            }
//        }
//
//        return filter
//    }
    
}



