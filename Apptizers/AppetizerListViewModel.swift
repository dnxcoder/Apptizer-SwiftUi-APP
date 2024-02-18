//
//  AppetizerListViewModel.swift
//  Apptizers
//
//  Created by Denis Coder on 2/17/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    //Published vars allow to be broadcasted
    @Published public var appetizers: [Appetizer] = []
    
    
    public func getApptizers() {
        NetworkManager.shared.getAppetizers(){ result in
            
            //DispatchQueue.main.async makes the code run in the main thread
            // since we have the NetworkManager that would work on the background thread
            // but since we are going to use the results from NetworkManager to change our UI
            // we need to use DispatchQueue.main.async
            
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
