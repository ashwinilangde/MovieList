//
//  MoviesViewControllerTests.swift
//  moviesListTests
//
//  Created by Sagar Gawande on 31/12/20.
//

import XCTest
@testable import moviesList

class MoviesViewControllerTests: XCTestCase {
    var tableView: UITableView!

    func testControllerHasTableView() {
        let controller = MoviesViewController.instantiate()
        tableView = controller.tableView
        controller.loadViewIfNeeded()

        XCTAssertNotNil(controller.tableView,
                        "Controller should have a tableview")
    }
    
    func testTableViewHasCells() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell")

            XCTAssertNotNil(cell,
                            "TableView should be able to dequeue cell with identifier: 'Cell'")
        }

}
