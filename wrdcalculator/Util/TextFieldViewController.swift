//
//  TextFieldViewController.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/5/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import UIKit
import SwiftUI

class TextFieldViewController: UIViewController, UITextFieldDelegate {
    let text: Binding<String>?
    let hint: String?
    let onDismiss: (() -> Void)?

    init (text: Binding<String>, hint: String?, onDismiss: (() -> Void)?) {
        self.text = text
        self.hint = hint
        self.onDismiss = onDismiss
        super.init( nibName: "TextField", bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        self.text = nil
        self.hint = nil
        self.onDismiss = nil
        super.init(coder: coder)
    }

    // helper function to encapsulate calling the "view" of UIViewController
    fileprivate func getTextField() -> UITextField? {
        return view.subviews.first as? UITextField
    }

    override func viewDidLoad() {
        let textField = self.getTextField()
        textField?.placeholder = self.hint
        textField?.delegate = self

        // configure a toolbar with a Done button
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = [
            UIBarButtonItem(title: "Previous", style: UIBarButtonItem.Style.done, target: self , action: #selector(self.onPrevious)),
            UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.onNext)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.onSet))
        ]
        textField?.inputAccessoryView = toolbar
    }

    @objc private func onSet() {
        let textField = self.getTextField()
        textField?.resignFirstResponder()

        self.text?.wrappedValue = textField?.text ?? ""
        self.onDismiss?()
    }

    @objc private func onPrevious() {
        guard let textField = self.getTextField() else {return}

        self.text?.wrappedValue = textField.text ?? ""
        let currentTag = textField.superview?.tag ?? 0
        if let nextField = textField.superview?.superview?.superview?.viewWithTag(currentTag - 1)?.subviews.first as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }

    @objc private func onNext() {
        guard let textField = self.getTextField() else {return}

        self.text?.wrappedValue = textField.text ?? ""
        let currentTag = textField.superview?.tag ?? 0
        if let nextField = textField.superview?.superview?.superview?.viewWithTag(currentTag + 1)?.subviews.first as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
}
