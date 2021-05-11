//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationConfigure()
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
