//
//  HomeTableViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    
    var getDeteailesBtn  : (()->Void)?
    
    
    let dispos = DisposeBag()
    var letestOppertunite : PublishSubject<OppertunitesModel> = .init()
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var MainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigrationCell()
    }
    
    func setConfigrationCell(){
        letestOppertunite.subscribe(onNext: { [weak self](opertunity) in
            
            let placeHolderImage = #imageLiteral(resourceName: "logo")
            let MianUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunity.brief)"
            guard let url = URL(string: MianUrlImage) else {return}
            let resourseMainImage = ImageResource(downloadURL: url)
           self?.MainImage.kf.setImage(with: resourseMainImage, placeholder: placeHolderImage)
            
            let subUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunity.brief)"
            guard let SubUrlImage = URL(string: subUrlImage) else {return}
            let resourseSubImage = ImageResource(downloadURL: SubUrlImage)
            
            self?.subImage.kf.setImage(with: resourseSubImage, placeholder: placeHolderImage)
            self?.nameLbl.text = opertunity.name
            
            
            
        }).disposed(by: dispos)
    }
    @IBAction func goToDatalisBtn(_ sender: Any) {
        getDeteailesBtn?()
    }
    
    
}
