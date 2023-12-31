//
//  GroceryItemsRow.swift
//  KDATest
//
//  Created by Sufiandy Elmy on 07/11/23.
//

import Foundation
import SwiftUI
import Kingfisher

/**
 Single item view to show the grocery product with details like title, price and subtitle etc
 */
struct GroceryItemsRow: View {
    let cellWidth = UIScreen.main.bounds.width/2 - 20
    let cellHeight : CGFloat =  (UIScreen.main.bounds.width/2 - 32) * 1.75
    var groceryItemModel : GroceryItemModel
    
    var body: some View {
        VStack {
            if groceryItemModel.type == GroceryItemModel.Category.promotion {
                getPromotionalView()
            }else {
                NavigationLink(
                    destination: GrocerDetailsView(grocerItemModel: groceryItemModel)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                ){
                    getProductItemView()
                }
            }
        }
    }
    
    /**
     get product item view for grocery view
     */
    func getProductItemView()-> some View{
        return ZStack {
            RoundedRectangle(cornerRadius: 30).frame(width: cellWidth, height: cellHeight, alignment: .center).foregroundColor(Utils.getColor(groceryItemModel.accentColor))
            
            VStack {
                HStack{
                    Spacer()
                    Image("plus")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 10, height: 10, alignment: .center)
                        .padding(.all, 10)
                        .background(Rectangle()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .opacity(0.6))
                        .clipShape(Circle())
                        .padding(.all, 10)
                        .opacity(0.7)
                    
                }.frame(width: cellWidth, height: 40, alignment: .center)
                Spacer()
            }
            
            VStack {
                
                KFImage(URL(string: groceryItemModel.image)!)
                    .placeholder {
                        Image("kiwi")
                            .resizable()
                            .renderingMode(.original)
                            .scaledToFit()
                            .frame(width: self.cellWidth, height: 130, alignment: .center)
                    }
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .transition(AnyTransition.opacity)
                    .animation(.default)
                    .frame(width: self.cellWidth, height: 130, alignment: .center)
                    .padding(.top)
                
                HStack {
                    Text(groceryItemModel.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                    
                    Spacer()
                }
                
                Text(groceryItemModel.subtitle)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    .frame(width: cellWidth, height: 30, alignment: .leading)
                
                HStack {
                    VStack {
                        
                        Text(Utils.getFormattedPrice(price: groceryItemModel.price))
                            .font(.headline).foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                        
                        Text(groceryItemModel.quantityLabel ?? "")
                            .font(.system(size: 10))
                            .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                        
                    }.padding(.leading)
                    
                    Spacer()
                    
                    Text(groceryItemModel.miscInfo)
                        .font(.system(size: 10))
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                        .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                        .padding(.trailing)
                    
                }.padding(.top)
                
                Spacer()
                
            }.frame(width: cellWidth, height: cellHeight, alignment: .center)
        }
    }
    
    /**
     returns a promotional view for grocery view
     */
    func getPromotionalView() -> some View {
        return  ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: cellWidth, height: cellHeight, alignment: .center)
                .foregroundColor(Color.fromHex(groceryItemModel.accentColor))
            
            KFImage(URL(string: groceryItemModel.image)!)
                .placeholder {
                    Image("fruit")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: self.cellWidth, height: self.cellHeight, alignment: .center)
                }
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: cellWidth, height: cellHeight, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            VStack(spacing: 16){
                
                Spacer()
                
                Text(groceryItemModel.title)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color.fromHex(Constants.COLOR_BLACK))
                
                Text(groceryItemModel.miscInfo)
                    .font(.caption)
                    .fontWeight(.bold)
                    .backgroundCoupon(cellWidth: cellWidth, cellHeight: cellHeight)
                    .foregroundColor(Color.fromHex(Constants.COLOR_ACCENT_GREEN))
                
                
                Text(groceryItemModel.subtitle)
                    .lineLimit(2)
                    .font(.system(size: 10))
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.fromHex(Constants.COLOR_GREY_600))
                
                Spacer()
            }
        }
    }
}

//MARK:- Extension functions for views
extension View {
    
    //coupon background
    func backgroundCoupon(cellWidth: CGFloat, cellHeight: CGFloat) -> some View {
        self.background(RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color.white).opacity(0.8)
            .frame(width: cellWidth - 42, height: 30, alignment: .center))
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.fromHex(Constants.COLOR_ACCENT_GREEN), lineWidth: 2)
                .frame(width: cellWidth - 42, height: 30, alignment: .center))
    }
    
}

