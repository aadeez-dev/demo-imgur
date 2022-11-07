//
//  ContentView.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import SwiftUI

struct GalleryView: View {
    
    
    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.isSearching) private var isSearching
    
    //Maintain the state of viewType, by default it's Listview
    @State private var isShowAsList: Bool = true
    @State private var searchQuery: String = ""
    @State private var isFectingData = false
    @State private var items: [GalleryData] = []
    
    
    private let viewModel = GalleryViewModel()
    
    //2 columns in  grid
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    if isShowAsList {
                        List{
                            autoreleasepool{
                                ForEach(items, id: \.self) { item in
                                    ListCellView(galleryItem: item)
                                        .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0))
                                }
                            }.listRowSeparator(.hidden)
                        }.listStyle(.inset)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 6.0){
                                autoreleasepool{
                                    ForEach(items, id: \.self) { item in
                                        GridCellView(galleryItem: item)
                                    }
                                }
                            }
                        }
                    }
                }
            }.navigationTitle("Imgur")
                .searchable(text: $searchQuery, placement: .toolbar)
                .onSubmit(of: .search){
                    //cache user last search query
                    viewModel.searchedValue = searchQuery
                    search(for: searchQuery)
                    dismissSearch()
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            withAnimation{
                                isShowAsList.toggle()
                            }
                        }) {
                            Image(systemName: isShowAsList ? "square.grid.2x2.fill" : "list.bullet")
                                .rotationEffect(isShowAsList ? .zero : .degrees(360))
                        }
                    }
                }
        }.overlay(
            Group {
                //show progress indicator while loading data
                if isFectingData && items.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    //show initial text
                    if items.isEmpty && !isFectingData {
                        BlankView()
                    }
                }
            }
        )
    }
    
    
    private func search(for value: String, loadMore: Bool = false) {
        isFectingData = true
        if !loadMore {
            items.removeAll()
        }
        viewModel.search(for: value){
            items in
            self.items.append(contentsOf: items)
            isFectingData = false
            self.dismissSearch()
        }
    }
}

struct CGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .preferredColorScheme(.dark)
    }
}


