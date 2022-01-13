//
//  StoryCell.swift
//  Twitter
//
//  Created by Fabio Bassini on 04/08/21.
//

import UIKit

class StoryCell: BaseCell {
    
    
    var story: Story? {
        didSet {
            if let userImage = story?.imageName {
                if let imageData = try? Data(contentsOf: userImage) {
                    profileImageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = #imageLiteral(resourceName: "profile_image")
        profileImageView.contentMode = .scaleAspectFill
        return profileImageView
    }()
    
//    let rotatorBorderProfileImageview: UIView = {
//        let rotatorBorderProfileImageview = UIView()
//        rotatorBorderProfileImageview.backgroundColor = UIColor(r: 232, g: 236, b: 241)
//        return rotatorBorderProfileImageview
//    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.roundedImage()
//
//        animateBorderAlpha(rotatorBorderProfileImageview)

    }
    
    override func setupView() {
        
        
//        UIView.animate(withDuration: .pi, delay: 0.0, options: .curveLinear) {
//            self.rotatorBorderProfileImageview.transform = self.rotatorBorderProfileImageview.transform.rotated(by: CGFloat(Double.pi))
//
//        }
        
        addSubview(profileImageView)
        

        
        backgroundColor = .clear
        
//        addSubview(rotatorBorderProfileImageview)
//
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)

    }
    
}
