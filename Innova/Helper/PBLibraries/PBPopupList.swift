//
//  PBPopupList.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import Foundation
import UIKit

public typealias VSActionBlock = (Int) -> Void

func AvenirMedium(_ size: CGFloat) -> UIFont?
{
    return UIFont(name: "Avenir-Medium", size: size)
}
func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor
{
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
}

open class PBPopupList: UIView
{
    /// To enable search option to set isSearch = true. Default = "false"
    public var isSearch = false
    
    /// To change search bar placeholder. Default = "Search"
    public var searchPlaceHolder = "Search"
    
    /// To change header view background color. Default color = "brown"
    public var headerColor: UIColor = .brown
    
    /// To change row height of Tableview. Default = "40"
    public var rowHeight: Int = 40
    
    /// To disable multiline view of cell. Default = "true"
    public var isMultilineModeEnabled = true
    
    /// To change cell background color. Default color = "white"
    public var cellBackgroundColor: UIColor = .white
    
    /// To change cell label text color. Default color = "black"
    public var cellTextColor: UIColor = .black
    
    private var ParentBtn: UIButton?
    var DropdownTable: UITableView?
    var completionBlock: VSActionBlock?
    var testbar: UISearchBar?
    
    private var headerTitle = "Select"
    private var headerHeight: CGFloat = CGFloat(90)
    
    private var ordersarray: [Any] = []
    private var filteredArr: [Any] = []
    private var isSearchEdited = false
    
    
    //MARK: - Intialize methods -
    public init(Viewcontroller: UIViewController)
    {
        super.init(frame: Viewcontroller.view.frame)
        Viewcontroller.view.addSubview(self)
    }
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
 
    //MARK: - General Method for Intialize table -
    open func createTableview(_ Contentarray: [Any]?, withTitle title: String = "Select", setCompletionBlock aCompletionBlock: @escaping VSActionBlock)
    {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        headerTitle = title != "" ? title : headerTitle
        
        ParentBtn = UIButton(frame: self.frame)
        ParentBtn?.addTarget(self, action: #selector(self.closeAnimation), for: .touchUpInside)
        ParentBtn?.backgroundColor = UIColor(white: 0.00, alpha: 0.5)
        
        completionBlock = aCompletionBlock

        if let aContentarray = Contentarray
        {
            ordersarray = aContentarray
        }
        
        let minHeight = Int(UIScreen.main.bounds.size.height - 200)
        let minCOunt = (Int(ordersarray.count) * rowHeight) + Int(headerHeight)
        
        if minCOunt < minHeight
        {
            DropdownTable = UITableView(frame: CGRect(x: (self.frame.size.width) / 2 - ((self.frame.size.width) / 1.2) / 2, y: 100, width: (self.frame.size.width) / 1.2, height: CGFloat(minCOunt)))
        }
        else
        {
            DropdownTable = UITableView(frame: CGRect(x: (self.frame.size.width) / 2 - ((self.frame.size.width) / 1.2) / 2, y: 50, width: (self.frame.size.width) / 1.2, height: UIScreen.main.bounds.size.height - 100))
        }
        DropdownTable?.backgroundColor = UIColor.white
        DropdownTable?.dataSource = self
        DropdownTable?.showsVerticalScrollIndicator = false
        
        DropdownTable?.delegate = self
        DropdownTable?.layer.cornerRadius = 5.0
        DropdownTable?.tableFooterView = UIView(frame: CGRect.zero)
        self.addSubview(self.ParentBtn!)
        self.addSubview(self.DropdownTable!)
    }

    @objc func closeAnimation()
    {
        self.removeFromSuperview()
    }
}
extension PBPopupList: UITableViewDataSource, UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return isSearch ? headerHeight : ((headerHeight/3) * 2)
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isSearchEdited
        {
            return filteredArr.count
        }
        return ordersarray.count
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let myview = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: headerHeight/9))
        
        let headLblHeight = isSearch ? headerHeight/3 : ((headerHeight/3) * 2)
        
        let headLbl = UILabel(frame: CGRect(x: 0, y: 0, width: myview.frame.size.width, height: headLblHeight))
        headLbl.backgroundColor = headerColor
        headLbl.textColor = UIColor.white
        headLbl.text = headerTitle
        headLbl.textAlignment = .center
        headLbl.font = AvenirMedium(18)
        
        testbar = UISearchBar(frame: CGRect(x: 0, y: 30, width: myview.frame.size.width, height: (headerHeight/3) * 2))
        testbar?.backgroundImage = UIImage()
        testbar?.backgroundColor = headerColor
        testbar?.placeholder = searchPlaceHolder
        
        if isSearch
        {
            testbar?.delegate = self
            
            myview.addSubview(headLbl)
            myview.addSubview(testbar!)
        }
        else
        {
            myview.addSubview(headLbl)
        }
        return myview
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.backgroundColor = cellBackgroundColor
        cell?.textLabel?.textColor = cellTextColor
        
        cell?.selectionStyle = .none
        tableView.separatorStyle = .singleLine
        
        if isMultilineModeEnabled
        {
            cell?.textLabel?.numberOfLines = 0
            cell?.textLabel?.lineBreakMode = .byWordWrapping
        }

        if isSearchEdited
        {
            cell?.textLabel?.text = ((filteredArr[indexPath.row]) as AnyObject).description//filteredArr[indexPath.row] as? String
        }
        else
        {
            cell?.textLabel?.text = ((ordersarray[indexPath.row]) as AnyObject).description
        }
        
        return cell!
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (completionBlock != nil)
        {
            var indx: Int = indexPath.row
            
            if isSearchEdited
            {
                indx = ordersarray.firstIndex(where: {($0 as AnyObject).description == (filteredArr[indexPath.row] as AnyObject).description})!
            }
            completionBlock!(indx)
        }
        closeAnimation()
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return isMultilineModeEnabled ? UITableView.automaticDimension : CGFloat(rowHeight)
    }
}
extension PBPopupList: UISearchBarDelegate
{
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.count > 0
        {
            isSearchEdited = true
            
            if isSearchEdited == true
            {
                let getArr = ordersarray.filter{($0 as AnyObject).description.lowercased().contains(searchText.lowercased())}
                filteredArr = [Any]()
                filteredArr = getArr
                print("filteredArr = \(filteredArr)")
                
                DropdownTable?.reloadData()
            }
        }
        else
        {
            isSearchEdited = false
            DropdownTable?.reloadData()
        }
    }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        isSearchEdited = true
        testbar?.endEditing(true)
    }
}

