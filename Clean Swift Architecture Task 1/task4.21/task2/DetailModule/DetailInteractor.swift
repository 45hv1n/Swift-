//
//  DetailInteractor.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation


class DetailInteractor: InteractorProtocolDetailModule{
    
    var presenter: PresenterProtocolDetailModule?
        
    let stored = Storage()
    
    func removeStudentDetail(id : Int) -> [Storage.StudentDetails]{
        for (index,element) in Storage.studentDetailArr.enumerated(){
            if element.id == id{
                Storage.studentDetailArr.remove(at: index)
            }
        }
        return Storage.studentDetailArr
    }
    
    func filterAggregate(selectedindex: Int){
        
        var filter: Set<Storage.StudentDetails> = Set()
        
        switch selectedindex{
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
        
        presenter?.assignFilterAggregate(aggFilter: filter)
    }
    
    func filterDepartment(selectedindex: Int){
        
        var filter: Set<Storage.StudentDetails> = Set()
        
        switch selectedindex{
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
        
        presenter?.assignFilterDepartment(depFilter: filter)
    }
    
}
