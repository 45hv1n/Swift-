//
//  SignInnViewController.swift
//  task3
//
//  Created by Ashvin Alva on 13/07/23.
//

import UIKit

class SignInnViewController: UIViewController, ViewProtocolSecondModule {
    
    var route: RouterProtocolSecondModule?
    var interactor: InteractorProtocolSecondModule?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        print("Initialized")
        setup()
        
    }

    func setup(){
        let view = self
        let interactor = SecondModuleInteractor()
        let presenter = SecondModulePresenter()
        let router = SecondModuleRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        view.route = router
    }
    
    @IBAction func backBtn(_ sender: Any) {
        route?.popView(navigationController: navigationController!)
    }
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        route?.switchView(navigationController: navigationController!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }

}
