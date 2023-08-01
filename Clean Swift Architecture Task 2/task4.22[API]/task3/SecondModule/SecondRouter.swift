//
//  SecondRouter.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation
import UIKit

class SecondModuleRouter: RouterProtocolSecondModule{
    
    var view: ViewProtocolSecondModule?
    
    func switchView(navigationController: UINavigationController) {
        let channelVC = ChannelViewController(nibName: "ChannelViewController", bundle: nil) as ChannelViewController
        navigationController.pushViewController(channelVC, animated: true)
    }
    
    func popView(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
    
    
}
