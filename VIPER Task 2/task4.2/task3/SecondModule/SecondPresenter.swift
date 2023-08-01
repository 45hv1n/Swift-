//
//  SecondPresenter.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation
import UIKit

class SecondModulePresenter: ViewToPresenterSecondModule{
    
    var view: PresenterToViewSecondModule?
    var interactor: PresenterToInteractorSecondModule?
    var router: PresenterToRouterSecondModule?
    
    func switchViewController(navigationController: UINavigationController) {
        router?.switchView(navigationController: navigationController)
    }
    
}

extension SecondModulePresenter: InteractorToPresenterSecondModule{
    
}
