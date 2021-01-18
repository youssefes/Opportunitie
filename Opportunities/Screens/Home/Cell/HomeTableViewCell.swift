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
    
    @IBOutlet weak var prsentageLbl: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var soldLbl: UILabel!
    let dispos = DisposeBag()
    var letestOppertunite : PublishSubject<OppertunitesModel> = .init()
    var allOppertunite : PublishSubject<OppertunitesModel> = .init()
    var searchOppertunite : PublishSubject<OppertunitesModel> = .init()
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var MainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigrationCellToletestOppertunite()
    }
    
    func setConfigrationCellToletestOppertunite(){
        letestOppertunite.asObservable().subscribe(onNext: { [weak self](opertunity) in
            self?.setDataToUI(opertunity: opertunity)
        }).disposed(by: dispos)
        
        allOppertunite.asObservable().subscribe(onNext: { [weak self](opertunity) in
              self?.setDataToUI(opertunity: opertunity)
          }).disposed(by: dispos)
        
        searchOppertunite.asObservable().subscribe(onNext: { [weak self](opertunity) in
            self?.setDataToUI(opertunity: opertunity)
        }).disposed(by: dispos)
       
    }
    
    
    
    private func setDataToUI(opertunity : OppertunitesModel){
        let placeHolderImage = #imageLiteral(resourceName: "logo")
        let MianUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunity.brief)"
        guard let url = URL(string: MianUrlImage) else {return}
        let resourseMainImage = ImageResource(downloadURL: url)
        self.MainImage.kf.setImage(with: resourseMainImage, placeholder: placeHolderImage)
        
        let subUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunity.brief)"
        guard let SubUrlImage = URL(string: subUrlImage) else {return}
        let resourseSubImage = ImageResource(downloadURL: SubUrlImage)
        
        self.subImage.kf.setImage(with: resourseSubImage, placeholder: placeHolderImage)
        self.nameLbl.text = opertunity.name
        self.soldLbl.text = "\(opertunity.amount) KD sold"
        let progressPrasentage = (Int(opertunity.total) ?? 0) / opertunity.amount
        progress.progress = Float(Float(progressPrasentage)/100.0)
        
        self.prsentageLbl.text = "\(progressPrasentage) %"
        
    }
    @IBAction func goToDatalisBtn(_ sender: Any) {
        getDeteailesBtn?()
    }
    
    
}
