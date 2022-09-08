//
//  Experiment.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-08.
//

import SwiftUI

struct Experiment: View {

    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: Tabs()) {
                  Text("Exercises")
                }
                Intro()
                EndCircle()
            }
        }
    }
}

struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment()
    }
}
