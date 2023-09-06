//
//  FirstSceneViewController.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class FirstSceneViewController: UIViewController {
    
    private let cellID = "cellID"
    
    private lazy var tableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CellFirstScene.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension FirstSceneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataWithImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CellFirstScene
        let viewModel = dataWithImages[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
}

extension FirstSceneViewController: UITableViewDelegate {}
