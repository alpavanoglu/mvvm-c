//
//  HomeContract.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

// MARK: - View

protocol HomeViewDelegate: class {

}

protocol HomeViewProtocol {

}

// MARK: - ViewModel

protocol HomeViewModelProtocol: ViewModel {

    var viewDelegate: HomeViewDelegate? { get set }
    var coordinatorDelegate: HomeCoordinatorDelegate? { get set }

}

// MARK: - Coordinator

protocol HomeCoordinatorDelegate: Routable {

}
