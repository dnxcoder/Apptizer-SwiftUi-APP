//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers, id:\.id) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
