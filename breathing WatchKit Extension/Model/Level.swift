//
//  Level.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-02.
//

import Foundation
import Foundation
import SwiftUI

struct Landmark: Hashable, Identifiable {
    var id: Int
    var name: String
    var inhale: Int
    var exhale: Int
    var duration: Int
}
