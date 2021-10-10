//
//  Device.swift
//  OccuCare
//
//  Created by PC23 on 29/07/17.
//  Copyright © 2017 Sapphire. All rights reserved.
//

import UIKit

class Device: NSObject {
    
    // MARK: Use for get Device Information
    static var kScreenBounds: CGRect = UIScreen.main.bounds
    static var isiPhone4: Bool = 480 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone5: Bool = 568 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone6: Bool = 667 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone6Plus: Bool   = 736 == UIScreen.main.bounds.size.height ? true:false
    static var isiPad: Bool = 736 == UIScreen.main.bounds.size.height ? true:false
    static var screenWidth: CGFloat   = UIScreen.main.bounds.size.width
    static var screenHeight: CGFloat = UIScreen.main.bounds.size.height
}
