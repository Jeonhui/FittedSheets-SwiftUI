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
    
    public func updateUIViewController(_ uiViewController: UIViewController,
                                       context: Context) {
        let controller = SheetHostingController(rootView: destination)
        let sheetController = SheetViewController(controller: controller,
                                                  options: configuration.options)
        controller.sheetController = sheetController
        
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
        guard !useInlineMode else {
            useInlineModePresentSheetController(sheetController, parent: viewController)
            return
        }
        if isPresented {
            viewController.present(sheetController, animated: animated)
        } else {
            viewController.presentedViewController?.dismiss(animated: animated)
        }
    }
    
    private func useInlineModePresentSheetController(_ sheetController: SheetViewController,
                                                     parent viewController: UIViewController) {
        guard !viewController.children.contains(where: { $0 is SheetViewController }) else {
            return
        }
        if isPresented {
            DispatchQueue.main.async {
                sheetController.animateIn(to: viewController.view,
                                          in: viewController)
            }
        } else {
            viewController.children.forEach { childViewController in
                guard let svc = childViewController as? SheetViewController else { return }
                DispatchQueue.main.async {
                    svc.animateOut()
                }
            }
        }
    }
}
