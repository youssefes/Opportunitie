//
//  SettingViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SettingViewController: BaseWireFrame<settingViewModel> {
    @IBOutlet weak var activatyIndictor: NVActivityIndicatorView!
    
    @IBOutlet weak var passwordTf: TextField!
    @IBOutlet weak var acountTf: TextField!
    @IBOutlet weak var emailTf: TextField!
    @IBOutlet weak var numberlbl: TextField!
    @IBOutlet weak var codeNumberlbl: TextField!
    @IBOutlet weak var nameLbl: TextField!
    @IBOutlet weak var SelectedImage: UIImageView!
    @IBOutlet weak var ToSelectImage: UIImageView!
    
    var imageSelected : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        // Do any additional setup after loading the view.
    }
    override func bind(ViewModel: settingViewModel) {
        ViewModel.SeccessUpdateAbservable.subscribe(onNext: { [weak self] (reselte) in
            guard let self = self else{return}
            self.activatyIndictor.stopAnimating()
            self.presentAlertOnMainThread(message: reselte.msg, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
        }).disposed(by: disposePag)
    }
    func SetupUI(){
        let TapregognizerIm = UITapGestureRecognizer(target: self, action: #selector(showAllImageToChose))
        TapregognizerIm.numberOfTapsRequired = 1
        self.ToSelectImage.addGestureRecognizer(TapregognizerIm)
        self.ToSelectImage.isUserInteractionEnabled = true
    }
    
    @objc func showAllImageToChose(_ sender : UITapGestureRecognizer){
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func SaveSetting(_ sender: Any) {
        updatProfile()
    }
    
    @IBAction func dissmisBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
    func updatProfile(){
        activatyIndictor.startAnimating()
        
        guard let email = emailTf.text , !email.isEmpty,let password = passwordTf.text , !password.isEmpty,let phone = numberlbl.text , !phone.isEmpty,let name = nameLbl.text , !name.isEmpty,let accountNumber = acountTf.text ,!accountNumber.isEmpty, let codeNumder = codeNumberlbl.text ,!codeNumder.isEmpty else {
                presentAlertOnMainThread(message: "please set the value of empty field", buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            return}
        
        let paramerts : [String : Any] = [
            "email" :  email,
            "password": password,
            "name" : name,
            "account_bank" : accountNumber,
            "mobile" : codeNumder + phone,
        ]
        
        guard let iamgeDate = imageSelected?.jpegData(compressionQuality: 70.0) else{
            presentAlertOnMainThread(message: "please select Photo to updata your Profile", buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            activatyIndictor.stopAnimating()
            return}
        vieeModel.updataProfile(parameter: paramerts, image: iamgeDate)
    }
}

extension SettingViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.SelectedImage.image = editImage
            imageSelected = editImage
            print(editImage)
            if  let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? NSURL {
                if let imageName = imageUrl.lastPathComponent{
                    print(imageName)
                }
            }
            
        }else{
            let original = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.SelectedImage.image = original
            if let image = original{
                imageSelected = image
                print(image)
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
}

