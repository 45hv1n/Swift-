//
//  MainProtocols.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation
import UIKit

//View Protocol
protocol PresenterToViewProtocol{
    var viewToPresentor: ViewToPresenterProtocol? {get set}
}

//Presentor protocol
protocol ViewToPresenterProtocol{
    
    //Properties
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var route: PresenterToRouterProtocol? {get set}
    
    //Methods
    func saveTheUserData(objArrayData: [String])
    func updateUserData(objArrayData: [String])
}

protocol InteractorToPresenterProtocol{
    
}

//Interactor Protocol
protocol PresenterToInteractorProtocol{
    
    //Properties
    var presentor: InteractorToPresenterProtocol? {get set}
    
    //Methods
    func dbConnect(obj: [String])
    func update(obj: [String])
}

//Router Protocol
protocol PresenterToRouterProtocol{
    static func createModule()-> ViewController
}



