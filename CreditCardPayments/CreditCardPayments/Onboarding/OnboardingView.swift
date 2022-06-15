//
//  OnboardingView.swift
//  CreditCardPayments
//
//  Created by Sravan Kumar Pabolu on 15/06/22.
//

import SwiftUI
import UIKit

struct OnboardingView: View {
    var body: some View {
        OnboardingView()
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}

struct Page: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
    }
}

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
    
    
}


struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: [
            Page(imageName: "1.Intro"),
            Page(imageName: "2.Intro"),
            Page(imageName: "3.Intro"),
            Page(imageName: "4.Intro")
        ])
    }
}
