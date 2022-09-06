//
//  Level.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-02.
//

import Foundation
import Foundation
import SwiftUI

struct Level: Hashable, Decodable {
    var name: String
    var inhale: Double
    var exhale: Double
    var duration: Double
}
