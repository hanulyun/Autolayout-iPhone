//
//  ViewController.swift
//  Autolayout-iPhone
//
//  Created by HanulYun-Comp on 2020/02/07.
//  Copyright © 2020 Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sample1View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let sample2View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAutolayouts()
    }
    
    fileprivate func configureAutolayouts() {
        [sample1View, sample2View].forEach({view.addSubview($0)})
        [sample1View, sample2View].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        let view1Constraints: [NSLayoutConstraint] = [
            sample1View.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sample1View.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sample1View.widthAnchor.constraint(equalToConstant: 50.adjusted),
            sample1View.heightAnchor.constraint(equalToConstant: 50.adjusted)
        ]
        
        // 스크롤뷰가 없으면 작은 화면에서 잘림.
        var view2Constraints: [NSLayoutConstraint] = [
            sample2View.centerXAnchor.constraint(equalTo: sample1View.centerXAnchor),
            sample2View.topAnchor.constraint(equalTo: sample1View.bottomAnchor, constant: 200.adjusted),
            sample2View.widthAnchor.constraint(equalToConstant: 120.adjusted),
            sample2View.heightAnchor.constraint(equalToConstant: 200.adjusted)
        ]
        
        if DeviceManager.shared.isFiveIncheDevices() {
            view2Constraints = [
                sample2View.centerXAnchor.constraint(equalTo: sample1View.centerXAnchor),
                sample2View.topAnchor.constraint(equalTo: sample1View.bottomAnchor, constant: 100),
                sample2View.widthAnchor.constraint(equalToConstant: 120.adjusted),
                sample2View.heightAnchor.constraint(equalToConstant: 200.adjusted)
            ]
        }
        
        [view1Constraints, view2Constraints].forEach({NSLayoutConstraint.activate($0)})
    }
}

