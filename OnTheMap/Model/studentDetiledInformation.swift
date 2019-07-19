//
//  studentDetiledInformation.swift
//  OnTheMap
//
//  Created by norah alshareef on 07/10/1440 AH.
//  Copyright © 1440 norah alshareef. All rights reserved.
//

import Foundation

struct studentLocation: Codable {
    
    var objectId: String?
    var uniqueKey: String?
    var firstName: String?
    var lastName: String?
    var mapString: String?
    var mediaURL: String?
    var latitude: Double?
    var longitude: Double?
    var createdAt : String?
    
    init(objectId: String? = nil
    , uniqueKey: String? = nil
    , firstName: String? = nil
    , lastName: String? = nil
    , mapString: String? = nil
     ,mediaURL: String? = nil
    , latitude: Double? = nil,
     longitude: Double? = nil
    , createdAt : String? = nil) {
        
        self.objectId = objectId
        self.uniqueKey = uniqueKey
        self.firstName = firstName
        self.lastName = lastName
        self.mapString = mapString
        self.mediaURL = mediaURL
         self.latitude = latitude
        self.longitude = longitude
        self.createdAt = createdAt
    }
    
}
