//
//  simpleWidgetBundle.swift
//  simpleWidget
//
//  Created by Guillermo Guevara on 27-03-25.
//

import WidgetKit
import SwiftUI

@main
struct simpleWidgetBundle: WidgetBundle {
    var body: some Widget {
        simpleWidget()
        simpleWidgetControl()
        simpleWidgetLiveActivity()
    }
}
