//
//  TextFieldViewController.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/5/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import UIKit
import SwiftUI

class TextFieldViewController: UIViewController {
    let text: Binding<String>?
    let onDismiss: (() -> Void)?

    init (

        text: Binding<String>, onDismiss: (() -> Void)?) {

        self.text = text
        self.onDismiss = onDismiss
// NOTE: For the xib connection to work you must create the xib & set it's owner to this file
        super.init( nibName: "TextField", bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        self.text = nil
        self.onDismiss = nil

        super.init(coder: coder)
    }

    // helper function to encapsulate calling the "view" of UIViewController
    fileprivate func getTextField() -> UITextField? {
        return view.subviews.first as? UITextField
    }

    override func viewDidLoad() {
        let textField = self.getTextField()

        // configure a toolbar with a Done button
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = [
            UIBarButtonItem(title: "Previous", style: UIBarButtonItem.Style.done, target: self , action: #selector(self.onSet)),
            UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.onSet)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.onSet))
        ]
        toolbar.sizeToFit()

        textField!.inputAccessoryView = toolbar
    }

    @objc private func onSet() {
        let textField = self.getTextField()
        textField?.resignFirstResponder()

        self.text?.wrappedValue = textField?.text ?? ""
        self.onDismiss?()
    }

}
