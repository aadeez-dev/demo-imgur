//
//  Imgur_DemoTests.swift
//  Imgur DemoTests
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import XCTest
@testable import Imgur_Demo

final class Imgur_DemoTests: XCTestCase {


    func testApiResponse() throws {
        let exp = expectation(description: "wait for api response")
        var imagesResponse: GalleryResponse? = nil
        NetworkManager.shared.getAllImages(query: "cats", page: 1){
            response in
           imagesResponse = response
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10){
            error in
            XCTAssertNotNil(imagesResponse)
        }
       
    }
    
    func testApiBlankQueryResponse() throws {
        let exp = expectation(description: "wait for api response")
        var imagesResponse: GalleryResponse? = nil
        NetworkManager.shared.getAllImages(query: "", page: 1){
            response in
           imagesResponse = response
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10){
            error in
            XCTAssertEqual(imagesResponse?.data?.isEmpty, true)
        }
       
    }

}
