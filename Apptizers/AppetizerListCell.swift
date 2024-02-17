//
//  AppetizerListCell.swift
//  Apptizers
//
//  Created by Denis Coder on 2/16/24.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    var body: some View {
        
        HStack{
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .cornerRadius(8) // Define o raio da borda
            
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$" + String(format: "%.2f", appetizer.price))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
