//
//  OnboardingContract.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import Foundation

// MARK: - View

protocol OnboardingViewDelegate: class {
    func updateStep(with text: String)
}

protocol OnboardingViewProtocol: OnboardingViewDelegate {
    var viewModel: OnboardingViewModelProtocol! { get set }
}

// MARK: - ViewModel

protocol OnboardingViewModelProtocol: ViewModel {

    var viewDelegate: OnboardingViewDelegate? { get set }
    var coordinatorDelegate: OnboardingCoordinatorDelegate? { get set }

    func viewLoaded()
    func nextStepEvent()

}

// MARK: - Coordinator

protocol OnboardingCoordinatorDelegate: Routable {
    func routeToHome()
}
