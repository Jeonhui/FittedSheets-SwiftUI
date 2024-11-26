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
        
        return ZStack {
            self
            Color.clear
                .background(fittedSheetPresenter)
                .zIndex(isPresented.wrappedValue ? 1 : -1)
        }
    }
    
    func fittedSheet<SheetView: View>(isPresented: Binding<Bool>,
                                      sizes: [SheetSize] = [.intrinsic],
                                      useInlineMode: Bool = false,
                                      @ViewBuilder sheetView: @escaping () -> SheetView,
                                      animated: Bool = true,
                                      shouldDismiss: ((SheetViewController) -> Void)? = nil,
                                      didDismiss: ((SheetViewController) -> Void)? = nil) -> some View {
        let configuration = SheetConfiguration(sizes: sizes,
                                               options: .init(useInlineMode: useInlineMode),
                                               sheetViewControllerOptinos: [],
                                               shouldDismiss: shouldDismiss,
                                               didDismiss: didDismiss)
        
        return fittedSheet(isPresented: isPresented,
                           configuration: configuration,
                           sheetView: sheetView,
                           animated: animated)
    }
}
