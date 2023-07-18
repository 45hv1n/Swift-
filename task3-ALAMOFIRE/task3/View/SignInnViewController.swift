//
//  SignInnViewController.swift
//  task3
//
//  Created by Ashvin Alva on 13/07/23.
//

import UIKit

class SignInnViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        let channelView = ChannelViewController(nibName: "ChannelViewController", bundle: nil)
        self.navigationController?.pushViewController(channelView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //emailTextField.setUpUnderlinedTextField()

        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
