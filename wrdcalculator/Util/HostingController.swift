//
//  HostingController.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/24/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class HostingController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
