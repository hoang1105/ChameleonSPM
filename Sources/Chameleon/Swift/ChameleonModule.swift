//
//  ChameleonModule.swift
//  Chameleon
//
//  Created for Swift Package Manager support
//

import Foundation
import UIKit

// Re-export ChameleonObjC module to make it available when importing Chameleon
@_exported import ChameleonObjC

// This file ensures that when users import Chameleon, they get access to:
// 1. All Objective-C APIs from ChameleonObjC
// 2. All Swift convenience methods and extensions from ChameleonShorthand
