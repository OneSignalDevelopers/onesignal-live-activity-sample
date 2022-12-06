//
//  OneSignalWidgetLiveActivity.swift
//  OneSignalWidget
//
//  Created by Henry Boswell on 12/5/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct OneSignalWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct OneSignalWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OneSignalWidgetAttributes.self) { context in
            VStack(alignment: .center) {
                HStack {
                    HStack {
                        VStack(alignment: .center) {
                            Image("Knight")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                            Text("Knights").font(.system(size: 12, weight: .regular))
                        }
                        //100
                        Text("100").font(.system(size: 24, weight: .regular)).padding(.leading, 24)
                    }.padding(.leading, 10)
                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                            Circle()
                                .fill(.red)
                                .frame(width: 7, height: 7)
                            Text("Q4").font(.system(size: 14, weight: .bold))
                        }
                        Text("02:16").font(.system(size: 14, weight: .regular))
                    }
                    Spacer()
                    HStack {
                        Text("104").font(.system(size: 24, weight: .regular)).padding(.trailing, 24)
                        VStack(alignment: .center) {
                            Image("Pirates")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                            Text("Pirates").font(.system(size: 12, weight: .regular))
                        }.padding(.trailing, 10)
                    }
                   
                }.padding(5)
                HStack {
                    Image("league")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35).padding(.leading, 10).padding(.top, 10).padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        Text("Western Conference Round 1").font(.system(size: 14, weight: .bold))
                        Text("Game 5: Series Tied 2-2").font(.system(size: 12, weight: .regular))
                    }
                    Spacer()
                  
                }.padding(5).background(Color.init(red: 0.898, green: 0.91, blue: 0.922), in: Rectangle())
            }.padding(.top,15).activityBackgroundTint(.white)

           
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
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
