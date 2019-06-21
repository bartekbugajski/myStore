//
//  ItemsSearchController.swift
//  myStore
//
//  Created by Bartek Bugajski on 03/06/2019.
//  Copyright © 2019 BB. All rights reserved.
//

import UIKit

class ItemsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)

        fetchU2videos()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    
    }
    
    fileprivate func fetchU2videos() {
        let urlString = "https://itunes.apple.com/search?term=U2&entity=musicVideo"
        guard let url = URL(string: urlString) else { return }
        //fetch data from the internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            //success
            //            print(data)
            //            print(String(data: data!, encoding: .utf8))
            
            guard let data = data else { return }
            
            do {
                
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                searchResult.results.forEach({print($0.trackName, $0.artistName)})
                
            } catch let jsonErr {
                
                print("Failed to decode: json:", jsonErr)
                
            }
            
            
            
            }.resume() //fires of request
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 300, height: 250)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth : CGFloat = 300
        
        let numberOfCells = floor(self.view.frame.size.width / cellWidth)
        let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 2)
        
        return UIEdgeInsets(top: 15, left: edgeInsets, bottom: 15, right: edgeInsets)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.layer.cornerRadius = 6.0
        cell.nameLabel.text = "Here's my text label"
        
        /*
        cell.layoutMargins.left = 20.0
        cell.layoutMargins.right = -20.0
        cell.preservesSuperviewLayoutMargins = true
        viewRespectsSystemMinimumLayoutMargins = true
        cell.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
 */
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
