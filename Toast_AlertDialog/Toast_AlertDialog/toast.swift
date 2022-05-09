//
//  toast.swift
//  Toast_AlertDialog
//
//  Created by Ouriel Bennathan on 24/04/2022.
//

import Foundation
import UIKit
//our home self made toast
class toast{
    static func show(message: String, controller:UIViewController, duration: Double, disapper:Double){
        //create and set the container
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25
        toastContainer.clipsToBounds = true
        
        //create and set the label
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        
        //atach the label to the container
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint (item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        
        toastContainer.addConstraints([a1,a2,a3,a4])
        
        let c1 = NSLayoutConstraint (item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint (item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint (item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -25)
        
        controller.view.addConstraints([c1,c2,c3])
        
        //showing the toast but not remove it
        //toastContainer.alpha = 1.0
        
        //and the correct way
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: {
            _ in
            UIView.animate(withDuration: duration, delay: disapper, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {
                _ in
                toastContainer.removeFromSuperview()
            })
        })
    }


}

