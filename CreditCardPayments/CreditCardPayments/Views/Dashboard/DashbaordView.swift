//
//  DashbaordView.swift
//  CreditCardPayments
//
//  Created by Ramesh Pedapati on 09/06/22.
//

import SwiftUI

struct DashbaordView: View {

    @State var progress = 0.4

    @State private var isTransactionDetailsDisplayed: Bool = false

    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                newCardView
                    .background(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 180)

                StateMentGeneratedView()
                    .frame(maxWidth: .infinity, alignment: .leading)

                recentTranscation
                    .onTapGesture {
                        isTransactionDetailsDisplayed = true
                    }

                Spacer()
            } else {
                Text(TextError.shared.below15)
            }
        }

        .sheet(isPresented: $isTransactionDetailsDisplayed) {
            // TODO: - replace with actual transaction
            let transaction = Transaction(
                description: "Flipkart", tag: "Shopping",
                amount: 334.89, rewardPoints: 23,
                transactionDate: "22-May-2022")
            TransactionDetailView(transaction: transaction)
        }
    }

    var cardView : some View {
        VStack {
            if #available(iOS 15.0, *) {
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: .infinity, height: geometry.size.height*0.3)

                        .overlay(content: {
                            HStack(alignment: .top) {
                                CardImage(geometry: geometry)
                                VStack(alignment: .leading, spacing: 10) {
                                    UserNameView(name: "Ramesh")
                                    OutStandingView()
                                    AvailableLimitView(totalLimitValue: 50000, outStandingValue: 4000)
                                }
                                Spacer(minLength: 10)
                            }
                        })
                }
            } else {
                Text(TextError.shared.below15)
            }
        }
    }

    var newCardView : some View {
        GeometryReader { geometry in
            VStack {
                HStack(alignment: .center, spacing: 10) {
                    CardImage(geometry: geometry)
                    VStack(alignment: .leading, spacing: 10) {
                        UserNameView(name: "Ramesh")
                        OutStandingView()
                        AvailableLimitView(totalLimitValue: 50000, outStandingValue: 4000)
                    }
                    Spacer(minLength: 10)
                }
            }
        }
    }

    var recentTranscation: some View {
        List {
            Section(header:
                        Text("Recent Transcation")) {
                ForEach(0..<10, id: \.self) { _ in
                    RecentTranscationsCell(price: 1000, credit: 10)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct CardImage: View {
    var geometry: GeometryProxy
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
             Image("card")
                 .resizable()
                 .aspectRatio( contentMode: .fit)
                 .frame(width: geometry.size.width*0.45, height: geometry.size.height*0.80, alignment: .leading)
         })
    }
}

struct UserNameView: View {
    var name: String
    var body: some View {
        HStack {
            Text("Hello \(name)")
                .font(.callout)
                .fontWeight(.light)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "bell.badge.circle")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct OutStandingView: View {
    var outStandingAmmount = 4000
    var body: some View {
        VStack(alignment:.leading) {
            Text("Total OutStanding")
                .font(.footnote)
                .foregroundColor(Color.white)
            if #available(iOS 15.0, *) {
                Text(outStandingAmmount,format: .currency(code: "USD"))
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
            } else {
                Text(TextError.shared.below15)
            }
        }
    }
}

struct AvailableLimitView: View {
    var totalLimitValue: Int
    var outStandingValue: Int
    @State var progress = 0.0

    var progressValue: Float {
        return Float(outStandingValue/totalLimitValue)
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProgressView(value: progress)
                .background(
                    Color.white
                )
                .frame(height: 8)
            if #available(iOS 15.0, *) {
                HStack {
                    Text("Available Limit ")
                        .font(.caption2)
                    + Text(totalLimitValue, format:
                                .currency(code: "USD"))
                        .font(.caption)
                }
                .font(.caption)
                .foregroundColor(Color.white)
            } else {
                Text(TextError.shared.below15)
            }
        }
        .onAppear(perform: {
            progress = Double(progressValue)
        })
        .padding(.trailing)
    }
}

struct StateMentGeneratedView : View {
    var body: some View {
        HStack(alignment:.top) {
            if #available(iOS 15.0, *) {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(8)
                    .background(Color.cyan)
                    .cornerRadius(8)
            } else {
                Text(TextError.shared.below15)
            }
            
            VStack(alignment:.leading) {
                Text("Statement Not Generated")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
                HStack {
                    Text(Image(systemName: "clock.circle"))
                    Text("Next Statement Generated on 20 days")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                HStack {
//                    DetailsButton(buttonName: "View Details", action: {
//                        print("View details")
//                    }, titleColor: .black, backGroundColor: Color("lightGray"))
//                        .frame(maxWidth:.infinity)

                    Button {
                        print("View Details")
                    } label: {
                        Text("View Details")
                    }
                    .buttonStyle(
                        MyActionButtonStyle(
                            backGroundColor: Color("veryLightGray"),
                            foreGroundColor: Color.black))

                    Button {
                        print("Pay Details")
                    } label: {
                        Text("Pay")
                    }
                    .buttonStyle(MyActionButtonStyle())
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .padding(.horizontal)
    }
}

//@ViewBuilder
struct MyActionButtonStyle : ButtonStyle{

    var backGroundColor : Color = .blue
    var foreGroundColor : Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.callout)
            .foregroundColor(foreGroundColor)
            .frame(height:44)
            .frame(maxWidth:.infinity)
            .background(backGroundColor)
            .cornerRadius(8)
    }
}

struct DetailsButton : View{
    var buttonName : String
    var action : () -> Void
    var titleColor : Color
    var backGroundColor : Color

    var body: some View{
        Button(buttonName, action: action)
            .padding()
            .foregroundColor(titleColor)
            .background(backGroundColor)
            .cornerRadius(8)
    }
}

struct DashbaorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashbaordView()
        }
    }
}

struct TextError {
    static var shared = TextError()
    var below15 = "Not support below iOS 15"
}
