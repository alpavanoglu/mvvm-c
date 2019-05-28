//
//  OnboardingCoordinatorTests.swift
//  MVVM-CTests
//
//  Created by Alp Avanoglu on 28.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import XCTest
@testable import MVVM_C

final class OnboardingCoordinatorTests: XCTestCase {

    private var coordinator: OnboardingCoordinator!
    private var rootViewController: UINavigationController = UIApplication.shared.keyWindow!.rootViewController! as! UINavigationController

    override func setUp() {
        super.setUp()

        coordinator = OnboardingCoordinator(
            rootNavigationController:
            rootViewController
        )
    }

    func testStartPushesToNavigationController() {
        coordinator.start()
        XCTAssert(rootViewController.viewControllers.last!.self is OnboardingViewController)
    }

    func testRouteToHomeChildAdded() {
        coordinator.routeToHome()
        XCTAssert(coordinator.childCoordinators.first!.self is HomeCoordinator)
        XCTAssertEqual(coordinator.childCoordinators.count, 1)
    }

    func testFinishDeallocatesCoordinator() {
        coordinator.routeToHome()
        (coordinator.childCoordinators.first! as! HomeCoordinator).finish()
        XCTAssert(coordinator.childCoordinators.isEmpty)
    }

}
