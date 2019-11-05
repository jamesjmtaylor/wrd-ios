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
// NOTE: For the xib connection to work you must create the xib
//      & set it's owner to this file
        super.init( nibName: "TextField", bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        self.text = nil
        self.onDismiss = nil

        super.init(coder: coder)
    }

    // helper function to encapsulate calling the "view" of UIViewController
    fileprivate func getTextField() -> UITextField? {
        return view as? UITextField
    }

    override func viewDidLoad() {
        let textField = self.getTextField()
        guard textField != nil else {
            return
        }

        // configure a toolbar with a Done button
        let toolbar = UIToolbar()
        toolbar.setItems([
                // just moves the Done item to the right
                UIBarButtonItem(
                    barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace
                    , target: nil
                    , action: nil
                )
                , UIBarButtonItem(
                    title: "Done"
                    , style: UIBarButtonItem.Style.done
                    , target: self
                    , action: #selector(self.onSet)
                )
            ]
            , animated: true
        )
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        textField?.inputAccessoryView = toolbar
    }

    @objc private func onSet() {
        let textField = self.getTextField()
        textField?.resignFirstResponder()

        self.text?.wrappedValue = textField?.text ?? ""
        self.onDismiss?()
    }

}
