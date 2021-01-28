//
//  ActiveCollectionViewCell.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class ActiveCollectionViewCell: UICollectionViewCell {
    
    
    var ActiveOppertunite : PublishSubject<OppertunitesModel> = .init()
    let dispobag = DisposeBag()
    @IBOutlet weak var selectedCellImage: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell(){
        ActiveOppertunite.subscribe(onNext: { [weak self] (opertunity) in
            self?.setData(opertunity: opertunity)
        }).disposed(by: dispobag)
    }
    
    
    func setData(opertunity : OppertunitesModel){
        let placeHolderImage = #imageLiteral(resourceName: "logo")
        let subUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunity.icon)"
        guard let SubUrlImage = URL(string: subUrlImage) else {return}
        let resourseSubImage = ImageResource(downloadURL: SubUrlImage)
        imageCell.kf.setImage(with: resourseSubImage, placeholder: placeHolderImage)
        
       titel.text = opertunity.name
        priceLbl.text = "\(opertunity.amount) KD sold"
        let progressPrasentage = (Int(opertunity.total ?? "" ) ?? 0) / (opertunity.amount ?? 0)
        progressView.progress = Float(Float(progressPrasentage)/100.0)
    }
    
}
