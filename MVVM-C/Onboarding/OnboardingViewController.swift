//
//  OnboardingViewController.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

import Foundation
import UIKit

final class OnboardingViewController: UIViewController, OnboardingViewProtocol {

    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var stepLabel: UILabel!

    var viewModel: OnboardingViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Move to coordinator
        assert(viewModel != nil, "ViewModel is not initialized.")
        title = "Onboarding"
        viewModel.viewLoaded()
    }

    @IBAction private func didTapButton() {
        viewModel.nextStepEvent()
    }

    func updateStep(with text: String) {
        stepLabel.text = text
    }

}
