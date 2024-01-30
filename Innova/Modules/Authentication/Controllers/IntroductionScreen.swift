//
//  IntroductionScreen.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit
struct Item {
    let image: UIImage
    let title: String
}
class IntroductionScreen: UIViewController {
   
   
    //------------------------------------------
    //MARK: - Outlets -
    @IBOutlet weak var introductionCollection: UICollectionView!
    @IBOutlet weak var btnLoginWithGoogle: WhiteButtonWithImage!
    @IBOutlet weak var btnLoginWithApple: WhiteButtonWithImage!
    @IBOutlet weak var btnRegistration: GreenThemeButton!
    @IBOutlet weak var btnLogin: PlainTextButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //------------------------------------------
    //MARK: - Class Variables -
    var items: [Item] = []

    //------------------------------------------
    //MARK: - Memory Management -
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit
    {
        
    }
    
    //------------------------------------------
    //MARK: - Custom Methods -
    @objc func setupLayout()
    {
        
    }
    
    //------------------------------------------
    //MARK: - API Methods -
    //------------------------------------------
    
    //MARK: - Action Methods -
    @IBAction func btnOkAction(_ sender: UIButton)
    {
    }
    
    //------------------------------------------
    //MARK: - View Life Cycle Methods -
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.introductionCollectionSetup()
        self.btnLoginWithGoogle.touchUpInside = {
            print("btnLoginWithGoogle")
        }
        self.btnLoginWithApple.touchUpInside = {
            print("btnLoginWithApple")
        }
        self.btnRegistration.touchUpInside = {
            print("btnRegistration")
            AppInstance.goToRegisterScreenPage(transition: true)
        }
        self.btnLogin.touchUpInside = {
            print("btnLogin")
            AppInstance.goToLoginScreenPage(transition: true)
        }

        // Do any additional setup after loading the view.
        
    }
    
    func introductionCollectionSetup() {
        let item1 = Item(image: UIImage(named: "firsIntro")!,
                            title: "Choose Product")
        let item2 = Item(image: UIImage(named: "firsIntro")!,
                            title: "Make Payment")
        let item3 = Item(image: UIImage(named: "firsIntro")!,
                            title: "Get Your Order")
        items.append(item1)
        items.append(item2)
        items.append(item3)
        introductionCollection.register(UINib(nibName: "IntroductionCell", bundle: nil), forCellWithReuseIdentifier: "IntroductionCell")
        self.introductionCollection.delegate = self
        self.introductionCollection.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

}
extension IntroductionScreen : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCell", for: indexPath) as! IntroductionCell
        let item = items[indexPath.item]
//        cell.lblTitle.text = item.title
        cell.imgIntro.image = item.image
        print("Azhar cell")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           // Update the position of the page control as the collection view is scrolled
           updatePageControl()
       }
    func updatePageControl() {
          // Calculate the current page based on the collection view's content offset
        let currentPage = Int(self.introductionCollection.contentOffset.x / self.introductionCollection.frame.size.width)
          // Update the page control's current page
          pageControl.currentPage = currentPage
      }

}
