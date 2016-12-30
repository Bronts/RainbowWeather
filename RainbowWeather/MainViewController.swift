//
//  MainViewController.swift
//  RainbowWeather
//
//  Created by Yangzheng on 2016/12/25.
//  Copyright © 2016年 Yangzheng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = Observable.just([
        1,3,5,6,7,8,1,23,34,5,6,
        2,
        3
        ])
    
    // RxSwift资源回收包
    private let disposeBag = DisposeBag()

    let colors = [UIColor.red, UIColor.blue, UIColor.black]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        items
            .bindTo(collectionView.rx.items) { (collectionView, row, element) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as UICollectionViewCell// as! NumberCell
                cell.backgroundColor = self.colors[row % 3]//"\(element) @ \(row)"
                return cell
            }
            .addDisposableTo(disposeBag)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

