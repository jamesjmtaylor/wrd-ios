//
//  UIView+LoadNib.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/5/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
//
//  Copyright © 2018 Nautilus Inc. All rights reserved.
//
import UIKit
import Foundation

extension UIView {

    class func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        if let view = UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil).first { return view as? UIView }
        return nil
    }

    func anchorSidesTo(_ view: UIView, insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0), topAnchorActive: Bool = true, leadingAnchorActive: Bool = true, bottomAnchorActive: Bool = true, trailingAnchorActive: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = topAnchorActive
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = leadingAnchorActive
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = bottomAnchorActive
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right).isActive = trailingAnchorActive
    }

    func removeAllConstraints() {
        self.removeConstraints(self.constraints)
    }
}
