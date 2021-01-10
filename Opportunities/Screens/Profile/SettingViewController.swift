//
//  SettingViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SettingViewController: BaseWireFrame<settingViewModel> {
    
    @IBOutlet weak var SelectedImage: UIImageView!
    @IBOutlet weak var ToSelectImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        // Do any additional setup after loading the view.
    }
    override func bind(ViewModel: settingViewModel) {
        
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
        
    }
    
    @IBAction func dissmisBtn(_ sender: Any) {
        coordinator.dismiss()
    }
}

extension SettingViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.SelectedImage.image = editImage
            
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
                print(image)
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
}

