//
//  SecondRouter.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation
import UIKit

class SecondModuleRouter: PresenterToRouterSecondModule{
    
    static func createSecondModule() -> SignInnViewController {
        let view = SignInnViewController(nibName: "SignInnViewController", bundle: nil) as! SignInnViewController
        
        var presenter : ViewToPresenterSecondModule & InteractorToPresenterSecondModule = SecondModulePresenter()
        var interactor : PresenterToInteractorSecondModule = SecondModuleInteractor()
        var router : PresenterToRouterSecondModule = SecondModuleRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
    
    func switchView(navigationController: UINavigationController) {
        let channelVC = ThirdModuleRouter.createThirdModule()
        navigationController.pushViewController(channelVC, animated: true)
    }
    
    
}
