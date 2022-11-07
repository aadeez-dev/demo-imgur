//
//  GridCellView.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import SwiftUI
import Kingfisher

struct GridCellView: View {
    
    var galleryItem: GalleryData
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack(alignment: .leading){
                Text(galleryItem.title.capitalized)
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .padding([.top, .leading], 8)
                ZStack(alignment: .bottomTrailing) {
                    KFImage(URL(string: galleryItem.images?.first?.link ?? galleryItem.link))
                        .resizable()
                       
                    if let imageCount = galleryItem.totalImages {
                        if imageCount > 1 {
                            HStack(spacing: 2) {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.blue)
                                    
                                Text("+\(imageCount - 1)")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            } .padding([.trailing, .bottom], 2)
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    
                    Text(DateUtils.formatDateFrom(milisecond: galleryItem.datetime) ?? "")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding([.bottom, .trailing], 4)
                }
               
            }
            .background(RoundedRectangle(cornerRadius: 8.0)
                .fill(Color("color-cell-background"))
                      .shadow(radius: 05, x: 2, y: 2))
            .cornerRadius(8.0)
            
            //strokeBorder(Color("color-cell-background"), lineWidth: 0.5)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
            .padding(.all)

    }
}

struct GridCellView_Previews: PreviewProvider {
    static var previews: some View {
        GridCellView(galleryItem: GalleryData(id: "", title: "Main", description: "", datetime: 1111111, link: "", section: "", totalImages: 2, images: []))
    }
}
