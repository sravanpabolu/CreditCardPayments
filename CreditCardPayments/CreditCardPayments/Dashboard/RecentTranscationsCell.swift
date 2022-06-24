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

        HStack(alignment: .center, spacing: 20) {
            if #available(iOS 15.0, *) {
                Circle()
                    .foregroundColor(Color.white)
                    .shadow(color: Color.gray, radius: 5, x: 1, y: 1)
                    .frame(width: 45, height: 45)
                    .overlay {
                        Image(systemName: "cart")
                            .font(.title3)
                    }

                VStack(alignment: .leading, spacing: 8) {
                    Text("FlipCart")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)

                    HStack {
                        Text("14 May")
                            .font(.footnote)
                            .foregroundColor(.black)

                        Text("Shoping")
                            .font(.caption2)
                            .fontWeight(.light)
                            .foregroundColor(Color.blue)
                            .lineLimit(1)
                            .padding(.horizontal)
                            .overlay {
                                Capsule(style: .continuous)
                                    .stroke(Color.blue, lineWidth: 1)
                            }
                    }
                }

                VStack(alignment: .trailing, spacing: 10) {
                    Text(price, format: .currency(code: "USD"))
                        .font(.callout)
                    Text("😀") +
                    Text("\(credit)")
                        .font(.caption2)
                        .foregroundColor(.green)
                }
            } else {
                Text(TextError.shared.below15)
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
