//
//  BaseCoordinator.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import Foundation

typealias Coordinator = BaseCoordinator & Routable & CoordinatorDelegate

class BaseCoordinator {

    weak var delegate: CoordinatorDelegate?

    private(set) var childCoordinators: [BaseCoordinator] = []

    func add(child coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
    }

    func remove(child coordinator: BaseCoordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }

    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }

    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }

}

// MARK: - Equatable
extension BaseCoordinator: Equatable {

    static func == (lhs: BaseCoordinator, rhs: BaseCoordinator) -> Bool {
        return lhs === rhs
    }

}
