import requests
import urllib.request

def downloadImage(url, filename):
    urllib.request.urlretrieve(url, "/home/hokiduc/Desktop/img/" + filename + ".jpg")

## cafe
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd6723a3_cafe-sua-da.jpg', 'Cà Phê Sữa Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd6723a4_Bac-siu.jpg', 'Bạc Xỉu')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67237b_Caramel-macchiato.jpg', 'Caramel Macchiato Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5e4f9e4316bd0a0018d2e24e_cafe-da-xay.jpg', 'Cà Phê Đá Xay-Lạnh')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672391_Latte-da.jpg', 'Latte Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ca47f92acf0d3492076b29a_Cold-Brew-Classic.jpg', 'Cold Brew Truyền Thống')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ca47f92acf0d3492076b299_Cold-brew-sua-tuoi.jpg', 'Cold Brew Sữa Tươi')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672373_americano-nong-app.jpg', 'Americano Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672374_Americano-da.jpg', 'Americano Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672377_Capu-nong.jpg', 'Cappuccino Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672378_Capu-da.jpg', 'Cappuccino Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67237a_Caramel-Macchiato-nong.jpg', 'Caramel Macchiato Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672390_Latte-nong.jpg', 'Latte Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672397_Mocha-nong.jpg', 'Mocha Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672398_Mocha-da.jpg', 'Mocha Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd6723a0_cafe-den-nong.jpg', 'Cà Phê Đen Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd6723a1_Cafe-den-da.jpg', 'Cà Phê Đen Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd6723a2_cafe-sua-nong.jpg', 'Cà Phê Sữa Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67237f_Cafe-den-da.jpg', 'Espresso Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672380_Espresso-nong.jpg', 'Espresso Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5cdbd6e8696fb3792a389754_Bac-siu-nong.jpg', 'Bạc Xỉu Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5d43bfed073b26003161b693_Cold-brew-pbt.jpg', 'Cold Brew Phúc Bồn Tử')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ca47f92acf0d3492076b298_Cold-brew-cs.jpg', 'Cold Brew Cam Sả')

## THỨC UỐNG ĐÁ XAY

# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5d43bf5d073b26002948a362_Cam-pbt-da-xay.jpg', 'Phúc Bồn Tử Cam Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5e4f9e4316bd0a0018d2e24e_cafe-da-xay.jpg', 'Cà Phê Đá Xay-Lạnh')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67237e_Cookie-da-xay.jpg', 'Cookie Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5d2bdfa5acf0d30ba264432b_Dao-viet-quat-da-xay.jpg', 'Đào Việt Quất Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67237c_Chocolate-da-xay.jpg', 'Chocolate Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672393_Matcha-da-xay.jpg', 'Matcha Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5cdb677aacf0d33b682b4b73_Chanh-sa-da-xay.jpg', 'Chanh Sả Đá Xay')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ffbb2671327f700184f54d4_YOGURT-DUA-LUOI_ko-topping.jpg', 'Yogurt Dưa Lưới phát tài')

# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5d43be2e41d3ac39a44bd7a2_Tra-pbt.jpg', 'Trà Phúc Bồn Tử')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67239c_Tra-dao-cam-sapng.jpg', 'Trà Đào Cam Sả - Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5c3ff3c5acf0d338d22adbaa_Tra-sen-nong.jpg', 'Oolong Hạt Sen - Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5c3ff3c5acf0d338d22adbac_Tra-vai.jpg', 'Oolong Vải - Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5bfb492bacf0d31fd9646728_Tra-dao-cam-sa-nong.jpg', 'Trà Đào Cam Sả - Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5c3ff3c5acf0d338d22adbad_Tra-vai-nong.jpg', 'Oolong Vải - Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5c3ff3c5acf0d338d22adbae_Tra-hat-sen.jpg', 'Oolong Hạt Sen - Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ffbb2671327f700184f54d3_TRA-DUA-LUOI.jpg', 'Trà Dưa Lưới phú quý')

# #Trà sữa - Macchiato
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5e92fd7dc788bc0011abaa06_TS-Macca-tran-chau-trang.jpg', 'Trà Sữa Mắc Ca Trân Châu Trắng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67239e_Tra-den-Macchiato.jpg', 'Trà Đen Macchiato')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672396_Matcha-Macchiato.jpg', 'Matcha Macchiato')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5e4f9e4316bd0a0018d2e251_Tra-lai-Macchiato.jpg', 'Trà Lài Macchiato - Lạnh')

# #Khác
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672392_Sinh-to-cam-xoai.jpg', 'Sinh Tố Cam Xoài')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672375_Sinh-to-viet-quoc.jpg', 'Sinh Tố Việt Quất')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672394_Matcha-latte-nong.jpg', 'Trà Matcha Latte Nóng')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd672395_Matcha.jpg', 'Trà Matcha Latte Đá')
# downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5b03966a1acd4d5bbd67239d_Socola.jpg', 'Socola Đá')

#Đồ ăn nhẹ
downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5d2c4af1696fb3281b3f4ab9_mit-say%201x1.jpg', 'Mít Sấy')
downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5ffea00a87db0e0018e9f905_2021-01-22%2011.08.02.jpg', 'Sô Cô La Gừng')
downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5cdb9624696fb37838048d69_Banh-mi-que.jpg', 'Bánh Mì Que Pate Cay')
downloadImage('https://tch-app.s3.ap-southeast-1.amazonaws.com/menufrontend/5cdb9699696fb3793d4025ab_Banh-mi-que.jpg', 'Bánh Mì Que Pate')