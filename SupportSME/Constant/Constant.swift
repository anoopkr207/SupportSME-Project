//
//  Constant.swift
//  SupportSME
//
//  Created by daffolapmac146 on 18/06/20.
//  Copyright © 2020 daffolapmac146. All rights reserved.
//

import Foundation

enum Constant {
    
    enum Endpoint {
        static let URLString = "http://hopedev.cloudzmall.com:8000/public/customer/login"
    }
    
    enum HTTPConstants {
        static let method = "POST"
        static let jsonApplication = "application/json"
        static let headerField = "Content-Type"
    }
    
    enum storyboardConstant {
        static let storyboardIdentifier = "DetailsViewController"
    }
}
