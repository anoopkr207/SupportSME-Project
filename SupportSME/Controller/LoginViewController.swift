//
//  ViewController.swift
//  SupportSME
//
//  Created by daffolapmac146 on 15/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emptyEmailMsgLabel: UILabel!
    @IBOutlet weak var emptyPasswordMsgLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateGradient()
        emptyEmailMsgLabel.isHidden = true
        emptyPasswordMsgLabel.isHidden = true
    }
    
    //MARK: Gradient for Submit Button
    private func CreateGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = loginButton.bounds
        gradientLayer.cornerRadius = loginButton.frame.height/2
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [UIColor(red: 5/255, green: 117/255, blue: 230/255, alpha: 1).cgColor, UIColor(red: 2/255, green: 27/255, blue: 175/255, alpha: 1).cgColor]
        loginButton.layer.addSublayer(gradientLayer)
        self.view.addSubview(loginButton)
    }
    
    //MARK: Login Button
    @IBAction func loginButton(_ sender: UIButton) {
        alertDisplay()
        emptyEmailMsgLabel.isHidden = true
        emptyPasswordMsgLabel.isHidden = true
        APIManager.sharedInstance.loginAPICall(email: emailTextField.text!, password: passwordTextField.text!)
        APIManager.sharedInstance.delegate = self
        let detailVC = (self.storyboard?.instantiateViewController(identifier: Constant.storyboardConstant.storyboardIdentifier))! as DetailsViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //MARK: Display alert for empty credentials
    private func alertDisplay() {
        if let emailMsg = emailTextField.text, let passMsg = passwordTextField.text {
            if emailMsg.isEmpty && passMsg.isEmpty {
                emptyEmailMsgLabel.isHidden = false
                emptyPasswordMsgLabel.isHidden = false
                return
            } else if emailMsg.isEmpty {
                emptyEmailMsgLabel.isHidden = false
                emptyPasswordMsgLabel.isHidden = true
                return
            } else if passMsg.isEmpty {
                emptyPasswordMsgLabel.isHidden = false
                emptyEmailMsgLabel.isHidden = true
                return
            }
        }
    }
}
//MARK: Extension for data pass
extension LoginViewController: APIDelegateManager {
    func didReceive(userFirstName: String) {
        print("Welcome with \(userFirstName) from response.")
    }
}
