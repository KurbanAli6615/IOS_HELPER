//
//  Alert.swift
//  Sapphire_owner_app
//
//  Created by PC103-PC on 21/09/21.
//

import UIKit

class Alert {


    static func showAlert(title: String,message: String,controller: UIViewController, onOkTap: ((UIAlertAction) -> Void)?) {
        let alertController =  UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok" , style: .default, handler: onOkTap)
        alertController.addAction(alertAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
