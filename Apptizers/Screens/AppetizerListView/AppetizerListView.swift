//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer : Appetizer?
    
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers, id:\.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            //self.detailViewData = appetizer
                            self.selectedAppetizer = appetizer
                            self.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
            }.onAppear{
                viewModel.getApptizers()
            }
            .blur(radius: self.isShowingDetail ? 20 : 0)
            .disabled(self.isShowingDetail ? true : false)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: self.selectedAppetizer!, isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }.alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

//#Preview {
//    AppetizerListView(detailViewData: MockData.sampleAppetizer, showDetailView: true)
//}
