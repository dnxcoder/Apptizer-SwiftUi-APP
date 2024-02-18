//
//  NetworkManager.swift
//  Apptizers
//
//  Created by Denis Coder on 2/17/24.
//

import Foundation


//Creating a singleton
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    //we are privating the init
    //so this way this class will never be able to create another instance
    private init(){}
    
    public func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) -> Void {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return Void ()
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return Void();
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return Void();
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return Void();
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedReponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedReponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
