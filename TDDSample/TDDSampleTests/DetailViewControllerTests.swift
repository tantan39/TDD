//
//  DetailViewControllerTests.swift
//  TDDSampleTests
//
//  Created by Tan Tan on 5/4/21.
//

import XCTest
@testable import TDDSample

class DetailViewControllerTests: XCTestCase {
    
    func testDetailImageViewExits() {
        //given
        let sut = DetailViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView() {
        //given
        let sut = DetailViewController()
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.view, sut.imageView)
        
    }
    
    func testDetailLoadImage() {
        //given
        let fileNameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: fileNameToTest, in: .main, with: nil)
        let sut = DetailViewController()
        sut.selectedImage = fileNameToTest
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
        
    }
    
    
    
}
