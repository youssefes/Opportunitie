//
//  OppertunitesRepository.swift
//  Opportunities
//
//  Created by youssef on 1/4/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol OppertunitesRepository {
    func letestOppertunites() -> Observable<[OppertunitesModel]>
    func allOppertunites() -> Observable<[OppertunitesModel]>
    func OppertuniteDetailes(oppertuniteId: Int) -> Observable<ResponseObjectModel<OppertunitesModel>>
}

class OppertunitesRepositoryImp: OppertunitesRepository {
    
    let networkClient : NetworkClient
    init(networkClient : NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func letestOppertunites() -> Observable<[OppertunitesModel]> {
        Observable<[OppertunitesModel]>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest([OppertunitesModel].self, router: OppertunitesRouter.LetestOppertunite) { (resulet) in
                switch resulet{
                    
                case .success(let data):
                    guard  let oppertunitesData = data.data else {
                        return
                    }
                    oppertunites.onNext(oppertunitesData)
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func allOppertunites() -> Observable<[OppertunitesModel]> {
        Observable<[OppertunitesModel]>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest([OppertunitesModel].self, router: OppertunitesRouter.allOppertunites) { (resulet) in
                switch resulet{
                case .success(let data):
                    guard  let oppertunitesData = data.data else {
                        return
                    }
                    print(oppertunitesData)
                    oppertunites.onNext(oppertunitesData)
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func OppertuniteDetailes(oppertuniteId: Int) -> Observable<ResponseObjectModel<OppertunitesModel>> {
        Observable<ResponseObjectModel<OppertunitesModel>>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest(OppertunitesModel.self, router: OppertunitesRouter.OppertuniteDetailes(dealId: oppertuniteId)) { (resulet) in
                switch resulet{
                case .success(let data):
                    oppertunites.onNext(data)
                    
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func OppertuniteSearch(oppertuniteName: String) -> Observable<ResponseObjectModel<[OppertunitesModel]>> {
        Observable<ResponseObjectModel<[OppertunitesModel]>>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest([OppertunitesModel].self, router: OppertunitesRouter.search(opertunitesName: oppertuniteName)) { (resulet) in
                switch resulet{
                case .success(let data):
                    oppertunites.onNext(data)
                    
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
        
    }
    
    func activeOppertunites(userId: Int) -> Observable<ResponseObjectModel<[OppertunitesModel]>> {
        Observable<ResponseObjectModel<[OppertunitesModel]>>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest([OppertunitesModel].self, router: OppertunitesRouter.active(userId: userId)) { (resulet) in
                switch resulet{
                case .success(let data):
                    oppertunites.onNext(data)
                    
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func About() -> Observable<ResponseObjectModel<AboutModel>> {
        Observable<ResponseObjectModel<AboutModel>>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest(AboutModel.self, router: OppertunitesRouter.about) { (resulet) in
                switch resulet{
                case .success(let data):
                    oppertunites.onNext(data)
                    
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
