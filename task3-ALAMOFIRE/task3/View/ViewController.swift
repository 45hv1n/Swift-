//
//  ViewController.swift
//  task3
//
//  Created by Ashvin Alva on 12/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func signInBtn(_ sender: UIButton) {
        let signInView = SignInnViewController(nibName: "SignInnViewController", bundle: nil)
        self.navigationController?.pushViewController(signInView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

