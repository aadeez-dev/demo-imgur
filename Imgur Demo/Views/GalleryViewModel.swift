//
//  GalleryViewModel.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import Foundation

class GalleryViewModel{
    
    private var page: Int = 1
    private let dispatchSemaphore = DispatchSemaphore(value: 1) //request 1 api at call at a time
    public var searchedValue = ""
    
    
    func search(for value: String, onComplete: @escaping ([GalleryData]) -> Void) {
        dispatchSemaphore.wait()
        NetworkManager.shared.getAllImages(query: value.lowercased(), page: page){
            response in
            if let data = response?.data {
               onComplete(data)
            } else {
                onComplete([])
            }
            self.dispatchSemaphore.signal()
        }
    }
    
}
