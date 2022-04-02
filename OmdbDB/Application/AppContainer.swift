//
//  AppContainer.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let appConfiguration = AppConfig.shared
    let service = Service.shared
    let router = AppRouter()
}
