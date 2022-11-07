//
//  HTTPManager.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 16/02/22.
//

import Foundation

class HTTPManager {
    static let shared: HTTPManager = HTTPManager()
    let apiBaseURL = "https://gateway.marvel.com/v1/public/"
    
    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString: String, parameters: [String: String] ,completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }
            if let responseData = data, let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 {
                    completionBlock(.success(responseData))
                }else if httpResponse.statusCode == 401 {
                    completionBlock(.failure(NSError(domain: "", code: 401, userInfo: [ NSLocalizedDescriptionKey: Constants.invalidAPIKeysErrorMessage])))
                }else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                }
            }
        }
        task.resume()
    }
}
