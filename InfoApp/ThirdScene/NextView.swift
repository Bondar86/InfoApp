//
//  NextView.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class NextView: UIViewController {
    
    lazy var labelInfo: UILabel = {
        let info = UILabel()
        info.textColor = .black
        info.text = "Info"
        info.font = R.Fonts.systemHeading
        return info
    }()
    
    lazy var labelDescription: UILabel = {
        let description = UILabel()
        description.textColor = .black
        description.font = R.Fonts.systemText
        description.numberOfLines = 0
        return description
    }()
    
    lazy var labelLocation: UILabel = {
        let location = UILabel()
        location.textColor = .black
        location.font = R.Fonts.systemHeading
        location.numberOfLines = 0
        return location
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.addArrangedSubview(labelInfo)
        stackView.addArrangedSubview(labelDescription)
        stackView.addArrangedSubview(labelLocation)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(description: String, location: String) {
        super.init(nibName: nil, bundle: nil)
        labelLocation.text = "Location: \n\(location)"
        labelDescription.text = "Description: \n\(description)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
}
