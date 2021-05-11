//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    var collectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationConfigure()
        
        //collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.width / 3, height: view.height / 3)
        
        //collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //collection view delegate
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        
    }
    private func navigationConfigure(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName:"gear"),
            style: .done,
            target: self,
            action: #selector(didTapSettingButton))
    }
    
    @objc private func didTapSettingButton(){
        let vc = SettingViewController()
        vc.title = "Setting"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
