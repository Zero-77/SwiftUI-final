//
//  locationList.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/1.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct locationList: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font:UIFont(name: "MarkerFelt-Wide", size: 50)!]
    }
    var body: some View {
        NavigationView{//分類呈現列表
            List{
                    ForEach(Country.indices){
                        (item) in
                        NavigationLink(destination: ImageList(country:Country[item])){
                            locationRow(country:Country[item])//country是依照locationRow的let country:countrys
                        }
                    }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("-Country-")
                .onAppear{UITableView.appearance().separatorColor = .clear}//消除間隔
        }
        
    }
}

struct locationList_Previews: PreviewProvider {
    static var previews: some View {
        locationList()
    }
}
