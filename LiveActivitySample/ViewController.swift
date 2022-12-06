//
//  ViewController.swift
//  LiveActivitySample
//
//  Created by Henry Boswell on 12/5/22.
//

import UIKit
import ActivityKit
import OneSignal

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        var startLiveActivityButton = UIButton()
        startLiveActivityButton.setTitle("Start Live Activity", for: .normal)
        startLiveActivityButton.backgroundColor = .gray
        startLiveActivityButton.setTitleColor(UIColor.black, for: .normal)
        startLiveActivityButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        startLiveActivityButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startLiveActivityButton)
        NSLayoutConstraint.activate([
            startLiveActivityButton.heightAnchor.constraint(equalToConstant: 50),
            startLiveActivityButton.widthAnchor.constraint(equalToConstant: 200),
            startLiveActivityButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startLiveActivityButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc
    func buttonTapped(sender : UIButton) {
        startLiveActivity()
       
    }
    
    func startLiveActivity() {
        let attributes = OneSignalWidgetAttributes(name: "OneSignal Dev App Live Activity")
        let contentState = OneSignalWidgetAttributes.ContentState(value: 5)
        
        do {
            let activity = try Activity<OneSignalWidgetAttributes>.request(
                    attributes: attributes,
                    contentState: contentState,
                    pushType: .token)
            Task {
                for await data in activity.pushTokenUpdates {
                    let myToken = data.map {String(format: "%02x", $0)}.joined()
                    OneSignal.enterLiveActivity("my_activity_id", withToken: myToken)
                }
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
    }


}

