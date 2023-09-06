//
//  SecondSceneViewModel.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import Foundation

struct NewsRecordModel {
    let newsRecord: String
    let publishedAt: String
}

struct PrepareToSorted {
    let news: String
    let dateSorted: Date
}

struct SectionModel {
    let date: String
    let section: [PrepareToSorted]
}
