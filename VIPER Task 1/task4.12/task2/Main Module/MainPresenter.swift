//
//  MainPresenter.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation

// Has a reference to the View, Interactor, Router

class Presenter: ViewToPresenterProtocol{
    
    // All the references
    
    var view: PresenterToViewProtocol?              // View References
    var interactor: PresenterToInteractorProtocol? // Interactor Reference
    var route: PresenterToRouterProtocol?           // Router Reference
    
    func saveTheUserData(objArrayData: [String]) {
        print("Save function:  presentor")
        interactor?.dbConnect(obj: objArrayData)
    }
    
    func updateUserData(objArrayData: [String]) {
        print("Update Function: presenter")
        interactor?.update(obj: objArrayData)
    }
}

extension Presenter: InteractorToPresenterProtocol{
    
}

