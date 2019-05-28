//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {

    private lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()

    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        let onboardingCoordinator = OnboardingCoordinator(rootNavigationController: rootViewController)
        add(child: onboardingCoordinator)
        onboardingCoordinator.start()

    }

    func finish() {

    }

}
