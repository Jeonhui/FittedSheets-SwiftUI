//
//  SheetContentView.swift
//  FittedSheets-SwiftUI-Example
//
//  Created by 이전희 on 5/16/24.
//

import SwiftUI
import FittedSheets
import FittedSheetsSwiftUI

struct SheetContentView: View {
    @Binding var useContentHeightChange: Bool
    @State var isHigherHeightContentView: Bool = false
    
    init(_ useContentHeightChange: Binding<Bool>) {
        self._useContentHeightChange = useContentHeightChange
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Sheet Content View")
            
            if useContentHeightChange {
                Button {
                    isHigherHeightContentView.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Text("Content Height Change")
                        Spacer()
                    }
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
                    .padding()
                    .padding(.vertical, isHigherHeightContentView ? 40 : 0)
    
                }
            }
            HStack {
                Spacer()
            }
            .frame(height: 0)
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(4)
        .padding(8)
    }
}
