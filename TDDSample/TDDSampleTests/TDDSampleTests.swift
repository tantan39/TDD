//
//  TDDSampleTests.swift
//  TDDSampleTests
//
//  Created by Tan Tan on 5/4/21.
//

import XCTest
@testable import TDDSample

class TDDSampleTests: XCTestCase {

    func testLoadImages() {
        //given
        let viewController = ViewController()
        
        // when
        viewController.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(viewController.pictures.count, 10, "That should be 10 pictures.")
    }
    
    func testTableViewExits() {
        //given
        let sub = ViewController()
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(sub.tableView)
        
    }
    
    func testTableViewHasCorrectRowCount() {
        //given
        let sub = ViewController()
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        let rowCount = sub.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(rowCount, sub.pictures.count)
        
    }
    
    func testEachCellHasCorrectText() {
        //given
        let sub = ViewController()
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        for (index, picture) in sub.pictures.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sub.tableView(sub.tableView, cellForRowAt: indexPath)
            
            XCTAssertEqual(cell.textLabel?.text, picture)
            
        }
    }
    
    func testCellHasDisclosureIndicator() {
        //given
        let sub = ViewController()
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        for index in sub.pictures.indices {
            let cell = sub.tableView(sub.tableView, cellForRowAt: IndexPath(item: index, section: 0))
            
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
        
    }
    
    func testViewControllerUserLargeTitle() {
        //given
        let sub = ViewController()
        _ = UINavigationController(rootViewController: sub)
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        XCTAssertTrue(sub.navigationController?.navigationBar.prefersLargeTitles ?? false)
        
    }
    
    func testNavigationBarHasCorrectStormViewerTitle() {
        //given
        let sub = ViewController()
        _ = UINavigationController(rootViewController: sub)
        
        //when
        sub.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(sub.navigationItem.title, "Storm Viewer")
    }
    
    func testSelectingImageShowDetail() {
        //given
        let sut = ViewController()
//        let navigation = UINavigationController(rootViewController: sut)
        var selectingImage: String?
        
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        //when
        sut.pictureSelection = {
            selectingImage = $0
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        //create an expectation...
//        let expectation = XCTestExpectation(description: "Select a table view cell")
        //...then fullfill it asynchronously
//        DispatchQueue.main.async {
//            expectation.fulfill()
//        }
//
//        //then
//        wait(for: [expectation], timeout: 1)
//        XCTAssertTrue(navigation.topViewController is DetailViewController)
        
        XCTAssertEqual(selectingImage, "nssl0049.jpg")
    }
    
    func testSelectingImageShowDetailImage() {
        //given
        let sut = ViewController()
//        let navigation = UINavigationController(rootViewController: sut)
        let testIndexPath = IndexPath(row: 0, section: 0)
        let fileNameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: fileNameToTest, in: .main, compatibleWith: nil)
        
        //when
        sut.pictureSelection = {
            let detailVC = DetailViewController()
            detailVC.selectedImage = $0
            detailVC.loadViewIfNeeded()
            XCTAssertEqual(detailVC.imageView.image, imageToLoad)
        }
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
//        let expectation = XCTestExpectation(description: "Select a table view cell")
//        DispatchQueue.main.async {
//            expectation.fulfill()
//        }
//
//        //then
//        wait(for: [expectation], timeout: 1)
        
//        guard let detailVC = navigation.topViewController as? DetailViewController else {
//            XCTFail("Didn't push to detail view controller")
//            return
//        }
//
//        detailVC.loadViewIfNeeded()
//
//        XCTAssertEqual(detailVC.imageView.image, imageToLoad)
    }
}
