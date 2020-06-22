//
//  APIManager.swift
//  SupportSME
//
//  Created by daffolapmac146 on 18/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import Foundation
import UIKit

//MARK: Protocol for data pass
protocol APIDelegateManager: AnyObject {
    func didReceive(userFirstName: String)
}

class APIManager {
    
    static let sharedInstance = APIManager()
    weak var delegate: APIDelegateManager?
    var firstName: String =  ""
    
    func loginAPICall(email: String, password: String) {
        
        let urlString = URL(string: Constant.Endpoint.URLString)
        var request = URLRequest(url: urlString!)
        request.setValue(Constant.HTTPConstants.jsonApplication, forHTTPHeaderField: Constant.HTTPConstants.headerField)
        request.httpMethod = Constant.HTTPConstants.method
        let parameterDictionary: [String: Any] = [
            "email": email,
            "password": password
        ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else { return }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(response as Any)
            do {
                if error == nil {
                    let data = try JSONDecoder().decode(DataModel.self, from: data!)
                    self.firstName = data.result.personalDetails.firstName
                    self.delegate?.didReceive(userFirstName: self.firstName)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
