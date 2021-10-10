//
//  Process.swift
//  Sapphire_owner_app
//
//  Created by PC103-PC on 22/09/21.
//

import Foundation
import UIKit
import MBProgressHUD

class Process : NSObject {
    class func show(toView: UIView) {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: toView, animated: true)
        }
    }
    
    class func hide(toView: UIView) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: toView, animated: true)
        }
    }
}
