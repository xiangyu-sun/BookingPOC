//
//  RouteTypeContainerViewController.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 22/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import UIKit

fileprivate func instantiatePage(_ name: String) -> UIViewController {
    return UIStoryboard(name: "SelectRoutePages", bundle: nil).instantiateViewController(withIdentifier: name)
}

class RouteTypeContainerViewController : UIPageViewController {
    lazy var pages: [UIViewController] = [
        instantiatePage("pageReturnFlight"),
        instantiatePage("pageSingleFlight"),
        instantiatePage("pageMultiFlight")
    ]
    
    override func viewDidLoad() {
        self.dataSource = self
        setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
    }
}

extension RouteTypeContainerViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.index(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard pages.count > index else {
            return nil
        }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.index(of: viewController) else {
            return nil
        }
        let nextIndex = index + 1
        guard pages.count != nextIndex else {
            return nil
        }
        guard pages.count > nextIndex else {
            return nil
        }
        return pages[nextIndex]
    }
}
