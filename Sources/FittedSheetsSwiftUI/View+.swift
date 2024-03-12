//
//  View+.swift
//
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FittedSheets


public extension View {
    func fittedSheet<SheetView: View>(isPresented: Binding<Bool>,
                                      configuration: SheetConfiguration = .init(),
                                      @ViewBuilder sheetView: @escaping () -> SheetView,
                                      animated: Bool = true) -> some View {
        let fittedSheetPresenter = FittedSheetPresenter(self,
                                                        isPresented: isPresented,
                                                        configuration: configuration,
                                                        destination: sheetView(),
                                                        animated: animated)
        return self.background(fittedSheetPresenter)
    }
}
