//
//  KeyboardBoundView.swift
//  SmackAlpha
//
//  Created by Jonny B on 7/11/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = CGFloat((endFrame.origin.y) - (beginingFrame.origin.y))

        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}


//extension UIView {
//
//    func bindToKeyboard(){
//        NotificationCenter.default.addObserver(self, selector: #selector(UIView.keyboardWillChange(_:)), name: NSNotification.Name.UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//
//    @objc func keyboardWillChange(_ notification: NSNotification) {
//        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
//        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let deltaY = targetFrame.origin.y - curFrame.origin.y
//
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//
//        },completion: {(true) in
//            self.layoutIfNeeded()
//        })
//    }
//}


