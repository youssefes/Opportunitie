//
//  ClientNetwork.swift
//  Opportunities
//
//  Created by youssef on 12/21/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClient {
    
    func performRequestForSign<T : Decodable>(_ object: T.Type , router: APIRouter, completion: @escaping ((Result< ResponseObjectOfSign<T> , Error>) -> Void)) {
        AF.request(router).responseJSON { (response) in
            
            do {
                guard let data = response.data else {return}
                print(data)
                 let decoder = JSONDecoder()
                 decoder.keyDecodingStrategy = .useDefaultKeys
                let models = try decoder.decode(ResponseObjectOfSign<T>.self, from: data)
                completion(.success(models))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    func performRequestForSignIn<T : Decodable , E : Decodable>(_ objectSeccuss: T.Type,ObjectError : E.Type , router: APIRouter, completion: @escaping ((T? , E? , Error?) -> Void)) {
        AF.request(router).validate(statusCode: 200..<300).responseJSON { (response) in
            switch response.result {
                
            case .success(_):
                do {
                    guard let data = response.data else {return}
                    print(T.Type.self)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let models = try decoder.decode(T.self, from: data)
                    print("is seccusse \(models)")
                    completion(models,nil,nil)
                    
                } catch let error {
                    print(error)
                    completion(nil,nil,error)
                    
                }
            case .failure(let error):
                
                guard let status = response.response?.statusCode else {return}
                if status > 300{
                    do {
                        guard let data = response.data else {return}
                        print(data)
                         let decoder = JSONDecoder()
                         decoder.keyDecodingStrategy = .useDefaultKeys
                        let models = try decoder.decode(E.self, from: data)
                         print("is failer \(models)")
                        completion(nil,models,nil)
                        
                    } catch let error {
                       completion(nil,nil,error)
                    }
                }else{
                    completion(nil,nil,error)
                }
                
            }
         }
     }
    
}
