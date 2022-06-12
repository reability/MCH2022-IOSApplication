//
//  MainViewController.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit


final class MainViewController: UIPageViewController {
    var pages: [UIViewController] = [
        MasterViewController(),
        MapViewController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = nil
        
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }
    
}

extension MainViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else { return pages.last }

        guard pages.count > previousIndex else { return nil }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

        guard nextIndex < pages.count else { return pages.first }

        guard pages.count > nextIndex else { return nil }

        return pages[nextIndex]
    }
}
