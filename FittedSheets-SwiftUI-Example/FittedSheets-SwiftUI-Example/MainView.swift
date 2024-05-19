//
//  MainView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct MainView: View {
    private let sheetSizes: [SheetSize] = SheetSize.allCases
    @State private var selectedSheetSizeDict: [SheetSize: Bool] = [.intrinsic: true]
    @State var useInlineMode: Bool = false
    @State var useContentHeightChange: Bool = false
    
    private var sheetConfiguration: SheetConfiguration {
        let selectedSheetSize = Array(selectedSheetSizeDict.filter { $0.value }.keys)
        return SheetConfiguration(sizes: selectedSheetSize,
                                  options: .init(useInlineMode: useInlineMode))
    }
    
    @State var showFittedSheet: Bool = false
    @State var showFittedSheetWithInlineMode: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    defaultList
                    sizeList
                    optionList
                    etcList
                }
                .animation(.linear(duration: 0.2), value: useInlineMode)
                showSheetView
            }
            .selectionDisabled(false)
            .navigationTitle("Example")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
            .background(.blue)
        }
        .fittedSheet(isPresented: $showFittedSheet,
                     configuration: sheetConfiguration) {
            SheetContentView($useContentHeightChange)
        }
    }
    
    private var defaultList: some View {
        Section(header: Text("Code Example")) { 
            NavigationLink {
                SimpleSettingExampleView()
            } label: {
                Text("Simple Settings Example")
            }
            NavigationLink {
                DetailSettingExampleView()
            } label: {
                Text("Detail Settings Example")
            }
        }
    }
    
    private var sizeList: some View {
        Section(header: Text("Size")) {
            ForEach(sheetSizes, id: \.description) { size in
                selectButton(text: size.description,
                             action: {
                    guard !(showFittedSheet || showFittedSheetWithInlineMode) else { return }
                    if !(selectedSheetSizeDict[size] ?? false) {
                        selectedSheetSizeDict[size] = true
                    } else if selectedSheetSizeDict.keys.count > 1 {
                        selectedSheetSizeDict[size] = nil
                    }
                },
                             checked: selectedSheetSizeDict[size] ?? false)
            }
        }
    }
    
    private var optionList: some View {
        Section(header: Text("Option")) {
            selectButton(text: "Use Inline Mode",
                         action: {
                if useInlineMode {
                    showFittedSheetWithInlineMode = false
                }
                useInlineMode.toggle()
            },
                         checked: useInlineMode)
            if useInlineMode {
                inlineView
                    .listRowInsets(.init())
            }
        }
    }
    
    private var etcList: some View {
        Section(header: Text("Etc")) {
            selectButton(text: "Content Height Change",
                         action: {
                useContentHeightChange.toggle()
            },
                         checked: useContentHeightChange)
        }
    }
    
    private var inlineView: some View {
        VStack(alignment: .center) {
            HStack{
                Spacer()
                Text("Inline View")
                    .foregroundColor(Color.gray.opacity(0.8))
                Spacer()
            }
        }
        .frame(height: 300)
        .background(Color.gray.opacity(0.4))
        .fittedSheet(isPresented: $showFittedSheetWithInlineMode,
                     configuration: sheetConfiguration) {
            SheetContentView($useContentHeightChange)
        }
    }
    
    private func selectButton(text: String,
                              action: @escaping (()->Void),
                              checked: Bool) -> some View {
        Button {
            action()
        } label: {
            HStack(spacing: 4) {
                if checked {
                    Text("✓")
                }
                Text(text)
                Spacer()
            }
            .padding(.vertical, 6)
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.linear(duration: 0.2), value: checked)
    }
    
    private var showSheetView: some View {
        VStack {
            Button {
                if useInlineMode {
                    showFittedSheetWithInlineMode.toggle()
                } else {
                    showFittedSheet.toggle()
                }
            } label: {
                HStack{
                    Spacer()
                    Text("show sheet")
                    Spacer()
                }
                .fontWeight(.bold)
                .padding(.vertical)
                .foregroundColor(.white)
                .background(.cyan)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
                .padding()
            }
            .buttonStyle(DefaultButtonStyle())
        }
        .padding(.bottom, 40)
        .background(Color.white.shadow(color: .gray.opacity(0.4), radius: 8, y: -2))
    }
}

#Preview {
    MainView()
}
