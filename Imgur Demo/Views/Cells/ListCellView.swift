//
//  ListCellView.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import SwiftUI
import Kingfisher

struct ListCellView: View {
    
    var galleryItem: GalleryData
    
    private let rowHeight = 100.0
    
    var body: some View {
        ZStack {
            
            HStack(alignment: .top,spacing: 8.0){
                KFImage(URL(string: galleryItem.images?.first?.link ?? galleryItem.link))
                    .resizable()
                    .frame(width: rowHeight, height: rowHeight)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(galleryItem.title.capitalized)
                        .font(.system(size: 18))
                        .lineLimit(1)
                        .padding(.top, 4)
                    
                    Group {
                        
                        if let imageCount = galleryItem.totalImages {
                            if imageCount > 1 {
                                HStack(alignment: .center, spacing: 2.0) {
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(.blue)
                                        .tint(.blue)
                                    Text("+\(imageCount)")
                                        .font(.caption2)
                                        .foregroundColor(.blue)
                                }.frame(height: 15)
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text(DateUtils.formatDateFrom(milisecond: galleryItem.datetime) ?? "")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding([.bottom, .trailing], 4)
                    }
                }.frame(height: rowHeight)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                
            }
            .background(RoundedRectangle(cornerRadius: 8.0)
                .fill(Color("color-cell-background"))
                .shadow(radius: 05, x: 2, y: 2))
            .cornerRadius(8.0)
            
        }.padding(.all)
            .frame(minWidth: 80, maxWidth: .infinity,
                   minHeight: 100, maxHeight: 101)
    }
    
    
    private func formatDateFrom(milisecond: Int) -> String? {
        let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm a"
        return dateFormatter.string(from: dateVar)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(galleryItem: GalleryData(id: "", title: "Main", description: "", datetime: 1111111, link: "", section: "", totalImages: 2, images: []))
    }
}
