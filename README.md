# StudyFlutter

========================================
FIX LỖI FIREBASE TRÊN MAC M1
- XOÁ HẾT COCOAPODS (TERMINAL)
=> sudo gem uninstall cocoapods
=> sudo gem uninstall cocoapods-downloader
=> sudo gem uninstall cocoapods-core    
- RUN LỆNH CÀI ĐẶT COCOAPODS (TERMINAL)
=> sudo arch -x86_64 gem install ffi
- CHỈNH SỬA FILE PODFILE.LOCK (ROOT PATH IOS)
=> Uncomment #platform :ios, '9.0' Then change the version to 10 platform :ios, '10.0'
=> GÕ TERMINAL ROOT LÀ PATH IOS: 'arch -x86_64 pod repo update'
CUỐI CÙNG CHẠY LỆNH SAU: 'arch -x86_64 pod update' or 'arch -x86_64 pod install'
