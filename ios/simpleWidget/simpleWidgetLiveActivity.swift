//
//  simpleWidgetLiveActivity.swift
//  simpleWidget
//
//  Created by Guillermo Guevara on 27-03-25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct simpleWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct simpleWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: simpleWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension simpleWidgetAttributes {
    fileprivate static var preview: simpleWidgetAttributes {
        simpleWidgetAttributes(name: "World")
    }
}

extension simpleWidgetAttributes.ContentState {
    fileprivate static var smiley: simpleWidgetAttributes.ContentState {
        simpleWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: simpleWidgetAttributes.ContentState {
         simpleWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: simpleWidgetAttributes.preview) {
   simpleWidgetLiveActivity()
} contentStates: {
    simpleWidgetAttributes.ContentState.smiley
    simpleWidgetAttributes.ContentState.starEyes
}
