//
//  Tabs.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-05.
//

import SwiftUI

struct Tabs: View {
    let levelModel = ModelData();

    var body: some View {
        TabView {
            ForEach(levelModel.levels, id: \.self) { level in
                CircleOfLife()
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs().environmentObject(ModelData())
    }
}
