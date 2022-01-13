//
//  UserCell.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/07/21.
//

import UIKit


class UserCell: BaseCell {
    
    var user: User? {
        didSet {
            if let name = user?.name {
                nameLabel.text = name
            }
            if let username = user?.username {
                usernameLabel.text = username
            }
            
            if let biotextview = user?.bioText {
                biotextView.text = biotextview
            }
            
            if let profileImage = user?.profileImage {
                if let imageData = try? Data(contentsOf: profileImage) {
                    profileImageView.image = UIImage(data: imageData)
                }
            }
            
        }
    }
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Fabio Bassini"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return nameLabel
    }()
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "@fabio2002bassini"
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = .gray
        return usernameLabel
    }()
    
    
    let biotextView: UITextView = {
        let biotextView = UITextView()
        biotextView.text = "IOS programming, Swift tutorial, Web programming and artificial intelligence experts!"
        biotextView.font = UIFont.systemFont(ofSize: 15)
        biotextView.backgroundColor = .clear
        biotextView.isEditable = false
        biotextView.isSelectable = false
        return biotextView
    }()
    
    
    let followButton: UIButton = {
        let followButton = UIButton()
        followButton.layer.cornerRadius = 5
        followButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        followButton.layer.borderWidth = 1
        
        followButton.semanticContentAttribute = .forceLeftToRight
        

        followButton.setTitle("Follow", for: .normal)
        followButton.titleEdgeInsets = UIEdgeInsets(top:0, left: 50, bottom:0, right:0)
        
        let image = UIImage(named:"follow_buton_twt")
        followButton.setImage(image, for: .normal)
        
        followButton.imageView?.contentMode = .scaleAspectFit
        followButton.imageEdgeInsets = UIEdgeInsets(top:25, left:0, bottom:25, right:70)
        followButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)

        followButton.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
        followButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        return followButton
    }()
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.1)
        lineView.isHidden = false
        return lineView
    }()
    
    override func setupView() {
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(biotextView)
        addSubview(followButton)
        addSubview(separatorLineView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        biotextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)

    }
    
}
