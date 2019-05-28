//
//  TopLevelUIUtility.swift
//  MVVM-CTests
//
//  Created by Alp Avanoglu on 28.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import UIKit
import XCTest

class TopLevelUIUtility<T: UIViewController> {

    private var rootWindow: UIWindow!

    /// Should be call to setup the view controller.
    func setupTopLevelUI(withViewController viewController: T) {
        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewController
        _ = viewController.view
        viewController.viewWillAppear(false)
        viewController.viewDidAppear(false)
    }

    /// Should be called in `tearDown` to call appropriate
    /// dismiss functions for the view controller.
    func tearDownTopLevelUI() {
        guard let rootWindow = rootWindow,
            let rootViewController = rootWindow.rootViewController as? T else {
                XCTFail("tearDownTopLevelUI() was called without setupTopLevelUI() being called first")
                return
        }
        rootViewController.viewWillDisappear(false)
        rootViewController.viewDidDisappear(false)
        rootWindow.rootViewController = nil
        rootWindow.isHidden = true
        self.rootWindow = nil
    }
}
