//
//  OnboardingCoordinator.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinator {

    private let rootNavigationController: UINavigationController

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        viewController.viewModel = configuredOnboardingViewModel(using: viewController)
        rootNavigationController.pushViewController(viewController, animated: true)
    }

}

// MARK: - OnboardingCoordinatorDelegate
extension OnboardingCoordinator: OnboardingCoordinatorDelegate {

    func routeToHome() {
        let homeCoordinator = HomeCoordinator(navigationViewController: rootNavigationController)
        add(child: homeCoordinator)
        homeCoordinator.delegate = self
        homeCoordinator.start()
    }

}

// MARK: - Helpers
private extension OnboardingCoordinator {

    func configuredOnboardingViewModel(
        using view: OnboardingViewProtocol
        ) -> OnboardingViewModel {

        let viewModel = OnboardingViewModel()
        viewModel.viewDelegate = view
        viewModel.coordinatorDelegate = self
        return viewModel
    }

}
