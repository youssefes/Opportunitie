//
//  SignRepository.swift
//  Opportunities
//
//  Created by youssef on 12/21/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
protocol SignRepository {
    func SignUp(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>>
    func SignIn(parameters : Parameters ) -> Observable<ResponseObjectModel<User>>
    func forgetPassRequest(parameters : Parameters) -> Observable<ResponseObjectModel<signUpDataModel>>
    func ChangePassRequest(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>>
    func checkCodeActivEmail(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>>
    func GetProfile(parameters : Parameters ) -> Observable<ResponseObjectModel<User>>
}

class SignRepositoryImp: SignRepository {
    let networkClient : NetworkClient
    init(networkClient : NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func SignUp(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.SignUp(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
              
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func SignIn(parameters : Parameters ) -> Observable<ResponseObjectModel<User>> {
        Observable<ResponseObjectModel<User>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(User.self, router: SignRouter.SignIn(parameters: parameters), completion: { (result) in
                switch result{
                case .success(let data):
                    print("user data \(data)")
                    items.onNext(data)
                    
                case .failure(let error):
                    items.onError(error)
                }
            })
            return Disposables.create()
        }
        
    }
    
    func forgetPassRequest(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.forgetPass(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func ChangePassRequest(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.ChangePass(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func checkCodeActivEmail(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.checkCodeActivEmail(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    print(data)
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func GetProfile(parameters : Parameters ) -> Observable<ResponseObjectModel<User>> {
        Observable<ResponseObjectModel<User>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(User.self, router: SignRouter.profile(parameter: parameters), completion: { (result) in
                switch result{
                case .success(let data):
                    items.onNext(data)
                    
                case .failure(let error):
                    items.onError(error)
                }
            })
            return Disposables.create()
        }
        
    }
    
    func updataProfile(parmater : Parameters, image : Data) -> Observable<signUpDataModel>{
        Observable<signUpDataModel>.create {(items) -> Disposable in
            let getUrl = NetworkConstants.baseUrl+"update_profile"
            if  let URl = URL(string: getUrl){
                let header = HTTPHeaders([HTTPHeader(name: "Accept-Language", value: "en")])
                
                AF.upload(multipartFormData: { (multipartFormData) in
                    for (key, value) in parmater {
                        multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                    }
                    multipartFormData.append(image, withName: "Profil", fileName: "Profile.jpeg", mimeType: "image/jpeg")
                }, to: URl, usingThreshold: UInt64.init(), method: .post, headers: header).uploadProgress{ progress in
                    print(progress)
                   print("Upload Progress: \(progress.fractionCompleted)")
                    
                }.response{ response in
                    switch response.result{
                    case .success(let data):
                        do {
                            guard let data = data else {return}
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            let models = try decoder.decode(signUpDataModel.self, from: data)
                            items.onNext(models)
                        } catch let error {
                            items.onError(error)
                        }
                    case .failure(let error):
                        items.onError(error)
                    }
                }
            }
            
            
            return Disposables.create()
        }
    }
    
    func ContectUs(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.ContectUs(parameter : parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    print(data)
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    
    
}

