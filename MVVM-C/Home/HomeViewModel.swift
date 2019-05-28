//
//  HomeViewModel.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {

    weak var viewDelegate: HomeViewDelegate?
    weak var coordinatorDelegate: HomeCoordinatorDelegate?

    func done() {
        coordinatorDelegate?.finish()
    }

}
