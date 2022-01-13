//
//  TweetCell.swift
//  Twitter
//
//  Created by Fabio Bassini on 26/07/21.
//

import UIKit

class TweetCell: BaseCell {
    
    
    var tweet: Tweet? {
        didSet {
            
            let attributedText = NSMutableAttributedString(string: (tweet?.user.name)!, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])

            let usernameString = "  \(tweet!.user.username)\n"

            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)

            attributedText.append(NSAttributedString(string: tweet!.message, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))

            messageTextView.attributedText = attributedText
            
            if let profileImage = tweet?.user.profileImage {
                if let imageData = try? Data(contentsOf: profileImage) {
                    profileImageView.image = UIImage(data: imageData)
                }
            }

        }
    }
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        lineView.isHidden = false
        return lineView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.text = "Some example text"
        messageTextView.backgroundColor = .clear
        messageTextView.allowsEditingTextAttributes = false
        messageTextView.isEditable = false
        messageTextView.isSelectable = false
        return messageTextView
    }()
    
    let replyButton: UIButton = {
        let replyButton = UIButton(type: .system)
        replyButton.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return replyButton
    }()
    
    let retweetButton: UIButton = {
        let retweetButton = UIButton(type: .system)
        retweetButton.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return retweetButton
    }()
    
    let likeButton: UIButton = {
        let likeButton = UIButton(type: .system)
        likeButton.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return likeButton
    }()
    
    let dmButton: UIButton = {
        let dmButton = UIButton(type: .system)
        dmButton.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return dmButton
    }()

    override func setupView() {
        backgroundColor = .white
        
        
        addSubview(profileImageView)
        addSubview(separatorLineView)
        addSubview(messageTextView)
        
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupBottomButton()
    }
    
    fileprivate func setupBottomButton() {
        
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        
        let likeButtonContainerView = UIView()
        
        let directMessageButtonContainerView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        addSubview(replyButton)
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        addSubview(retweetButton)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        addSubview(likeButton)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        addSubview(dmButton)
        dmButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
    }
}
