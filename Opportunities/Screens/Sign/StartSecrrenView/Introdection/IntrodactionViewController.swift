//
//  IntrodactionViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class IntrodactionViewController: BaseWireFrame<IntrodectionViewModel> {
    @IBOutlet weak var BottomStackView: UIStackView!
    
    @IBOutlet weak var GetStartBtn: UIButton!
    @IBOutlet weak var ViewContainer: UIView!
    
    var scrolltoNumber = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewContainer.addSubview(scrollview)
        edgeTo(view: view)
        scrollview.isScrollEnabled = false
    }
    override func bind(ViewModel: IntrodectionViewModel) {
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        scrollview.isScrollEnabled = true
        scrollview.scrollTo(horizontalPage: scrolltoNumber , verticalPage: 0, animated: true)
        scrolltoNumber += 1
        scrollview.isScrollEnabled = false
        if scrolltoNumber == 3 {
            BottomStackView.isHidden = true
            GetStartBtn.isHidden = false
            
        }
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        let MainTab = coordinator.mainNavigator.coordinator.tabBarController
        MainTab.modalPresentationStyle = .overFullScreen
        present(MainTab, animated: true, completion: nil)
    }
    @IBAction func getStartBtnAction(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SignInView)
        UIApplication.topViewController()?.present(viewc, animated: true, completion: nil)
        
    }
    
    let view1 : UIView = StartViewTwo()
    let view2 : UIView = StartViewOne()
    let view3 : UIView = getStart()
    
     lazy var views = [view1,view2,view3]
     
     lazy var scrollview : UIScrollView = {
         let scrollview = UIScrollView()
         
         scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        
         scrollview.isPagingEnabled = true
         scrollview.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
         for i in 0 ..< views.count{
             scrollview.addSubview(views[i])
             views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
         }
         
         return scrollview
     }()
    
    
    func edgeTo(view: UIView) {
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.topAnchor.constraint(equalTo: ViewContainer.topAnchor).isActive = true
        scrollview.leadingAnchor.constraint(equalTo: ViewContainer.leadingAnchor).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: ViewContainer.trailingAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: ViewContainer.bottomAnchor).isActive = true
        
      
        
    }
     
}
extension UIScrollView {
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }
}


