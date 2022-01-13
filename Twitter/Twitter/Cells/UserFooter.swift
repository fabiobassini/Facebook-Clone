//
//  UserFooter.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/07/21.
//

import UIKit

class UserFooter: BaseCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        lineView.isHidden = false
        return lineView
    }()
    
    let whiteBackgroundView: UIView = {
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        return whiteBackgroundView
    }()
    
    
    override func setupView() {
        
        addSubview(separatorLineView)
        addSubview(whiteBackgroundView)

        addSubview(textLabel)

        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        separatorLineView.anchor(nil, left: leftAnchor, bottom: textLabel.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
