//
//  ThirdModuleProtocol.swift
//  task3
//
//  Created by Ashvin Alva on 26/07/23.
//

import Foundation

protocol ViewToPresenterThirdModule{
    
    var view: PresenterToViewThirdModule? {get set}
    var interactor: PresenterToInteractorThirdModule? {get set}
    var router: PresneterToRouteThirdModule? {get set}
    
    func getAPIData(completion: @escaping () -> ())
}

protocol PresenterToViewThirdModule{
    var presenter: ViewToPresenterThirdModule? {get set}
}

protocol PresenterToInteractorThirdModule{
    var presenter: InteractorToPresenterThirdModule? {get set}
    
    func getData(completion: @escaping () -> ())
}

protocol PresneterToRouteThirdModule{
    static func createThirdModule() ->ChannelViewController
}

protocol InteractorToPresenterThirdModule{
    
}


