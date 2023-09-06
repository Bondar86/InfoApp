//
//  SecondSceneViewController.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class SecondSceneViewController: UIViewController {
    
    private lazy var tableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        tableView.register(CellSecondScene.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    func getDateFromString(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        return formatter.date(from: string) ?? Date()
    }
    
    func getStringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: date)
    }
    
    func prepare() -> [PrepareToSorted] {
        let result: [PrepareToSorted] = models.map {
            PrepareToSorted(news: $0.newsRecord, dateSorted: getDateFromString($0.publishedAt))
        }
        return result
    }
    
    func getSections() -> [Date: [PrepareToSorted]] {
        let sections = Dictionary(grouping: prepare()) { (element: PrepareToSorted) in
            let calendar = Calendar.current.dateComponents([.year, .month, .day], from: element.dateSorted)
            let newDate = Calendar.current.date(from: calendar)
            return newDate ?? Date()
        }
        return sections
    }
    
    func sortingSection() -> [(key: Date, value: [PrepareToSorted])] {
         getSections().sorted {$0.key > $1.key}
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

extension SecondSceneViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sortingSection().count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
         headerView.backgroundColor = .systemGray

         let label = UILabel()
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = getStringFromDate(sortingSection()[section].key)
         headerView.addSubview(label)
         label.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
         label.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
         label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
         label.heightAnchor.constraint(equalToConstant: 60).isActive = true

         return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortingSection()[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CellSecondScene
        cell?.labelNews.text = sortingSection()[indexPath.section].value[indexPath.row].news
        cell?.labelDate.text = getStringFromDate(sortingSection()[indexPath.section].value[indexPath.row].dateSorted)
        return cell ?? UITableViewCell()
    }
}
