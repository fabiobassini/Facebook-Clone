//
//  UserHeader.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/07/21.
//

import UIKit

class UserHeader: BaseCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    enum CollectionViewIds: String {
        
        case cellId = "CellId"
        case secondCellId = "SecondCellId"
        
    }
    
    var stories: [Story] = []

    
    let storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let storiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        storiesCollectionView.backgroundColor = .clear
        storiesCollectionView.showsHorizontalScrollIndicator = false
        return storiesCollectionView
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.4)
        lineView.isHidden = false
        return lineView
    }()
    
    
    override func setupView() {
        
        backgroundColor = .white

        
        addSubview(storiesCollectionView)
        
        storiesCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: CollectionViewIds.cellId.rawValue)
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        addSubview(textLabel)
        addSubview(separatorLineView)
        
        
        storiesCollectionView.anchor(topAnchor, left: leftAnchor, bottom: textLabel.topAnchor, right: rightAnchor, topConstant: 4, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
        

        
        textLabel.anchor(storiesCollectionView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)

        
        separatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        
        Helper.shared.fetchUsers { users in
            guard let users = users else { return }
            
            for user in users {
                let story = Story(nameOfModel: user)
                self.stories.append(story)
            }
        }
        
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewIds.cellId.rawValue, for: indexPath) as! StoryCell
        
        cell.story = stories[indexPath.item]
        
        return cell
    }
    
    
}
