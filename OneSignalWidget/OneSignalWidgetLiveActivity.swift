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
    
        var quarter: Int
        var scoreLeft: Int
        var scoreRight: Int
        var bottomText: String
    }
    var timer: ClosedRange<Date>
    var imageLeft: String // Knight
    var teamNameLeft: String // Kinghts
    var imageRight: String // Pirates
    var teamNameRight: String // Pirates
    var gameName: String // "Western Conference Round 1"
}

struct OneSignalWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OneSignalWidgetAttributes.self) { context in
            VStack(alignment: .center) {
                HStack {
                    HStack {
                        VStack(alignment: .center) {
                            Image(context.attributes.imageLeft)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                            Text(context.attributes.teamNameLeft).font(.system(size: 12, weight: .regular))
                        }
                        //100
                        Text(String(context.state.scoreLeft)).font(.system(size: 24, weight: .regular)).padding(.leading, 24)
                    }.padding(.leading, 10)
                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                            Circle()
                                .fill(.red)
                                .frame(width: 7, height: 7)
                            Text("Q" + String(context.state.quarter)).font(.system(size: 14, weight: .bold))
                        }
                        Text(timerInterval: context.attributes.timer, countsDown: true)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 40)
                                            .font(.caption2)
                    }
                    Spacer()
                    HStack {
                        Text(String(context.state.scoreRight)).font(.system(size: 24, weight: .regular)).padding(.trailing, 24)
                        VStack(alignment: .center) {
                            Image(context.attributes.imageRight)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                            Text(context.attributes.teamNameRight).font(.system(size: 12, weight: .regular))
                        }.padding(.trailing, 10)
                    }
                   
                }.padding(5)
                HStack {
                    Image("league")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35).padding(.leading, 10).padding(.top, 10).padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        Text(context.attributes.gameName).font(.system(size: 14, weight: .bold))
                        Text(context.state.bottomText).font(.system(size: 12, weight: .regular))
                    }
                    Spacer()
                  
                }.padding(5).background(Color.init(red: 0.898, green: 0.91, blue: 0.922), in: Rectangle())
            }.padding(.top,15).activityBackgroundTint(.white).activitySystemActionForegroundColor(.black)

           
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
