//
//  ViewController.swift
//  SupportSME
//
//  Created by daffolapmac146 on 15/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import UIKit
struct dataModel: Codable {
    var email: String
    var password: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateGradient()
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
    }
    
    private func apiCall() {
        let urlString = URL(string: "http://hopedev.cloudzmall.com:8000/public/customer/login")
        var request = URLRequest(url: urlString!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let infoData = dataModel(email: "anoop.kumar@gmail.com", password: "12345")
        let jsonData = try? JSONEncoder().encode(infoData)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response)
//            guard let data = data else {
//                       print(error?.localizedDescription as Any)
//                       return
//                   }
//
//                   do{
//                       let todoItemModel = try JSONDecoder().decode(dataModel.self, from: data)
//                       print("Response data:\n \(todoItemModel)")
//                   } catch let jsonErr{
//                       print(jsonErr)
//                  }
            
        }
        task.resume()
        
//        let url = URL(string: "http://hopedev.cloudzmall.com:8000/public/customer/login")!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        //add the parameters here as needed
//        let parameters = ["email": "foo", "password": "123456"]
//
//        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//            //the service response is here
//            print(response)
//        })
//
//        task.resume()
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
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let emailMsg = emailTextField.text, let passMsg = passwordTextField.text {
            if emailMsg.isEmpty && passMsg.isEmpty {
                emailLabel.isHidden = false
                passwordLabel.isHidden = false
                return
            } else if emailMsg.isEmpty {
                emailLabel.isHidden = false
                passwordLabel.isHidden = true
                return
            } else if passMsg.isEmpty {
                passwordLabel.isHidden = false
                emailLabel.isHidden = true
                return
            }
        }
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
        apiCall()
        let detailVC = (self.storyboard?.instantiateViewController(identifier: "DetailsViewController"))! as DetailsViewController
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}
    

