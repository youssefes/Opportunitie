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
    func SignUp(parameters : Parameters ) -> Observable<signUpDataModel>
//    func SignIn(parameters : Parameters ) -> Observable<Decodable>
}

class SignRepositoryImp: SignRepository {
    let networkClient : NetworkClient
    init(networkClient : NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func SignUp(parameters : Parameters ) -> Observable<signUpDataModel> {
        Observable<signUpDataModel>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.SignUp(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                     print(data)
                     guard let dataresu = data.data else {return}
                     items.onNext(dataresu)
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
                    items.onNext(data)
                    
                case .failure(let error):
                    items.onError(error)
                }
            })
            return Disposables.create()
        }
        
    }
    
    func forgetPassRequest(parameters : Parameters ) -> Observable<signUpDataModel> {
        Observable<signUpDataModel>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.forgetPass(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    guard let dataresu = data.data else {return}
                    items.onNext(dataresu)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func ChangePassRequest(parameters : Parameters ) -> Observable<signUpDataModel> {
        Observable<signUpDataModel>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.ChangePass(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    guard let dataresu = data.data else {return}
                    items.onNext(dataresu)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    func checkCodeActivEmail(parameters : Parameters ) -> Observable<signUpDataModel> {
        Observable<signUpDataModel>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: SignRouter.checkCodeActivEmail(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    print(data)
                    guard let dataresu = data.data else {return}
                    items.onNext(dataresu)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    
    
}
