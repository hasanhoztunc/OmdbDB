//
//  ServiceRouter.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation
import Alamofire

enum ServiceRouter {
    case search(text: String, page: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .search(let text, let page):
            guard let urlEncodedSearchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                return ""
            }
            return "?s=" + urlEncodedSearchText + "&page=" + "\(page)" + "&apiKey=" + ServiceConstants.apiKey
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try (ServiceConstants.baseUrl + path).asURL()
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
