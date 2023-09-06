//
//  ThirdSceneViewController.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class ThirdSceneViewController: UIViewController {
    
    private lazy var tableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        return tableView
    }()
    
    private let cellID = "cellID"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(CellThirdScene.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
        tableView.topAnchor.constraint(equalTo: view.topAnchor),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ThirdSceneViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelsInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CellThirdScene
        cell?.labelName.text = modelsInfo[indexPath.row].name
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NextView(description: modelsInfo[indexPath.row].description, location: modelsInfo[indexPath.row].location)
        navigationController?.pushViewController(vc, animated: true)
    }
}
