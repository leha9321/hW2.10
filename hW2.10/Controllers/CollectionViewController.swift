//
//  CollectionViewController.swift
//  hW2.10
//
//  Created by Алексей Трофимов on 28.11.2021.
//

import UIKit


class CollectionViewController: UICollectionViewController {

     let users = ["Person", "Info" ]


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.userActionLabel.text = users[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        switch users[indexPath.item] {
        case "Person": performSegue(withIdentifier: "Image", sender: nil)
        case "Info": performSegue(withIdentifier: "AboutHero", sender: nil)
        default:
            break
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AboutHero" {
            let heroVC = segue.destination as! TableViewController
            heroVC.fetchData()
            heroVC.postRequest()
        }
    }
    
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
}
