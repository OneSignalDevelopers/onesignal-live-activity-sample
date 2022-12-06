//
//  OneSignalWidgetBundle.swift
//  OneSignalWidget
//
//  Created by Henry Boswell on 12/5/22.
//

import WidgetKit
import SwiftUI

@main
struct OneSignalWidgetBundle: WidgetBundle {
    var body: some Widget {
        OneSignalWidget()
        OneSignalWidgetLiveActivity()
    }
}
