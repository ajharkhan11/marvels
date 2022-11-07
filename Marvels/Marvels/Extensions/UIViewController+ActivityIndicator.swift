//
//  UIViewController+ActivityIndicator.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 03/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func startActivityIndicator() {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
        activityIndicator.tag = 9999
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
    }
    
    func stopActivityIndicator() {
        if let activityIndicator = self.view.subviews.filter({$0.tag == 9999}).first as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
