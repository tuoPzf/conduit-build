基于上游 gwitko/Conduit v1.4.14+39 (commit 9cd2ff9) 的私人修改版。

## 改动
1. 去掉进入 App 的锁屏密码（App Lock）。
2. 修复国产 ROM「安全键盘」导致第三方输入法/中文无法输入的问题：
   - 底层终端包 conduit_vt 不再强制 `enableSuggestions:false` / `enableIMEPersonalizedLearning:false`
   - 终端输入类型改为普通文本
   - 所有密码框改为 Dart 层遮挡（新增 SecretTextController），不再使用系统密码输入类型
   - 修复 Mosh locale / Mosh UDP ports / Tmux session name / Tmux start directory 的 `enableSuggestions:false`

## 安装
先卸载商店版/旧版（签名不同），再安装本 APK。支持 arm64-v8a / armeabi-v7a / x86_64。

SHA256: 8946841c4410c37e57aa8ad7eaa4a6c2ca51617a2e2c96b1493b398790a50500
