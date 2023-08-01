//
//  DetailRouter.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import Foundation
import UIKit

class DetailRouter: RouterProtocolDetailModule{
    var view: ViewProtocolDetailModule?
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func switchTabs(tabbarController: UITabBarController) {
//        tabBarController?.selectedIndex = 1
        tabbarController.selectedIndex = 0
    }
    
}
