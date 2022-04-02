//
//  Service.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func execute<T: Codable>(
        request: ServiceRouter,
        responseModel: T.Type,
        completion: @escaping (Result<T, ServiceError>) -> Void)
}

final class Service: ServiceProtocol {
    
    static let shared = Service()
    
    private init() {}
    
    func execute<T: Codable>(request: ServiceRouter, responseModel: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        do {
            let urlRequest = try request.asURLRequest()
            AF.request(urlRequest).validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                        let jsonModel = try JSONDecoder().decode(responseModel, from: jsonData)
                        completion(.success(jsonModel))
                    } catch {
                        completion(.failure(.couldNoParse))
                    }
                case .failure:
                    completion(.failure(.badRequest))
                }
            }
        } catch {
            completion(.failure(.badUrl))
        }
    }
}
