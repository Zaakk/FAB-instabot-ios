//
//  AppDelegate.swift
//  FAB
//
//  Created by Alexander Zakatnov on 09/10/2017.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import UIKit
import Instabot

let conversationId = 68050478

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var transition:TransitionController = TransitionController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		Instabot.start()
		
		// Move move link to app to plist and remove the next line
		Instabot.shared().setAPIKey("weNVx82HThJ4OO7arNtbUfeahnM8bWMsQhm+jfzwH6o=", forURL: "rmsws.qa.rokolabs.com/external/v1/")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadInstabot(notification:)), name: NSNotification.Name(rawValue: kFABTapEventName), object: nil)
        
        return true
    }
    
    @objc private func loadInstabot(notification:Notification) {
		guard let btn = notification.object as? FAButton else {
			return
		}
        btn.buttonState = .loading
        Instabot.shared().loadConversation(withId: conversationId) { [unowned self] (controller:IBConversationViewController?, error:Error?) in
			btn.buttonState = .normal
			guard let vc = controller else {
                print(error.debugDescription)
                return
            }
            self.show(viewController: vc, from: btn)
        }
    }
    
    func show(viewController vc:UIViewController, from view:UIView) {
        transition.fromView = view
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .custom
        
        let navigationViewController = window!.rootViewController as! UINavigationController
        navigationViewController.topViewController!.present(vc, animated: true, completion: nil)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

