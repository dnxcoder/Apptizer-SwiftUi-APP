//
//  ItemDescription.swift
//  Apptizers
//
//  Created by Denis Coder on 2/23/24.
//

import SwiftUI

struct ItemDescription: View {
    var body: some View {
        VStack{
            Image("asian-flank-steak")
                .resizable()
                .frame(width: 300, height: 250)
                .clipShape(
                    .rect(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 20
                    )
                )
                .overlay(
                    
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .position(x: 300 - 22.5, y:22.5)
                        .opacity(0.9)
                )
            
            
            Text("Chicken Wings")
                .fontWeight(.semibold)
                .font(.title2)
            
            Text("You'll need extra napkins with these tasty treats.")
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.textGray)
            
            HStack{
                Spacer()
                VStack{
                    Text("Calories")
                        .fontWeight(.semibold)
                        .foregroundStyle(.textGray)
                        .font(.system(size: 12))
                    Text("700")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .italic()
                        .padding(.top,0.5)
                }
                Spacer()
                VStack{
                    Text("Carbs")
                        .fontWeight(.semibold)
                        .foregroundStyle(.textGray)
                        .font(.system(size: 12))
                    Text("11 g")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .italic()
                        .padding(.top,0.5)
                }
                Spacer()
                VStack{
                    Text("Protein")
                        .fontWeight(.semibold)
                        .foregroundStyle(.textGray)
                        .font(.system(size: 12))
                    Text("13 g")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .italic()
                        .padding(.top,0.5)
                }
                Spacer()
            }
            
            Button{}
        label: {
            ZStack{
                Rectangle()
                    .frame(width: 300, height: 60)
                    .foregroundColor(.brandPrimary)
                    .cornerRadius(10)
                Text("$11.49 - Add To Order")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title3)
            }
            .padding()
        }
        }
    }
}

#Preview {
    ItemDescription()
}
