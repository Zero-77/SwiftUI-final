//
//  UnsplashView.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/10.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct UnsplashView: View {
    @ObservedObject var Unsplashresults = UnsplashViewModel()
    var body: some View {
        VStack{
            ScrollView{
                Image("Unsplash")
                    .resizable()
                    .frame(width:400,height: 200)
                    .scaledToFit()
                Group{
                    Text("\nUnsplash是一個免費的相片共享網站。攝影師可以將相片上傳到Unsplash，相片編輯者們會對用戶上傳的相片進行整理。Unsplash使用了較為自由的著作權許可條款，這讓Unsplash成為了網際網路上最大的攝影相片供應商之一，其網站上的相片經常在文章配圖中出現。截止至2020年4月，該網站擁有超過18萬名攝影師，圖庫中儲存了超過160萬張相片。Unsplash被《富比士》、《企業家雜誌》、CNET和The Next Web評為全球領先的攝影網站之一。\n")
                        .frame(width:360)
                        .background(Color.green)
                        .cornerRadius(30)
                    Spacer()
                    Text("                  \n許可協定：\n2017年6月5日，Unsplash相片在「Unsplash許可協定」下發布，該許可證類似於CC0許可證。CC0許可證和Unsplash許可證之間的區別在於，Unsplash許可證不允許從Unsplash大量爬取相片，以建立一個與Unsplash有著相似功能或與Unsplash相競爭的網站。兩種許可均允許瀏覽者「在沒有徵得攝影師或Unsplash許可的情況下，可以自由使用、複製、修改與分發相片，也可以將相片用於商業目的」\n")
                        .frame(width:350)
                        .background(Color.orange)
                        .cornerRadius(30)
                }
                Group{
                    Text("\nUnsplah本月數據:\n")
                    Text("下載總次數:    \(Unsplashresults.statsMonthresults?.downloads ?? "")\n")
                    Text("觀看總次數:    \(Unsplashresults.statsMonthresults?.views ?? "")\n")
                    Text("喜歡總次數:    \(Unsplashresults.statsMonthresults?.likes ?? "")\n")
                }
                Spacer()
                Group{
                    Text("新增相片/圖像總數:    \(Unsplashresults.statsMonthresults?.new_photos ?? "")\n")
                    Text("新增作者/攝影師總數:   \(Unsplashresults.statsMonthresults?.new_photographers ?? "")\n")
                    Text("新增像數總數:   \(Unsplashresults.statsMonthresults?.new_pixels ?? "")\n")
                    Text("新增開發者總數:  \(Unsplashresults.statsMonthresults?.new_developers ?? "")\n")
                    Text("新增API總數:  \(Unsplashresults.statsMonthresults?.new_applications ?? "")\n")
                    Text("新增請求總數:   \(Unsplashresults.statsMonthresults?.new_requests ?? "")")
                }
            }
            .onAppear {
                self.Unsplashresults.fetchResult()
            }
            
        }.background(Path{(path) in
            path.move(to:CGPoint(x:-40,y:-40))
            path.addLine(to:CGPoint(x:-40,y:930))
            path.addLine(to:CGPoint(x:190,y:330))
            path.move(to:CGPoint(x:410,y:-40))
            path.addLine(to:CGPoint(x:430,y:930))
            path.addLine(to:CGPoint(x:220,y:300))
        }.fill(Color(hue: 0.151, saturation: 0.889, brightness: 0.891)))
    }
}

struct UnsplashView_Previews: PreviewProvider {
    static var previews: some View {
        UnsplashView()
    }
}
