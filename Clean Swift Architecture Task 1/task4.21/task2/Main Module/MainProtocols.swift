//
//  MainProtocols.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation
import UIKit

//View Protocol
protocol ViewProtocolMainModule{
    var interactor: InteractorProtocolMainModule? {get set}
    var router: RouterProtocolMainModule? {get set}
    
    func displayMessage(message: String)
}

//Interactor Protocol
protocol InteractorProtocolMainModule{
    var presenter: PresenterProtocolMainModule? {get set}
    
    func addStudentData(obj: [String])
    func updateStudentData(name: String, id : Int, contact: Int,aggregate: Int, department: String, email: String)
}

//Presenter Protocol
protocol PresenterProtocolMainModule{
    var view: ViewProtocolMainModule? {get set}
    
    func messageSuccess(msg: String)
    func messageFailed(msg: String)
}

//Router Protocol
protocol RouterProtocolMainModule{
    var view: ViewProtocolMainModule? {get set}

    func showVC(tabbarcontroller: UITabBarController,identifier: String)
}



