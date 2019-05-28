//
//  OnboardingViewModelTests.swift
//  MVVM-CTests
//
//  Created by Alp Avanoglu on 28.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import XCTest
@testable import MVVM_C

final class OnboardingViewModelTests: XCTestCase {

    private var viewModel: OnboardingViewModel!
    private var viewDelegate: OnboardingViewDelegateMock!
    private var coordinatorDelegate: OnboardingCoordinatorDelegateMock!

    override func setUp() {
        super.setUp()
        viewModel = OnboardingViewModel()
        viewDelegate = OnboardingViewDelegateMock()
        coordinatorDelegate = OnboardingCoordinatorDelegateMock()

        viewModel.viewDelegate = viewDelegate
        viewModel.coordinatorDelegate = coordinatorDelegate
    }

    func testNextStepEventValidStep() {
        viewModel.nextStepEvent()
        XCTAssertEqual(viewDelegate.text, "2/4")
    }

    func testNextStepReachesLastStep() {
        viewModel.nextStepEvent()
        viewModel.nextStepEvent()
        viewModel.nextStepEvent()
        XCTAssertEqual(viewDelegate.text, "4/4")
    }

    func testNextStepOnLastStep() {
        viewModel.nextStepEvent()
        viewModel.nextStepEvent()
        viewModel.nextStepEvent()
        viewModel.nextStepEvent()
        XCTAssertEqual(coordinatorDelegate.status, "routeToHome()")
    }

    func testIfDoneTriggersCoordinatorFinish() {
        viewModel.done()
        XCTAssertEqual(coordinatorDelegate.status, "finish()")
    }

}

private class OnboardingViewDelegateMock: OnboardingViewDelegate {

    var text = ""

    func updateStep(with text: String) {
        self.text = text
    }

}

private class OnboardingCoordinatorDelegateMock: OnboardingCoordinatorDelegate {

    var status = ""

    func routeToHome() {
        status = #function
    }

    func start() {
        status = #function
    }

    func finish() {
        status = #function
    }


}
