//
//  TransactionDetailView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import SwiftUI

struct Transaction {
    enum TransactionStatus: String {
        case debit
        case credit
    }
    
    let description, tag: String
    let status: TransactionStatus = .debit
    let amount: Double
    let rewardPoints: Int
    let transactionDate: String
    var roundedAmount: String {
        String(amount.round(to: 2))
    }
}

struct TransactionDetailView: View {
    let transaction: Transaction

    @State var showShareSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(systemName: "cart")
                    .resizable()
                    .padding(10)
                    .frame(width: 75, height: 75)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(15)
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Text(transaction.description)
                    .font(.body.bold())
                Spacer()
                
                Text("\(transaction.roundedAmount)")
                    .foregroundColor(transaction.status == .debit ? .red : .green)
                    .font(.body.bold())
                    .clipShape(Capsule())
                    .padding(.horizontal, 25)
                    .overlay(
                        Capsule()
                            .strokeBorder(transaction.status == .debit ? .red : .green, lineWidth: 1)
                    )
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Section(header: Text(Constants.TransactionDetailView.paymentDetails)
                    .font(.title3.bold())
                ) {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.green)
                            .padding(10)
                            .background(Color.creditCapsuleBG)
                            .clipShape(Circle())
                        Text(transaction.transactionDate)
                            .font(.body)
                    }
                }
                
                Divider()
                
                Section(header: Text(Constants.TransactionDetailView.rewardPoints)
                    .font(.title3.bold())
                ) {
                    HStack {
                        Image(systemName: "dollarsign")
                            .foregroundColor(Color.goldFont)
                            .padding(10)
                            .background(Color.goldBG)
                            .clipShape(Circle())
                        Text(String(transaction.rewardPoints))
                            .font(.body)
                    }
                }
            }

            Spacer()
        }
        .padding(.horizontal)
        .padding()
    }
    
    func shareSheet(url: String) {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }

        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }

    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let transaction = Transaction(
            description: "Flipkart",
            tag: "Shopping",
            amount: 334.89,
            rewardPoints: 23, transactionDate: "22-May-2022")
        TransactionDetailView(transaction: transaction)
    }
}
