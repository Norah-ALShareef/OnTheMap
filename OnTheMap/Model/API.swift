//
//  API.swift
//  OnTheMap
//
//  Created by norah alshareef on 26/09/1440 AH.
//  Copyright © 1440 norah alshareef. All rights reserved.
//

import Foundation
import MapKit




class API {
    

    class func loginSession(with email: String, password: String, completion: @escaping ([String:Any]?, Error?) -> ()){

        var request = URLRequest(url: URL(string: "https://onthemap-api.udacity.com/v1/session")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"\(email)\", \"password\": \"\(password)\"}}".data(using: .utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
               completion(nil, error)
                return
            }
            
            let range = 5..<data!.count
            let newData = data?.subdata(in: range )
            let loginResults = try! JSONSerialization.jsonObject(with: newData! , options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
            
            completion(loginResults, nil)

            
            
        }
        task.resume()
        
        
        
        
    }
    
    
    class func requstStudentLocation( completionHandler:  @escaping  ([studentLocation],Error?) -> Void ){
        let StudentLocationUrlBase = URL(string:"https://onthemap-api.udacity.com/v1/StudentLocation")
        
        var RequstStudentLocation = URLRequest(url: StudentLocationUrlBase!)
        
        RequstStudentLocation.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        RequstStudentLocation.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
    
        let task = URLSession.shared.dataTask(with: RequstStudentLocation) { (data, response, error) in
            guard let data = data else {
                
                completionHandler( [] , error)
                
                return
            }
            
            let decoder = JSONDecoder()
            let dictonary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            guard let results = dictonary["results"] as? [[String:Any]] else {return}
            let resultdata = try! JSONSerialization.data(withJSONObject: results, options: .prettyPrinted)
            let studentLocationsdecoded = try! decoder.decode([studentLocation].self, from: resultdata)

            StusentLocationGlobal.sharedInfo.studentLocationGlobalArray = studentLocationsdecoded


            completionHandler(studentLocationsdecoded , nil)
            
        }
        
        task.resume()
    }
    
    
    class func postStudentLocation(link: String, Cordinate: MKPointAnnotation, locationName: String, completion: @escaping (Error?)-> ()){
    
        let StudentLocationUrlBase = URL(string:"https://onthemap-api.udacity.com/v1/StudentLocation")
        //Endpoints.getStudentLocations.uel
        
        var RequstPostingStudentLocation = URLRequest(url: StudentLocationUrlBase!)
        RequstPostingStudentLocation.httpMethod = "POST"
        
        RequstPostingStudentLocation.addValue("application/json", forHTTPHeaderField: "Content-Type")
        RequstPostingStudentLocation.httpBody = "{\"uniqueKey\": \"1234\", \"firstName\": \"John\", \"lastName\": \"Doe\",\"mapString\":\"\(locationName)\", \"mediaURL\":\"\(link)\",\"latitude\":\"\(Cordinate.coordinate.latitude)\", \"longitude\":\"\(Cordinate.coordinate.longitude)}".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: RequstPostingStudentLocation) { data, response, error in
            if error != nil {
                completion(error)
                return
            }
            print(String(data: data!, encoding: .utf8)!)
        }
        task.resume()
    

}
 
    class func deletSession (complition: @escaping (Error?)-> ()) {
        var request = URLRequest(url: URL(string: "https://onthemap-api.udacity.com/v1/session")!)
        request.httpMethod = "DELETE"
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { 
                return
            }
            let range = 5..<data!.count
            let newData = data?.subdata(in: range)
            print(String(data: newData!, encoding: .utf8)!)
            
            print("user LogedOut")
        }
        task.resume()
    }
    
    
    
}
