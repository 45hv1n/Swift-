//
//  DetailRouter.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

class DetailRouter: DetailPresenterToRouter{
    
    static func createDetailModule() -> DetailViewController {
            
            let detailView = mainstoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            var detailPresenter: DetailViewToPresenter & DetailInteractorToPresenter = DetailPresenter()
            var detailInteractor: DetailPresenterToInteractor = DetailInteractor()
            let detailRouter: DetailPresenterToRouter = DetailRouter()
            
            detailView.detailViewToPresenter = detailPresenter
                
            detailPresenter.view = detailView
            detailPresenter.interactor = detailInteractor
            detailPresenter.router = detailRouter
            
            detailInteractor.presenter = detailPresenter
        
            return detailView
            
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func switchViewController(tabbarController: UITabBarController) {
//        tabBarController?.selectedIndex = 1
        tabbarController.selectedIndex = 0
    }
    
}
