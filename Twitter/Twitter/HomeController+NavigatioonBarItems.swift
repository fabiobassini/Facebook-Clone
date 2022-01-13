//
//  HomeController+NavigatioonBarItems.swift
//  Twitter
//
//  Created by Fabio Bassini on 26/07/21.
//

import UIKit

extension HomeController {
    func setupRemainingNavItems() {
        let titleView = UIView(frame: CGRect(x: 0,y: 0,width: 44,height: 44))
        let tileImage = UIImage(named: "title_icon")
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        titleImageView.image = tileImage
        titleImageView.layer.masksToBounds = true
        titleImageView.clipsToBounds = true


        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

    func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        let followImage = UIImage(named: "fl")
        followButton.setImage(followImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        followButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        followButton.imageView?.contentMode = .scaleAspectFit
        

        let customView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 34, height: 34)))
        customView.addSubview(followButton)

        
        
        let leftButton = UIBarButtonItem(customView: customView)

        navigationItem.leftBarButtonItem = leftButton
    }

    func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        let searchImage = UIImage(named: "search")
        searchButton.setImage(searchImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 74, height: 74)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 35, right: 10)
        searchButton.imageView?.contentMode = .scaleAspectFit
        
        let searchView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 34, height: 34)))
        searchView.addSubview(searchButton)
        
        let rightButton = UIBarButtonItem(customView: searchView)
        
        
        let composeButton = UIButton(type: .system)
        let composeimage = UIImage(named: "compose")
        composeButton.setImage(composeimage?.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        composeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: -20)
        composeButton.imageView?.contentMode = .scaleAspectFit
        
        let composeView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 34, height: 34)))
        composeView.addSubview(composeButton)
        
        let secondRightButton = UIBarButtonItem(customView: composeView)
        
        
        
        navigationItem.rightBarButtonItems = [secondRightButton,rightButton]
    }
}
