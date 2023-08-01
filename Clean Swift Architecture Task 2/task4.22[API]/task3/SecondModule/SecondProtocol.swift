//
//  SecondProtocol.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation
import UIKit

protocol ViewProtocolSecondModule{
    var route: RouterProtocolSecondModule? {get set}
    var interactor: InteractorProtocolSecondModule? {get set}
}

protocol PresenterProtocolSecondModule{
    var view: ViewProtocolSecondModule? {get set}
}

protocol RouterProtocolSecondModule{
    var view: ViewProtocolSecondModule? {get set}
    
    func switchView(navigationController: UINavigationController)
    func popView(navigationController: UINavigationController)
}

protocol InteractorProtocolSecondModule{
    var presenter: PresenterProtocolSecondModule? {get set}
}
