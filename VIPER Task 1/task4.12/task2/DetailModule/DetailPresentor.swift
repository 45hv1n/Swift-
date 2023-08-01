//
//  DetailPresentor.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

class DetailPresenter: DetailViewToPresenter{
    
    var view: DetailPresenterToView?
    var interactor: DetailPresenterToInteractor?
    var router: DetailPresenterToRouter?
    
    func removeElement(id: Int) {
        interactor?.removeStudentDetail(id: id)
    }
    
    func switchTabs(tabbarController: UITabBarController) {
        router?.switchViewController(tabbarController: tabbarController)
    }
    
    func filterAgg(selectedIndex: Int) {
        
        
        interactor?.filterAggregate(selectedIndex: selectedIndex, completion: { aggFilter in
            print("Aggregate Filter Meow Presneter: \(aggFilter)")

            self.view?.aggFilter = aggFilter
        })
    }
    
    func filterDep(selectedIndex: Int) {
        interactor?.filterDepartment(selectedIndex: selectedIndex, completion: { depFilter in
            self.view?.depFilter = depFilter
        })
    }
    
}

extension DetailPresenter: DetailInteractorToPresenter{
    
}
