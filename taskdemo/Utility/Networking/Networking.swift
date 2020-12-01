//
//  Networking.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()
        
    init(){}
    
    func Getmydata(for completion: @escaping (APIResponse?, Error?) -> Void) {
        
        let newurlString = "http://bellman-bd.restart-technology.com/api/home"
        
        AF.request(newurlString).response { (response) in
            guard let data = response.data else {return}
            do {
                let newData =  try JSONDecoder().decode(APIResponse.self, from: data)
                completion(newData, nil)
            }
            catch {
                completion(nil,error)
            }
        }
    }
}



