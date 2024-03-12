//
//  FittedSheetPresenter.swift
//
//
//  Created by 이전희 on 2023/08/17.
//

import SwiftUI
import FittedSheets

public struct FittedSheetPresenter<SheetView: View>: UIViewControllerRepresentable {
    @Binding private var isPresented: Bool
    private var destination: SheetView
    let configuration: SheetConfiguration
    let animated: Bool
    private var parent: UIViewController
    private(set) var sheetViewController: SheetViewController? = nil
    
    init(_ parent: some View,
         isPresented: Binding<Bool>,
         configuration: SheetConfiguration,
         destination: SheetView,
         animated: Bool) {
        self.parent = UIHostingController(rootView: parent)
        self._isPresented = isPresented
        self.configuration = configuration
        self.destination = destination
        self.animated = animated
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let controller = UIHostingController(rootView: destination)
        let sheetController = SheetViewController(controller: controller,
                                                  options: configuration.options)
        sheetController.view.clipsToBounds = true
        
        sheetController.setSizes(configuration.sizes, animated: true)
        sheetController.sheetViewControllerOptionsSetting(configuration.sheetViewControllerOptions)
        
        sheetController.shouldDismiss = { sheetViewController in
            configuration.shouldDismiss?(sheetViewController)
            return true
        }
        
        sheetController.didDismiss = { sheetViewController in
            configuration.didDismiss?(sheetViewController)
            isPresented = false
        }
        presentSheetController(sheetController,
                               parent: uiViewController,
                               useInlineMode: configuration.options?.useInlineMode ?? false)
    }
    
    private func presentSheetController(_ sheetController: SheetViewController,
                                        parent viewController: UIViewController,
                                        useInlineMode: Bool) {
        if useInlineMode {
            if isPresented {
                sheetController.allowGestureThroughOverlay = true
                sheetController.animateIn(to: viewController.view,
                                          in: viewController)
            }
        } else {
            if isPresented {
                viewController.present(sheetController, animated: animated)
            } else {
                viewController.presentedViewController?.dismiss(animated: animated)
            }
        }
    }
}
