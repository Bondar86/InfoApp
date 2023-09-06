//
//  CellFirstScene.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class CellFirstScene: UITableViewCell {
    
    private lazy var labelText: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = R.Fonts.systemText
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 180
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(labelText)
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
    
    override func prepareForReuse() {
        image.image = nil
    }
    
    func configure(_ viewModel: FirstSceneViewModel) {
        labelText.text = viewModel.text
        image.image = viewModel.image
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        stackView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
