//
//  ReloadableTableView.swift
//  
//
//  Created by Cirno MainasuK on 2021-6-19.
//

import UIKit
import DifferenceKit

public protocol ReloadableTableView {
    func reload<C>(
        using stagedChangeset: StagedChangeset<C>,
        deleteSectionsAnimation: @autoclosure () -> UITableView.RowAnimation,
        insertSectionsAnimation: @autoclosure () -> UITableView.RowAnimation,
        reloadSectionsAnimation: @autoclosure () -> UITableView.RowAnimation,
        deleteRowsAnimation: @autoclosure () -> UITableView.RowAnimation,
        insertRowsAnimation: @autoclosure () -> UITableView.RowAnimation,
        reloadRowsAnimation: @autoclosure () -> UITableView.RowAnimation,
        interrupt: ((Changeset<C>) -> Bool)?,
        setData: (C) -> Void
    )
}

extension ReloadableTableView {
    public func reload<C>(
        using stagedChangeset: StagedChangeset<C>,
        with animation: @autoclosure () -> UITableView.RowAnimation,
        interrupt: ((Changeset<C>) -> Bool)? = nil,
        setData: (C) -> Void
    ) {
        reload(
            using: stagedChangeset,
            deleteSectionsAnimation: animation(),
            insertSectionsAnimation: animation(),
            reloadSectionsAnimation: animation(),
            deleteRowsAnimation: animation(),
            insertRowsAnimation: animation(),
            reloadRowsAnimation: animation(),
            interrupt: interrupt,
            setData: setData
        )
    }
}
