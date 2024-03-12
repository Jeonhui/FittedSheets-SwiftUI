//
//  UIViewController+.swift
//
//
//  Created by 이전희 on 3/13/24.
//

import UIKit

public extension UIViewController {
    func ancestorViewController() -> UIViewController? {
        var ancestor = self.parent
        print("x")
        while let parent = parent?.parent {
            print("y")
            ancestor = parent}
        return ancestor
    }
}
