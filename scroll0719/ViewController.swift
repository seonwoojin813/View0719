//
//  ViewController.swift
//  scroll0719
//
//  Created by Woojin on 19/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView :UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //추가한 이미지로 UIImage 객체 만들기
        let image = UIImage(named: "Neymar.jpeg")
        //이미지를 가지고 이미지 뷰를 만들어서 출력하기
        imageView = UIImageView(image: image)
        //이미지 뷰가 터치를 사용할 수 있도록 설정
        imageView.isUserInteractionEnabled = true
        
        //ScrollView를 생성 - 디바이스 화면 전체 크기로 생성
        let scrollView = UIScrollView(frame:UIScreen.main.bounds)
        //delegate 설정
        scrollView.delegate = self
        //확대 축소 배율 설정
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 0.5
        //화면 단위로 스크롤 되도록 설정
        scrollView.isPagingEnabled = true
        
        //스크롤 가능하도록 설정하고 스크롤 가능한 사이즈를 설정
        scrollView.isScrollEnabled = true
        scrollView.contentSize = imageView.frame.size
        //이미지 뷰를 스크롤 뷰 위에 배치하고 스크롤 뷰를 메인 뷰 위에 배치
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        //현재 뷰에 이미지 뷰 추가
        //view.addSubview(imageView)
    }
}

extension ViewController : UIScrollViewDelegate{
    //실제 확대 축소가 발생할 뷰를 리턴해야 합니다.
    func viewForZooming(in scrollView: UIScrollView) ->
      UIView? {
      return imageView
    }
    
}
