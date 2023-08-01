//
//  MainRouter.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation
import UIKit

// Takes care of routing or navigation from one screen to another

class Router: PresenterToRouterProtocol{
    
    static func createModule() -> ViewController {
            
             let view = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = Presenter()
            var interactor: PresenterToInteractorProtocol = Interactor()
            let router: PresenterToRouterProtocol = Router()
            
            view.viewToPresentor = presenter
        
            presenter.view = view
            presenter.route = router
            presenter.interactor = interactor
        
            interactor.presentor = presenter
            
            return view
            
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
