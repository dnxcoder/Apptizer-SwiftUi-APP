//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers, id:\.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            //self.detailViewData = appetizer
                            self.viewModel.selectedAppetizer = appetizer
                            self.viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
            }.onAppear{
                viewModel.getApptizers()
            }
            .blur(radius: self.viewModel.isShowingDetail ? 20 : 0)
            .disabled(self.viewModel.isShowingDetail ? true : false)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: self.viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
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
