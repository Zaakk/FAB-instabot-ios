//
//  AppDelegate.swift
//  FAB
//
//  Created by Alexander Zakatnov on 09/10/2017.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import UIKit
import Instabot

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var transition:TransitionController = TransitionController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadInstabot(notification:)), name: NSNotification.Name(rawValue: kFABTapEventName), object: nil)
        
        return true
    }
    
    @objc private func loadInstabot(notification:Notification) {
        let btn = notification.object as! FAButton
        btn.buttonState = .loading
        Instabot.shared().setAPIKey("weNVx82HThJ4OO7arNtbUfeahnM8bWMsQhm+jfzwH6o=", forURL: "rmsws.qa.rokolabs.com/external/v1/")
        Instabot.shared().loadConversation(withId: 68050478) { [unowned self] (controller:IBConversationViewController?, error:Error?) in
            guard let vc = controller else {
                print(error.debugDescription)
                return
            }
            btn.buttonState = .normal
            self.show(viewController: vc, from: btn)
        }
    }
    
    func show(viewController vc:UIViewController, from view:UIView) {
        transition.fromView = view
        vc.transitioningDelegate = transition
        vc.modalPresentationStyle = .custom
        
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.present(vc, animated: true, completion: nil)
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

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

