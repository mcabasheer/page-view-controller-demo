//
//  ViewController.swift
//  PageDemo
//
//  Created by Basheer on 23/8/17.
//  Copyright © 2017 Basheer. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    let colourArray = [UIColor.green, UIColor.blue, UIColor.yellow, UIColor.orange, UIColor.brown, UIColor.cyan]
    var pageIndex = 0
    var detailVC : UIViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([getViewController()], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Page View Data Source
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if self.pageIndex > 1 {
            self.pageIndex-=1
            return self.getViewController()
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if self.pageIndex < self.colourArray.count-1 {
            self.pageIndex+=1
            return self.getViewController()
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return colourArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pageIndex
    }
    
    func getViewController() -> UIViewController {

        detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC")
        detailVC?.view.backgroundColor = self.colourArray[pageIndex]
        
        return detailVC
    }


}

