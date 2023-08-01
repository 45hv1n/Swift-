//
//  MainRouter.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation
import UIKit

// Takes care of routing or navigation from one screen to another

class Router: RouterProtocolMainModule{
    var view: ViewProtocolMainModule?

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func showVC(tabbarcontroller: UITabBarController,identifier: String) {
        tabbarcontroller.selectedIndex = 1
    }
}
