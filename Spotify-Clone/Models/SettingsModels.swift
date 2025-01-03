//
//  SettingsModels.swift
//  Spotify-Clone
//
//  Created by Ferid Suleymanzade on 02.01.25.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
