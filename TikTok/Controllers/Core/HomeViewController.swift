//
//  ViewController.swift
//  TikTok
//
//  Created by CodergirlTM on 01.02.22.
//

import UIKit

class HomeViewController: UIViewController {

    let horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let forYouPageViewController = UIPageViewController(transitionStyle: .scroll,
                                                navigationOrientation: .vertical,
                                                options: [:])
    let followingPageViewController = UIPageViewController(transitionStyle: .scroll,
                                                navigationOrientation: .vertical,
                                                options: [:])
    
    private var forYouPosts = PostModel.mockModels()
    private var followingPosts = PostModel.mockModels()

    //Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(horizontalScrollView)
        setUpFeed()
    }

    override func viewDidLayoutSubviews() {
        horizontalScrollView.frame = view.bounds

    }
    
    private func setUpFeed() {
        horizontalScrollView.contentSize = CGSize(width: view.width * 2, height: view.height)
        setUpFollowingFeed()
        setUpForYouFeed()
        horizontalScrollView.contentOffset = CGPoint(x: view.width, y: 0)
    }
    
    func setUpFollowingFeed() {
        
        // For You
        

        guard let model = followingPosts.first else {
            return
        }
        
        
        followingPageViewController.setViewControllers([PostViewController(model: model)],
                                            direction: .forward,
                                            animated: false,
                                            completion: nil)
        followingPageViewController.dataSource = self
        horizontalScrollView.addSubview(followingPageViewController.view)
        followingPageViewController.view.frame = CGRect(x: 0,
                                             y: 0,
                                             width: horizontalScrollView.width,
                                             height: horizontalScrollView.width)
        addChild(followingPageViewController)
        followingPageViewController.didMove(toParent: self)
    }

    func setUpForYouFeed() {
        
        // For You
        
        guard let model = forYouPosts.first else {
            return
        }
        forYouPageViewController.setViewControllers([PostViewController(model: model)],
                                            direction: .forward,
                                            animated: false,
                                            completion: nil)
        forYouPageViewController.dataSource = self
        horizontalScrollView.addSubview(forYouPageViewController.view)
        forYouPageViewController.view.frame = CGRect(x: view.width,
                                             y: 0,
                                             width: horizontalScrollView.width,
                                             height: horizontalScrollView.width)
        addChild(forYouPageViewController)
        forYouPageViewController.didMove(toParent: self)
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let fromPost = (viewController as? PostViewController)?.model else {
            return nil
        }
        
        guard let index = currentPosts.firstIndex(where: {
            $0.identifier == fromPost.identifier
        }) else {
            return nil
        }
        
        if index == 0 {
            return nil
        }
        
        let priorIndex = index - 1
        let model = currentPosts[priorIndex]
        let vc = PostViewController(model: model)
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let fromPost = (viewController as? PostViewController)?.model else {
            return nil
        }
        
        guard let index = currentPosts.firstIndex(where: {
            $0.identifier == fromPost.identifier
        }) else {
            return nil
        }
        
        guard index < (currentPosts.count - 1) else {
            return nil
        }
        
        let nextIndex = index + 1
        let model = currentPosts[nextIndex]
        let vc = PostViewController(model: model)
        return vc
    }
    
    var currentPosts: [PostModel] {
        if horizontalScrollView.contentOffset.x == 0 {
            // following
            return followingPosts
        } else {
            // for you
            return forYouPosts
        }
    }
}
