//
//  CoordinatorDelegate.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 27.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

protocol CoordinatorDelegate: class {
    func didFinish(from coordinator: Coordinator)
}

extension CoordinatorDelegate where Self: Coordinator {

    func didFinish(from coordinator: Coordinator) {
        remove(child: coordinator)
    }

}
