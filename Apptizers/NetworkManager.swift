//
//  NetworkManager.swift
//  Apptizers
//
//  Created by Denis Coder on 2/17/24.
//

import UIKit


//Creating a singleton
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
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
    
    
    //fromURLString parameter is having name changed for urlString just for simplify the name
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlString)
        
        
        //It checks if this image has already been downloaded and it is in cash
        //If the image is already downloaded then just get out of function
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return Void()
        }
        
        
        //checking the URL if it is good
        guard let url = URL(string: urlString) else {
            completed(nil)
            return Void()
        }
        
        //
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //if i have data, awesome continue and check if we can initialize an image from that data
            guard let data = data, let image = UIImage(data: data) else {
                // if i dont have a data or i cant innitialize an image from that data
                completed(nil)
                return Void()
            }
            
            // now we are going to put the image that we downloaded on cache
            // so next time we dont need to download the image again
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
