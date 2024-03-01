//
//  ItemDescription.swift
//  Apptizers
//
//  Created by Denis Coder on 2/23/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack(spacing:5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            
            Spacer()
            Button{}
        label: {
            APButton(title:"$\(appetizer.price, specifier: "%.2f") - Add to Order")
        }
        .padding(.bottom, 30)
        }.frame(width: 300, height: 525)
            .background(Color(.white))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                self.isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}


struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(self.title)")
                .bold()
                .font(.caption)
            Text("\(self.value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
