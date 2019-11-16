//
//  TextFieldView.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/5/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

// The SwiftUI view, wrapping the UITextField
struct TextFieldView: View {
    var tag: Int
    var hint: String
    var text: Binding<String>
    var onDismissKeyboard: (() -> Void)?

    var body: some View {
        TextFieldRepresentable(tag: tag, text: text, hint: hint, dismissKeyboardCallback: self.onDismissKeyboard)
            .frame(height: 32, alignment: .leading)
    }
}

// The UIViewControllerRepresentable, feeding and controlling the UIViewController
//SwiftUI provides a protocol called UIViewControllerRepresentable which exposes all the UIKit objects that, to date, have not been natively integrated into SwiftUI.
//By conforming to this protocol it is possible to construct an object that exposes the content of an UIView natively to SwiftUI.
//To conform to the protocol two methods must be implemented, 'makeUIViewController' and 'updateUIViewController'.
struct TextFieldRepresentable: UIViewControllerRepresentable {

    // the callback
    let dismissKeyboardCallback: (() -> Void)?

    // created in the previous file/gist
    let viewController: TextFieldViewController

    init (tag: Int, text: Binding<String>, hint: String, dismissKeyboardCallback: (() -> Void)?) {
        self.dismissKeyboardCallback = dismissKeyboardCallback
        self.viewController = TextFieldViewController(text: text, hint: hint, onDismiss: dismissKeyboardCallback)
        self.viewController.view.tag = tag
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
    }
}
