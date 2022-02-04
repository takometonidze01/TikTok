//
//  PostViewController.swift
//  TikTok
//
//  Created by CodergirlTM on 01.02.22.
//

import UIKit

class PostViewController: UIViewController {
    
    let model: PostModel
    
    init(model: PostModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let colors: [UIColor] = [
            .red, .blue, .yellow, .orange, .white, .black, .systemPink
        ]
        view.backgroundColor = colors.randomElement()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
