//
//  UIViewController+Alert.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 02/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}
