//
//  SheetViewController+.swift
//  
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FittedSheets

public extension SheetViewController {
    func sheetViewControllerOptionsSetting(_ sheetViewControllerOptions: [SheetConfiguration.SheetViewControllerOptions]) {
        sheetViewControllerOptions
            .forEach { config in
            switch config {
            case let .gripSize(size):
                self.gripSize = size
            case let .gripColor(color):
                self.gripColor = color.uiColor()
            case let .cornerCurve(cornerCurve):
                self.cornerCurve = cornerCurve
            case let .cornerRadius(radius):
                self.cornerRadius = radius
            case let .minimumSpaceAbovePullBar(value):
                self.minimumSpaceAbovePullBar = value
            case let .pullBarBackgroundColor(color):
                self.pullBarBackgroundColor = color.uiColor()
            case let .treatPullBarAsClear(bool):
                self.treatPullBarAsClear = bool
            case let .dismissOnOverlayTap(bool):
                self.dismissOnOverlayTap = bool
            case let .dismissOnPull(bool):
                self.dismissOnPull = bool
            case let .allowPullingPastMaxHeight(bool):
                self.allowPullingPastMaxHeight = bool
            case let .autoAdjustToKeyboard(bool):
                self.autoAdjustToKeyboard = bool
            case let .contentBackgroundColor(color):
                self.contentBackgroundColor = color.uiColor()
            case let .overlayColor(color):
                self.overlayColor = color.uiColor()
            }
        }
    }
}
