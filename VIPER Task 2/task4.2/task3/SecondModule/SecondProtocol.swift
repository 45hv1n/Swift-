//
//  SecondProtocol.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation
import UIKit

protocol ViewToPresenterSecondModule{
    
    var view: PresenterToViewSecondModule? {get set}
    var interactor: PresenterToInteractorSecondModule? {get set}
    var router: PresenterToRouterSecondModule? {get set}
    
    func switchViewController(navigationController: UINavigationController)
    
}

protocol PresenterToViewSecondModule{
    var presenter: ViewToPresenterSecondModule? {get set}
}

protocol PresenterToRouterSecondModule{
    static func createSecondModule() -> SignInnViewController
    
    func switchView(navigationController: UINavigationController)
}

protocol PresenterToInteractorSecondModule{
    var presenter: InteractorToPresenterSecondModule? {get set}
    
}

protocol InteractorToPresenterSecondModule{
    
}
