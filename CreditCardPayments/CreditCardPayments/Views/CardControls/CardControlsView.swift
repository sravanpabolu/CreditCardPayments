//
//  CardControlsView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 28/06/22.
//

import SwiftUI

struct CardControlsView: View {
    let cardControlItems: [CardControlItem] = [
        CardControlItem(name: Constants.Labels.lockCard,
                        status: .active,
                        imageName: Constants.Images.lockCard),
        CardControlItem(name: Constants.Labels.internationalUsage,
                        status: .active,
                        imageName: Constants.Images.internationalUsage),
        CardControlItem(name: Constants.Labels.onlineTransactions,
                        status: .inactive,
                        imageName: Constants.Images.onlineTransactions),
        CardControlItem(name: Constants.Labels.contactLessPayment,
                        status: .inactive,
                        imageName: Constants.Images.contactLessPayment),
        CardControlItem(name: Constants.Labels.domesticTransaction,
                        status: .active,
                        imageName: Constants.Images.domesticTransaction),
        CardControlItem(name: Constants.Labels.atmWithdrawal,
                        status: .inactive,
                        imageName: Constants.Images.atmWithdrawal)
    ]
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Image(Constants.Images.creditCardControls)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                    Divider()
                    CardControlsGrid(items: cardControlItems)
                        .frame(maxHeight: geo.size.height * 0.7)
                    Divider()
                    resetPinView
                }
                .navigationTitle(Constants.NavigationTitles.cardControls)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    var resetPinView: some View {
        HStack {
            HStack {
                Image(systemName: "keyboard")
                    .foregroundColor(.blue)
                Text(Constants.Labels.resetPin)
            }
            Spacer()
            Button {
                print("reset pin tapped")
            } label: {
                Text(Constants.ButtonTitles.resetPin)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CardControlsGrid: View {
    let items: [CardControlItem]
    let rows = [
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.name) {
                    CardControlItemView(controlItem: $0)
                        .padding([.leading])
                }
            }
        }
    }
}

enum CardActivationStatus: String {
    case active = "Active", inactive = "Inactive"
}

struct CardControlItem {
    let name: String
    let status: CardActivationStatus
    let imageName: String
}

struct CardControlItemView: View {
    let controlItem: CardControlItem
    let frameDimensions = 60.0
    let buttonWidth = 90.0
    var body: some View {
        VStack {
            Button {
                print("Status btn tapped")
            } label: {
                Image(systemName: controlItem.imageName)
                    .font(.title)
                    .frame(width: frameDimensions, height: frameDimensions)
                    .foregroundColor(
                        controlItem.status == .active
                        ? .blue
                        : .cardControlItemInactive
                    )
                    .background(
                        controlItem.status == .active
                        ? .cardControlItemInactive
                        : .blue
                    )
                    .clipShape(Circle())
            }
            Text(controlItem.name)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: buttonWidth)
                .padding(10)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Text(controlItem.status.rawValue)
                .font(.caption2)
                .foregroundColor(
                    controlItem.status == .active
                    ? .green
                    : .red
                )
        }
        .frame(width: 90)
        .padding(.vertical)
    }
}

struct CardControlsView_Previews: PreviewProvider {
    static let item = CardControlItem(name: "Lock Card", status: .active, imageName: "creditcard")
    static var previews: some View {
        CardControlsView()
    }
}
