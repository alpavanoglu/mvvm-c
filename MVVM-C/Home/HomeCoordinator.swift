//
//  HomeCoordinator.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {

    private let navigationViewController: UINavigationController

    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let viewModel = HomeViewModel()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        navigationViewController.pushViewController(viewController, animated: true)
    }

}

// MARK: - HomeCoordinatorDelegate
extension HomeCoordinator: HomeCoordinatorDelegate {

}
