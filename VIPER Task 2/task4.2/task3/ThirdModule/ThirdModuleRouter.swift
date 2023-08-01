//
//  ThirdModuleRouter.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation

class ThirdModuleRouter: PresneterToRouteThirdModule{
    static func createThirdModule() -> ChannelViewController {
        let view = ChannelViewController(nibName: "ChannelViewController", bundle: nil) as ChannelViewController
    
        var presenter: ViewToPresenterThirdModule & InteractorToPresenterThirdModule = ThirdModulePresenter()
        var interactor: PresenterToInteractorThirdModule = ThirdModuleInteractor()
        var router: PresneterToRouteThirdModule = ThirdModuleRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
    
    
}
