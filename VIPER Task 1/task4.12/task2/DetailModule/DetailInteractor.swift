//
//  DetailInteractor.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation


class DetailInteractor: DetailPresenterToInteractor{
    
    var presenter: DetailInteractorToPresenter?
    let stored = Storage()
    
    func removeStudentDetail(id: Int) {
        for (index,element) in Storage.studentDetailArr.enumerated(){
            if element.id == id{
                Storage.studentDetailArr.remove(at: index)
            }
        }        
    }
    
    func filterAggregate(selectedIndex: Int, completion: @escaping (Set<Storage.StudentDetails>) -> ()){
        var filter: Set<Storage.StudentDetails> = Set()
        
        switch selectedIndex{
            case 1: for ele in Storage.studentDetailArr{
                        if ele.aggregate < 60{
                            filter.insert(ele)
                        }
                    }
            break
            
            case 2: for ele in Storage.studentDetailArr{
                        if ele.aggregate >= 60 && ele.aggregate <= 80{
                            filter.insert(ele)
                        }
                    }
            break
            
            case 3: for ele in Storage.studentDetailArr{
                        if ele.aggregate > 80{
                            filter.insert(ele)
                        }
                    }
            break
                
            default: break
        }
        completion(filter)
    }
    
    func filterDepartment(selectedIndex: Int, completion: @escaping (Set<Storage.StudentDetails>) -> ()){
        var filter: Set<Storage.StudentDetails> = Set()

        switch selectedIndex{
            case 1: for ele in Storage.studentDetailArr{
                        if ele.department == "CS"{
                            filter.insert(ele)
                        }
                    }
            break
            
            case 2: for ele in Storage.studentDetailArr{
                        if ele.department == "ME"{
                            filter.insert(ele)
                        }
                    }
            break
            
            case 3: for ele in Storage.studentDetailArr{
                        if ele.department == "EC"{
                            filter.insert(ele)
                        }
                    }
            break
            
            case 4: for ele in Storage.studentDetailArr{
                        if ele.department == "ISE"{
                            filter.insert(ele)
                        }
                    }
            break
                
            case 5: for ele in Storage.studentDetailArr{
                        if ele.department == "EEE"{
                            filter.insert(ele)
                        }
                    }
            break
                
            default: break
        }
        completion(filter)
    }
    
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
