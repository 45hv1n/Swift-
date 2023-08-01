//
//  DetailPresentor.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

class DetailPresenter: PresenterProtocolDetailModule{
    
    var view: ViewProtocolDetailModule?
    
    func assignFilterAggregate(aggFilter: Set<Storage.StudentDetails>) {
        view?.aggFilter.removeAll()
        view?.aggFilter = aggFilter
    }
    
    func assignFilterDepartment(depFilter: Set<Storage.StudentDetails>) {
        view?.depFilter.removeAll()
        view?.depFilter = depFilter
    }
    
}
