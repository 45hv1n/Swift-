//
//  DetailProtocol.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

//View Protocol
protocol DetailPresenterToView{
    var aggFilter: Set<Storage.StudentDetails> {get set}
    var depFilter: Set<Storage.StudentDetails> {get set}
    
    var detailViewToPresenter: DetailViewToPresenter? {get set}
}

//Presenter Protocol
protocol DetailViewToPresenter{
    
    var view: DetailPresenterToView? {get set}
    var interactor: DetailPresenterToInteractor? {get set}
    var router: DetailPresenterToRouter? {get set}
        
    func switchTabs(tabbarController: UITabBarController)
    func removeElement(id: Int)
    
    func filterAgg(selectedIndex: Int)
    func filterDep(selectedIndex: Int)
}

//Presenter Protocol - Interactor
protocol DetailInteractorToPresenter{
    
}

//Interactor protocol
protocol DetailPresenterToInteractor{
    var presenter: DetailInteractorToPresenter? {get set}
    
    func removeStudentDetail(id : Int)
    func filterAggregate(selectedIndex: Int, completion: @escaping(Set<Storage.StudentDetails>) -> ())
    func filterDepartment(selectedIndex: Int, completion: @escaping(Set<Storage.StudentDetails>) -> ())
}

//Router Protocol
protocol DetailPresenterToRouter{
    static func createDetailModule()-> DetailViewController
    
    func switchViewController(tabbarController: UITabBarController)
}
