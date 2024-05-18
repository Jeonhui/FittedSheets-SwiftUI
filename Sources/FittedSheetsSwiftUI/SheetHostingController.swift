//
//  SheetHostingController.swift
//
//
//  Created by 이전희 on 5/18/24.
//

import SwiftUI
import FittedSheets

class SheetHostingController<Content> : UIHostingController<Content> where Content : View {
    weak var sheetController: SheetViewController?
    private lazy var intrinsicContentHeight: CGFloat = self.view.intrinsicContentSize.height
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentHeightChange()
    }
    
    private func contentHeightChange() {
        let newIntrinsicContentHeight = self.view.intrinsicContentSize.height
        if intrinsicContentHeight != newIntrinsicContentHeight {
            self.intrinsicContentHeight = newIntrinsicContentHeight
            DispatchQueue.main.async {
                self.sheetController?.updateIntrinsicHeight()
            }
        }
    }
}
