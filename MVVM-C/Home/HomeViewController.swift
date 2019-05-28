//
//  HomeViewController.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, HomeViewProtocol {

    var viewModel: HomeViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent {
            viewModel.done()
        }
    }

}
