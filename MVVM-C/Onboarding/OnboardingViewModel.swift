//
//  OnboardingViewModel.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import Foundation

final class OnboardingViewModel: OnboardingViewModelProtocol {

    private enum Constants {
        static let maximumStepCount = 4
    }

    weak var viewDelegate: OnboardingViewDelegate?
    weak var coordinatorDelegate: OnboardingCoordinatorDelegate?

    private var stepCount = 1

    func viewLoaded() {
        notifyDelegateForUpdateStep()
    }

    func nextStepEvent() {
        guard stepCount < Constants.maximumStepCount else {
            coordinatorDelegate?.routeToHome()
            return
        }

        stepCount += 1
        notifyDelegateForUpdateStep()
    }

    func done() {
        coordinatorDelegate?.finish()
    }

}

// MARK: - Helpers
private extension OnboardingViewModel {

    func notifyDelegateForUpdateStep() {
        viewDelegate?.updateStep(
            with: String(stepCount) + "/" + String(Constants.maximumStepCount)
        )
    }

}
