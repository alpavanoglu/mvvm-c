//
//  Routable.swift
//  MVVM-C
//
//  Created by Alp Avanoglu on 24.05.19.
//  Copyright © 2019 Alp Avanoglu. All rights reserved.
//

protocol Routable: class {
    func start()
    func finish()
}

extension Routable where Self: Coordinator {

    func finish() {
        delegate?.didFinish(from: self)
    }

}
