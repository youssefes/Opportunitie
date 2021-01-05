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
    
    func performRequest<T : Decodable>(_ object: T.Type , router: APIRouter, completion: @escaping ((Result< ResponseObjectModel<T> , Error>) -> Void)) {
        AF.request(router).responseJSON { (response) in
            
            do {
                guard let data = response.data else {return}
                print(data)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let models = try decoder.decode(ResponseObjectModel<T>.self, from: data)
                completion(.success(models))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    
}
