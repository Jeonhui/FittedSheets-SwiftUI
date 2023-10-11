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

    init(isPresented: Binding<Bool>,
         configuration: SheetConfiguration,
         destination: SheetView) {
        self._isPresented = isPresented
        self.configuration = configuration
        self.destination = destination
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let controller = UIHostingController(rootView: destination)
            let sheetController = SheetViewController(controller: controller)
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

            uiViewController.present(sheetController, animated: false)
        }else{
            uiViewController.presentedViewController?.dismiss(animated: true)
        }
    }
}
