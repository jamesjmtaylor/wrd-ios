//
//  TextFieldView.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/5/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

import SwiftUI

// The SwiftUI view, wrapping the UITextField
struct TextFieldView: View {

    var text: Binding<String>
    var onDismissKeyboard: (() -> Void)?

    var body: some View {
        TextFieldRepresentable(
            text: self.text
            , dismissKeyboardCallback: self.onDismissKeyboard
        )
    }
}

// The UIViewControllerRepresentable, feeding and controlling the UIViewController
struct TextFieldRepresentable
    : UIViewControllerRepresentable {

    // the callback
    let dismissKeyboardCallback: (() -> Void)?

    // created in the previous file/gist
    let viewController: TextFieldViewController

    init (
        text: Binding<String>
        , dismissKeyboardCallback: (() -> Void)?) {

        self.dismissKeyboardCallback = dismissKeyboardCallback
        self.viewController = TextFieldViewController(
            text: text
            , onDismiss: dismissKeyboardCallback
        )
    }

    // UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {

        return viewController
    }

    // UIViewControllerRepresentable
    func updateUIViewController(_ viewController: UIViewController, context: Context) {
    }

}
