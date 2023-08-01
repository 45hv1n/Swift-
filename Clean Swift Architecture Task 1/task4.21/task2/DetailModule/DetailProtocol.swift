//
//  DetailProtocol.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

//View Protocol
protocol ViewProtocolDetailModule{
    var aggFilter: Set<Storage.StudentDetails> {get set}
    var depFilter: Set<Storage.StudentDetails> {get set}
    
    var router : RouterProtocolDetailModule? {get set}
    var interactor: InteractorProtocolDetailModule? {get set}
    
}

//Interactor Protocol
protocol InteractorProtocolDetailModule{
    var presenter: PresenterProtocolDetailModule? {get set}
    
    func filterAggregate(selectedindex: Int)
    func filterDepartment(selectedindex: Int)
    func removeStudentDetail(id: Int) -> [Storage.StudentDetails]

}

//Presenter Protocol - Interactor
protocol PresenterProtocolDetailModule{
    var view : ViewProtocolDetailModule? {get set}
    
    func assignFilterAggregate(aggFilter: Set<Storage.StudentDetails>)
    func assignFilterDepartment(depFilter: Set<Storage.StudentDetails>)

}

//Router protocol
protocol RouterProtocolDetailModule{
    var view : ViewProtocolDetailModule? {get set}
    
    func switchTabs(tabbarController : UITabBarController)
}

