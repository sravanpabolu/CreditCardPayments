//
//  LocalClient.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import Foundation
import Combine

protocol DataFetchService {
    func getData<T: Codable>(for endpoint: EndPoint, type: T.Type) throws -> AnyPublisher<T, Error>
}

struct LocalClient: DataFetchService {
    func getData<T>(for endpoint: EndPoint, type: T.Type) throws -> AnyPublisher<T, Error> where T: Codable {

        print("Fetching from local json")

        guard let url = endpoint.getUrl() else {
            throw DataFetchError.url
        }

        let aPublisher = Future<T, Error> { promise in
            do {
                let data = try Data(contentsOf: url)
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                return promise(.success(parsedData))
            } catch {
                return promise(.failure(DataFetchError.parsing))
            }
        }

        return aPublisher.eraseToAnyPublisher()
    }
}
