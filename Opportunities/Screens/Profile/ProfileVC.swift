//
//  ProfileVC.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileVC : BaseWireFrame<SignInViewModel> {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var investLbl: UILabel!
    
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var profilImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInformation()
    }

    override func bind(ViewModel: SignInViewModel) {
        ViewModel.SeccessSignIn.subscribe(onNext: { [weak self] (userInfo) in
            guard let self = self else {return}
            guard let istrue = userInfo.value else {return}
            if istrue {
                guard let data = userInfo.data else {return}
                self.emailLbl.text = data.email
                self.nameLbl.text = data.name
                guard let amount = data.amount, let profile = data.profit else {
                    return
                }
                self.investLbl.text = "\(amount) KD"
                self.profileLbl.text = "\(profile) KD"
                let placeHolderImage = #imageLiteral(resourceName: "Ellipse 22")
                guard let image = data.image else {return}
                let imageUrl = "\(NetworkConstants.baseUrlImages)\(image)"
                print(imageUrl)
                guard let url = URL(string: imageUrl) else {return}
                let resourseMainImage = ImageResource(downloadURL: url)
                self.profilImage.kf.setImage(with: resourseMainImage, placeholder: placeHolderImage )
            }else{
                
            }
        }).disposed(by: disposePag)
        
    }
    @IBAction func backBtn(_ sender: Any) {
     
    }
    
    
    @IBAction func settingBtn(_ sender: Any) {
        let Active = coordinator.MainStoryBordNavigator.viewController(for: .settingProfile)
        navigationController?.pushViewController(Active, animated: true)
    }
    
    
  
    @IBAction func TransactionsBtn(_ sender: Any) {
       let Active = coordinator.MainStoryBordNavigator.viewController(for: .transaction)
        navigationController?.pushViewController(Active, animated: true)
        
    }
    
    
    func getInformation(){
        
        if let userId = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int {
           
            let paramerter : [String : Any] = [
                "user_id" : userId
            ]
            vieeModel.getProfile(parameters: paramerter)
        }
    }
}
