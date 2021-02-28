import 'package:flutter/material.dart';
import 'package:food_app/constants/Complexity.dart';
import 'package:food_app/model/Food.dart';
import './model/Category.dart';
const categories = const [
  Category(id: 1, content: "Japanese's Food", color : Colors.redAccent),
  Category(id: 2, content: "Vietnamese's Food", color : Colors.pinkAccent),
  Category(id: 3, content: "Chinaese's Food", color : Colors.greenAccent),
  Category(id: 4, content: "French's Food", color : Colors.blueAccent),
];

var foods = [
  Food(
    name: 'Sushi - 寿司',
    imageUrl: 'https://photo-cms-tpo.zadn.vn/665x449/Uploaded/2021/rkznae/2019_11_14/goc_canh_bao_an_nhieu_sushi_de_bi_nhiem_khuan_0a0e6807_gdef.jpg',
    categoryId: 1,
    complexity: Complexity.Medium,
    duration: Duration(minutes: 20),
    ingredients: ['Rice', 'Fish', 'Vegetable']
  ),
  Food(
      name: 'Mì tương đen - 자장면',
      imageUrl: 'https://daynauan.info.vn/wp-content/uploads/2016/01/mi-tuong-den.jpg',
      categoryId: 1,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Noodle', 'Egges', 'Vegetable']
  ),
  Food(
      name: 'Bún đậu mắm tôm',
      imageUrl: 'https://toplist.vn/images/800px/bun-dau-mam-tom-nghia-tan-56523.jpg',
      categoryId: 2,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Bún', 'Đậu', 'Thịt']
  ),
  Food(
      name: 'Bún bò Huế',
      imageUrl: 'https://scm-assets.constant.co/scm/unilever/e9dc924f238fa6cc29465942875fe8f0/84024100-4767-4006-a26f-ec8ff577d9fa.jpg',
      categoryId: 2,
      complexity: Complexity.Medium,
      duration: Duration(minutes: 15),
      ingredients: ['Bún', 'Chân giò', 'Tiết', 'Xương']
  ),
  Food(
      name: 'Sườn xào chua ngọt',
      imageUrl: 'https://cdn.daotaobeptruong.vn/wp-content/uploads/2020/10/suon-xao-ot-chuong.jpg',
      categoryId: 2,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Sườn', 'Đường', 'Chanh']
  ),
  Food(
      name: 'Gà không lối thoát',
      imageUrl: 'https://product.hstatic.net/1000246306/product/khong_co_loi_thoat.jpg',
      categoryId: 2,
      complexity: Complexity.Medium,
      duration: Duration(minutes: 15),
      ingredients: ['Gà', 'Muối', 'Lá Chanh']
  ),
  Food(
      name: 'Vũ công nhảy múa',
      imageUrl: 'https://thucthan.com/media/2018/06/ech-xao-sa-ot/cach-lam-ech-xao-sa-ot.jpg',
      categoryId: 2,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Ếch']
  ),
  Food(
      name: 'Phở bò Nam Định',
      imageUrl: 'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/pho-bo-thumbnail.jpg',
      categoryId: 2,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Phở', 'Xương']
  ),
  Food(
      name: 'Lẩu Tứ Xuyên',
      imageUrl: 'https://achau.net/assets/images/127-0-0-1_11065145929ecoupon1-1024x682.jpg',
      categoryId: 3,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Ớt', 'Lẩu']
  ),
  Food(
      name: 'Gan Ngỗng',
      imageUrl: 'https://vnn-imgs-f.vgcloud.vn/2019/04/09/11/gan-ngong-1.jpg',
      categoryId: 4,
      complexity: Complexity.Simple,
      duration: Duration(minutes: 10),
      ingredients: ['Rau', 'Gan']
  ),
];