//
//  CellSecondScene.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class CellSecondScene: UITableViewCell {
    
    lazy var labelNews: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = R.Fonts.systemText
        label.numberOfLines = 0
        return label
    }()
    
   lazy var labelDate: UILabel = {
        let label = UILabel()
       label.textColor = .black
       label.font = R.Fonts.systemText
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.addArrangedSubview(labelNews)
        stackView.addArrangedSubview(labelDate)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        stackView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
