//
//  UserInfo.swift
//  OnTheMap
//
//  Created by norah alshareef on 26/09/1440 AH.
//  Copyright © 1440 norah alshareef. All rights reserved.
//

import Foundation

struct UserInfo: Decodable {

        
        let objectId: String
        let uniqueKey: String
        let firstName: String
        let lastName: String
        let mapString: String
        let mediaURL: String
        let latitude: Float
        let longitude: Float
        let createdAt : Date
        
        enum CodingKeys: String, CodingKey {
            case objectId = "objectId"
            case uniqueKey = "uniqueKey"
            case firstName = "firstName"
            case lastName = "lastName"
            case mapString = "mapString"
            case mediaURL = "mediaURL"
            case latitude = "latitude"
            case longitude = "longitude"
            case createdAt = "createdAt"
            
            
            
        }
}
