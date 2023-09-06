//
//  FirstScene.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

enum R {
    
    enum Fonts {
        static var systemHeading: UIFont {
            UIFont.systemFont(ofSize: 30, weight: .semibold)
        }
        static var systemText: UIFont {
            UIFont.systemFont(ofSize: 16)
        }
    }
    
    enum Image {
        static let austria = UIImage(named: "Austria")
        static let belgium = UIImage(named: "Belgium")
        static let france = UIImage(named: "France")
        static let germany = UIImage(named: "Germany")
        static let greece = UIImage(named: "Greece")
    }
}

var dataWithImages: [FirstSceneViewModel] = [
    FirstSceneViewModel(
        image: R.Image.austria ?? UIImage(),
        text: "Austria"
    ),
    FirstSceneViewModel(
        image: R.Image.belgium ?? UIImage(),
        text: "Belgium"
    ),
    FirstSceneViewModel(
        image: R.Image.france ?? UIImage(),
        text: "France"
    ),
    FirstSceneViewModel(
        image: R.Image.germany ?? UIImage(),
        text: "Germany"
    ),
    FirstSceneViewModel(
        image: R.Image.greece ?? UIImage(),
        text: "Greece"
    )
]
