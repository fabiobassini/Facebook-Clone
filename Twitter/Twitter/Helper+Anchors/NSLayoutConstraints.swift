//
//  NSLayoutConstraints.swift
//  Twitter
//
//  Created by Fabio Bassini on 22/07/21.
//

import UIKit

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.clipsToBounds = true
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor(r: 232, g: 236, b: 241).cgColor
    }
}

extension UIView {
    
    func animateBorderAlpha(_ view: UIView){
        /// First Animation
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.beginTime = 0
        animation.toValue = UIColor(r: 79, g: 167, b: 238).cgColor
        animation.fromValue = UIColor(r: 232, g: 236, b: 241).cgColor
        animation.duration = 2

//        /// Second Animation
//        let animation1 = CABasicAnimation(keyPath: "borderColor")
//        animation1.toValue = UIColor.black.cgColor
//        animation1.fromValue = UIColor.black.withAlphaComponent(0.1).cgColor
//        animation1.beginTime = animation.beginTime + animation.duration
//        animation.duration = 4
//
//        /// Animation Group
//        let borderColorAnimation: CAAnimationGroup = CAAnimationGroup()
//        borderColorAnimation.animations = [animation, animation1]
//        borderColorAnimation.duration = animation.duration + animation1.duration
//        borderColorAnimation.repeatCount = Float.greatestFiniteMagnitude
        view.layer.add(animation, forKey: "borderColor")
    }
    
    
//    func roundedView() {
//        self.layer.cornerRadius = 7;
//        self.clipsToBounds = true
//        self.layer.borderWidth = 3.0
//        self.layer.borderColor = UIColor(r: 232, g: 236, b: 241).cgColor
//    }
    
    func animateBorderColor(toColor: UIColor, duration: Double) {
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = layer.borderColor
        

        
        animation.toValue = toColor.cgColor
        animation.toValue = toColor.cgColor
        animation.toValue = toColor.cgColor

        animation.duration = duration
        layer.add(animation, forKey: "borderColor")


        layer.borderColor = toColor.cgColor
    }
    
}

extension UIView {

    
    public func addContraintsWithFormat(_ format: String, views: UIView...) {
          var viewDict = [String: UIView]()

          for (index, view) in views.enumerated() {
              let key = "v\(index)"
              view.translatesAutoresizingMaskIntoConstraints = false
              viewDict[key] = view
          }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
      }
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
            translatesAutoresizingMaskIntoConstraints = false
            
            var anchors = [NSLayoutConstraint]()
            
            if let top = top {
                anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
            }
            
            if let left = left {
                anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
            }
            
            if let bottom = bottom {
                anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
            }
            
            if let right = right {
                anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
            }
            
            if widthConstant > 0 {
                anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
            }
            
            if heightConstant > 0 {
                anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }
            
            anchors.forEach({$0.isActive = true})
            
            return anchors
        }
        
    
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
}


extension UIColor {    
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

}

extension HomeController {
        
    func updateUI(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.collectionView.reloadData()
            self.removeSpinner()

        }
    }

    func updateUI(with tweets: [Tweet]) {
        DispatchQueue.main.async {
            self.tweets = tweets
            self.collectionView.reloadData()

            self.removeSpinner()

        }
    }
}
