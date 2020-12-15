//
//  BaseWireFrame.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import UIKit
//import RxCocoa
//import RxSwift

class BaseWireFrame <T>: UIViewController {
    
    var vieeModel : T
    var coordinator : Coordinator
//  lazy var disposePag : DisposeBag = {
//        return DisposeBag()
//    }()
    init(ViewModel : T, coordinator : Coordinator) {
        self.vieeModel = ViewModel
        self.coordinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(ViewModel: vieeModel)
    }
    
//    static func createFromStoryboard(storyboard: AppStoryboard, viewModel: T, coordinator: Coordinator) -> Self<T>{
//           let view = Self.instantiate(fromAppStoryboard: storyboard) as Self<T>
//           view.coordinator = coordinator
//           view.viewModel = viewModel
//           return view
//       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(ViewModel : T) {
        fatalError("please Override the bind Function")
    }
}
