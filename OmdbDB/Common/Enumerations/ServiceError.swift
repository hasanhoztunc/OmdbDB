//
//  ServiceError.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation

enum ServiceError: Error {
    case couldNoParse
    case badUrl
    case badRequest
}
