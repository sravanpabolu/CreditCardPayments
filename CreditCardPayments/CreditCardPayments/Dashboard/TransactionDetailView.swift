//
//  TransactionDetailView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 22/06/22.
//

import SwiftUI

enum TransactionStatus: String {
    case debit
    case credit
}

struct Transaction {
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
            HStack {
                Text(transaction.description)
                    .font(.callout)
                Spacer()
                ZStack {
                    Capsule()
                        .fill(transaction.status == .debit ? Color.debitCapsuleBG : Color.creditCapsuleBG)
                        .frame(width: 120, height: 30)
                    Text("\(transaction.roundedAmount)")
                        .foregroundColor(transaction.status == .debit ? .red : .green)
                        .font(.callout)
                }
            }
            Divider()
            Section(header: Text("PAYMENT DETAILS")) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.green)
                        .padding(10)
                        .background(Color.creditCapsuleBG)
                        .clipShape(Circle())
                    Text(transaction.transactionDate)
                        .font(.callout)
                }
            }

            Section(header: Text("REWARD POINTS")) {
                HStack {
                    Image(systemName: "dollarsign")
                        .foregroundColor(Color.goldFont)
                        .padding(10)
                        .background(Color.goldBG)
                        .clipShape(Circle())
                    Text(String(transaction.rewardPoints))
                        .font(.callout)
                }
            }

            Spacer()
            Button {
                print("Transaction shared")
            } label: {
                HStack {
                    Spacer()
                    Text("Share Transaction")
                    Image(systemName: "square.and.arrow.up")
                    Spacer()
                }
            }
        }
        .padding()
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
