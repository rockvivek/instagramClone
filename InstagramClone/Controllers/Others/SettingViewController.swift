//
//  SettingViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

struct SettingModel {
    let title: String
    let handler: (() -> Void)
}

final class SettingViewController: UIViewController {

    //table view
    private let settingTableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var data = [[SettingModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingTableView)
        view.backgroundColor = .systemBackground
        
        //delegate and datasource
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        configureModels()
    }
    
    override func viewDidLayoutSubviews() {
        settingTableView.frame = view.bounds
    }
    
    private func configureModels() {
        let section = [
            SettingModel(title: "LogOut") { [weak self] in
                self?.didTapLogoutButton()
            }
        ]
        data.append(section)
    }
    
    //tapped logout button
    private func didTapLogoutButton() {
        let alert = UIAlertController(title: "LogOut", message: "Are you Sure? You want to logout.", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Conform", style: .destructive){ _ in
            AuthManager.shared.logout(completion: { logout in
                DispatchQueue.main.async {
                    if logout{
                        //logout success
                        let vc = LoginViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true) {
                            self.navigationController?.popViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else{
                        //logout failed
                    }
                }
            })
        })
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //handle row selection
        data[indexPath.section][indexPath.row].handler()
    }
}
