//
//  RExtensions.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
import Rswift

// If you get an error like: "'localizable is not a member type of 'R.string'"
// or "'read failed: Couldn't parse property list because the input data was in an invalid format'"
// It's likely because you have a syntax error in a strings file (e.g. missing semicolon)

/// Typealias for quickly accessing the main Localizable.strings file
typealias Localizable = R.string.localizable

