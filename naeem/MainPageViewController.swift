//
//  MainPageViewController.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import UIKit

class MainPageViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    private var currentIndex = 0
    private var arrPagesControllers = [UIViewController]()
    private var pageControl = UIPageControl()
    private var btnNext = UIButton()
    private var btnStart = UIButton()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        delegate = self
        dataSource = self
        
        setupOnboardingPages()
        setupPageControl()
        setupButtons()

        
    }
    
    
    // initilize the view controllers and add them to the array
    private func setupOnboardingPages(){
        // check and create object from storyboard view controller and add it to the array
        if let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC") {
            arrPagesControllers.append(firstVC)
        }
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
            arrPagesControllers.append(secondVC)
        }
        if let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC") {
            arrPagesControllers.append(thirdVC)
        }
     
        // set the visible page/view controller to user
        if let visiblePage = arrPagesControllers.first {
            setViewControllers([visiblePage], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // initialize the page control and it's number of pages, current page and colors attributes
    private func setupPageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 110, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = arrPagesControllers.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8802388509, green: 0.8802388509, blue: 0.8802388509, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    

  
    // setup next, skip and start journey buttons and their actions
    private func setupButtons (){
        btnNext = UIButton(frame: CGRect(x: view.frame.width - 120, y: view.frame.height - 100, width: 100, height: 30))
        btnNext.setTitle("التالي", for: .normal)
        btnNext.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        // we will use tinted button if user have ios 15, otherwise we will customize the button to be like tinted button
        if #available(iOS 15.0, *) {
            btnNext.configuration = .tinted()
            btnNext.setTitleColor(UIColor.green, for: .normal)
            btnNext.tintColor = UIColor.green
        } else {
            btnNext.backgroundColor = UIColor.gray
            btnNext.setTitleColor(.white, for: .normal)
            btnNext.layer.cornerRadius = 6
        }
        
        btnStart = UIButton(frame: CGRect(x: (view.frame.width / 2) - 70, y: view.frame.height - 100, width: 140, height: 30))
        btnStart.setTitle("ابدأ", for: .normal)
        btnStart.addTarget(self, action: #selector(startJourney), for: .touchUpInside)
        if #available(iOS 15.0, *) {
            btnStart.configuration = .tinted()
            btnStart.setTitleColor(UIColor.red, for: .normal)
            btnStart.tintColor = UIColor.red
        } else {
            btnStart.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
            btnStart.setTitleColor(.white, for: .normal)
            btnStart.layer.cornerRadius = 6
        }
        
        
        self.view.addSubview(btnNext)
        self.view.addSubview(btnStart)
      
        // hide start button until thired ui being visible
        btnStart.isHidden = true
    }
    
    // this function will called when user click on the next button
    @objc func goToNext(sender: UIButton!) {
        // get current page index
        let currentPageIndex = self.pageControl.currentPage
        // get next page index
        let nextPageIndex = currentPageIndex + 1
        // check if the next page will be the last onboarding page because we want to hide next, skip buttons and page control at last page and show only start button
        if nextPageIndex == arrPagesControllers.count - 1 {
            btnNext.isHidden = true
            pageControl.isHidden = true
            btnStart.isHidden = false
        }
        // we will check if we are not on the last page (to prevent any index errors)
        if nextPageIndex < arrPagesControllers.count {
            // get the next view controller
            let nextVC = arrPagesControllers[nextPageIndex]
            // move to the next view controller
            self.setViewControllers([nextVC], direction: .forward, animated: true) { _ in
                // update the page control current page
                self.pageControl.currentPage = nextPageIndex
            }
        }
    }
    
    
    // this function will called when user click on the start journey button
    @objc func startJourney(sender: UIButton!) {
        Helper.openViewController(storyboardID: "Main", viewControllerID: "Main" , currentVC: self)
    }
    
    // this function will be called automatically when user swap to the previous page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // to avoid errors when we get the current index
        guard let currentIndex = arrPagesControllers.firstIndex(of: viewController) else{
            return nil
        }
        // get the previous index
        let previousIndex = currentIndex - 1
        // check the previous index to avoid any index error
        guard previousIndex >= 0 else {
            return nil
        }
        // return the previous index
        return arrPagesControllers[previousIndex]
        
    }
    
    // this function will be called automatically when user swap to the next page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // to avoid errors when we get the current index
        guard let currentIndex = arrPagesControllers.firstIndex(of: viewController) else {
            return nil
        }
        // get the after index
        let afterIndex = currentIndex + 1
        // check the after index to avoid any index error
        guard afterIndex < arrPagesControllers.count else {
            return nil
        }
        // return the after index index
        return arrPagesControllers[afterIndex]
    }
    
    // this function will be called when view controller finished the animation and being visible to the user
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // get current view controller/ page
        let pageContentViewcontroller = pageViewController.viewControllers![0]
        // if the shown view controller is the last one, hide next, skip buttons and page control and show the start journey button otherwise will only show next, skip buttons and page control
        if arrPagesControllers.firstIndex(of: pageContentViewcontroller)! == (arrPagesControllers.count - 1) {
            //
            pageControl.isHidden = true
            btnNext.isHidden = true
            btnStart.isHidden = false
        }else{
            //
            pageControl.isHidden = false
            btnNext.isHidden = false
            btnStart.isHidden = true
        }
        // update page control current page
        pageControl.currentPage = arrPagesControllers.firstIndex(of: pageContentViewcontroller)!
    }
}


