//
//  AddMemoView.swift
//  SampleCoreData
//
//  Created by mtanaka on 2022/10/04.
//

import SwiftUI

struct AddMemoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .font(.title)
            TextEditor(text: $content)
                .font(.body)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { addMemo() }) {
                    Text("保存")
                }
            }
        }
    }
    // 保存ボタン処理
    private func addMemo() {
        let memo = SampleCoreData(context: viewContext)
        memo.title = title
        memo.content = content
        memo.createdAt = Date()
        memo.updatedAt = Date()
        // 生成したインスタンスをCoreDataに保存
        try? viewContext.save()
        
        presentation.wrappedValue.dismiss()
    }
}

struct AddMemoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoView()
    }
}
