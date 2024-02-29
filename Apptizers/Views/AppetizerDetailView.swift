//
//  ItemDescription.swift
//  Apptizers
//
//  Created by Denis Coder on 2/23/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack{
            Image("asian-flank-steak")
                .resizable()
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
                    VStack {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        Text("\(appetizer.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            
            Spacer()
            Button{}
        label: {
            Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 260, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.brandPrimary)
                .cornerRadius(10)
        }
        .padding(.bottom, 30)
        }.frame(width: 300, height: 525)
            .background(Color(.white))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                print("dismiss")
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
