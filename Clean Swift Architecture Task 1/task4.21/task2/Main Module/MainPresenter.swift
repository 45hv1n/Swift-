//
//  MainPresenter.swift
//  task2
//
//  Created by Ashvin Alva on 20/07/23.
//

import Foundation

// Has a reference to the View, Interactor, Router

class Presenter: PresenterProtocolMainModule{
    var view: ViewProtocolMainModule?
    
    func messageFailed(msg: String) {
        view?.displayMessage(message: msg)
    }
    
    func messageSuccess(msg: String) {
        view?.displayMessage(message: msg)
    }
}

