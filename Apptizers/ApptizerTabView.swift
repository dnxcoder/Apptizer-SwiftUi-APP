//
//  ContentView.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import SwiftUI

struct ApptizerTabView: View {
    var body: some View {
        TabView{
            ApptizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    ApptizerTabView()
}
