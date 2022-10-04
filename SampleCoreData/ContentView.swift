//
//  ContentView.swift
//  SampleCoreData
//
//  Created by mtanaka on 2022/10/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    /*
     被管理オブジェクトコンテキスト(ManagedObjectContext)は
     データの生成、保存、取得といったデータベース操作に必要な操作を行う為のオブジェクト
     */
    @Environment(\.managedObjectContext) private var viewContext
    /*
     @FetchRequestを使ってデータベースを検索し、対象データ群をitemsプロパティに格納
     sortDescriptorsで検索結果のソート条件（Itemテーブルのtimestamp属性が昇順）を指定
     animationで取得した検索結果の変更時に使用されるアニメーションタイプを.defaultに指定
     */
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
    
    @FetchRequest(entity: SampleCoreData.entity(), sortDescriptors: [NSSortDescriptor(key: "updatedAt", ascending: false)], animation: .default)
    
    private var fetchedMemoList: FetchedResults<SampleCoreData>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedMemoList) { memo in
                    VStack {
                        Text(memo.title ?? "")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                        HStack {
                            Text(memo.stringUpdatedAt)
                                .font(.caption)
                                .lineLimit(1)
                            Text(memo.content ?? "")
                                .font(.caption)
                                .lineLimit(1)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("メモ")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_PreviewProvider {
    
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
