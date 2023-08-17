//
//  SheetConfiguration.swift
//  
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FittedSheets

public struct SheetConfiguration {
    let sizes: [SheetSize]
    let options: SheetOptions?
    let sheetViewControllerOptions: [SheetViewControllerOptions]
    let shouldDismiss: ((SheetViewController) -> Void)?
    let didDismiss: ((SheetViewController) -> Void)?

    public init(sizes: [SheetSize] = [.intrinsic],
         options: SheetOptions? = nil,
         sheetViewControllerOptinos: [SheetViewControllerOptions] = [],
         shouldDismiss: ((SheetViewController) -> Void)? = nil,
         didDismiss: ((SheetViewController) -> Void)? = nil) {
        self.sizes = sizes
        self.options = options
        self.sheetViewControllerOptions = sheetViewControllerOptinos
        self.shouldDismiss = shouldDismiss
        self.didDismiss = didDismiss
    }
}

extension SheetConfiguration {
    public enum SheetViewControllerOptions {
        case gripSize(_ size: CGSize)
        case gripColor(_ color: Color)
        case cornerCurve(_ cornerCurve: CALayerCornerCurve)
        case cornerRadius(_ radius: CGFloat)
        case minimumSpaceAbovePullBar(_ value: CGFloat)
        case pullBarBackgroundColor(_ color: Color)
        case treatPullBarAsClear(_ bool: Bool)
        case dismissOnOverlayTap(_ bool: Bool)
        case dismissOnPull(_ bool: Bool)
        case allowPullingPastMaxHeight(_ bool: Bool)
        case autoAdjustToKeyboard(_ bool: Bool)
        case contentBackgroundColor(color: Color)
        case overlayColor(color: Color)
    }
}
