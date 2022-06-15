//
//  RecentTranscationsCell.swift
//  CreditCardPayments
//
//  Created by Ramesh Pedapati on 14/06/22.
//

import SwiftUI

struct RecentTranscationsCell: View {
    
    @State var price = 1000
    @State var credit = 10
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20){
            if #available(iOS 15.0, *) {
                Circle()
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray, radius: 5, x: 1, y: 1)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(systemName: "cart")
                            .font(.title2)
                    }
                
                VStack(alignment:.leading,spacing:8){
                    Text("FlipCart")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    HStack{
                        Text("14 May")
                            .font(.callout)
                            .foregroundColor(.black)
                        
                        Text("Shoping")
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(Color.blue)
                            .lineLimit(1)
                            .padding(.horizontal)
                            .overlay {
                                Capsule(style: .continuous)
                                    .stroke(Color.blue,lineWidth: 1)
                            }
                    }
                }
                
                
                VStack(alignment:.trailing,spacing:10){
                    Text(price,format: .currency(code: "USD"))
                        .font(.body)
                    Text("😀") +
                    Text("\(credit)")
                        .font(.callout)
                        .foregroundColor(.green)
                }
            }
            else {
                Text("Not support below iOS 15")
            }
        }
        .padding(.vertical)
    }
}

struct RecentTranscationsCell_Previews: PreviewProvider {
    static var previews: some View {
        RecentTranscationsCell()
    }
}
