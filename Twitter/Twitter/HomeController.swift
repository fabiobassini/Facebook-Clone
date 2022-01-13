//
//  HomeController.swift
//  Twitter
//
//  Created by Fabio Bassini on 21/07/21.
//

import UIKit


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    enum CollectionViewIds: String {
        
        case cellId = "CellId"
        case secondCellId = "SecondCellId"
        case headerId = "HeaderId"
        case footerId = "FooterId"
        
    }
    
    var users: [User] = []
    var tweets: [Tweet] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: CollectionViewIds.cellId.rawValue)
        
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: CollectionViewIds.secondCellId.rawValue)
        
        collectionView.register(UserHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewIds.headerId.rawValue)
        
        collectionView.register(UserFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewIds.footerId.rawValue)
        
        
        setupNavigationBarItems()
        
        
        
        Helper.shared.fetchHomeFeed { feeds in
            self.showSpinner()
            
            if let feeds = feeds {
                if !feeds.users.isEmpty {
                    let users = feeds.users
                    self.updateUI(with: users)

                }
                
                if !feeds.tweets.isEmpty {
                    let tweets = feeds.tweets
                    self.updateUI(with: tweets)

                }
            }
        }
        
        

    }
    
    
    let baseUrl = URL(string: "http://api.letsbuildthatapp.com/twitter/home")
    
    
    func removeSpinner() {
        activityView?.removeFromSuperview()
    }


    fileprivate var activityView: UIView?
    func showSpinner() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityView!.center

        let isLoading = true

        if isLoading {
            activityIndicator.startAnimating()
            activityView?.addSubview(activityIndicator)
            self.view.addSubview(activityView!)
        }

    }

    
    
    private func setupNavigationBarItems() {
            
        setupRemainingNavItems()
        setupLeftNavItems()
        setupRightNavItems()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navbarSeparartorView = UIView()
        navbarSeparartorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navbarSeparartorView)
        navbarSeparartorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewIds.cellId.rawValue, for: indexPath) as! UserCell
                    
            cell.user = users[indexPath.item]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewIds.secondCellId.rawValue, for: indexPath) as! TweetCell
                    
            cell.tweet = tweets[indexPath.item]
            
            return cell
        }
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    // Delegate stuff
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            
            let user = users[indexPath.item]
            let approximatewidthofBiotextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximatewidthofBiotextView, height: 1000)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
                
            }
        
        if indexPath.section == 1 {
            
            let tweet = tweets[indexPath.item]
            
            let approximatewidthofBiotextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximatewidthofBiotextView, height: 1000)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular)]
            
            let estimatedFrame = NSString(string: tweet.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    
    
    // Header stuff
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewIds.headerId.rawValue, for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewIds.footerId.rawValue, for: indexPath)
            return footer
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
//        50
        return CGSize(width: view.frame.width, height: 112)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    }

    
}
