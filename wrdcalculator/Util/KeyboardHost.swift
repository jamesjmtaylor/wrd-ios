//
//  KeyboardHost.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/6/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct KeyboardHost<Content: View>: View {
    let view: Content

    /// The current height of the keyboard rect.
    @State private var keyboardHeight = CGFloat(0)

    /// A publisher that combines all of the relevant keyboard changing notifications and maps them into a `CGFloat` representing the new height of the
    /// keyboard rect.
    private let keyboardChangePublisher = NotificationCenter.Publisher(center: .default,
                                                                       name: UIResponder.keyboardWillShowNotification)
        .merge(with: NotificationCenter.Publisher(center: .default,
                                                  name: UIResponder.keyboardWillChangeFrameNotification))
        .merge(with: NotificationCenter.Publisher(center: .default,
                                                  name: UIResponder.keyboardWillHideNotification)
        .map { Notification(name: $0.name, object: $0.object, userInfo: nil) })
        .map { ($0.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero).size.height }

//    private let hidePublisher = NotificationCenter.Publisher.init(
//        center: .default,
//        name: UIResponder.keyboardWillHideNotification
//    ).map {_ -> CGFloat in 0}

    // Like HStack or VStack, the only parameter is the view that this view should layout.
    // (It takes one view rather than the multiple views that Stacks can take)
    init(@ViewBuilder content: () -> Content) {
        view = content()
    }

    var body: some View {

            view
            .onReceive(keyboardChangePublisher) { self.keyboardHeight = $0 }
            .padding(.bottom, keyboardHeight)
            .animation(.default)

    }
}
