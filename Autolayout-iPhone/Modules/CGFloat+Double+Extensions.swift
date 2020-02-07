//
//  CGFloat+Double+Extensions.swift
//  Autolayout-iPhone
//
//  Created by HanulYun-Comp on 2020/02/07.
//  Copyright © 2020 Yun. All rights reserved.
//

import UIKit

extension CGFloat {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return self * ratio
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        return CGFloat(self) * ratio
    }
}
