//
//  CellThirdScene.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class CellThirdScene: UITableViewCell {
    
     lazy var labelName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = R.Fonts.systemText
        name.numberOfLines = 0
        return name
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.addArrangedSubview(labelName)
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
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        stackView.widthAnchor.constraint(equalToConstant: 500)
        ])
    }
}
