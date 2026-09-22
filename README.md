# Conduit（修改版）

基于 [gwitko/Conduit](https://github.com/gwitko/Conduit) `v1.4.14+39`（commit
`9cd2ff9174e4ee8e9f0679d1da6aa4aa0edcf742`）的修改版。

## 下载安装

- APK：`apk/conduit-fixed.apk`
- 安装前请先**卸载商店版 / 旧版**（签名不同，无法覆盖安装）。
- 支持 arm64-v8a / armeabi-v7a / x86_64。

## 本版本改动

1. **去掉进入 App 时的锁屏密码**（原 App Lock，使用设备锁屏密码 / 指纹）。
2. **修复国产 ROM 的“安全键盘”问题**（导致第三方输入法被屏蔽、无法输入中文）：
   - 底层终端包 `conduit_vt` 不再强制 `enableSuggestions:false` /
     `enableIMEPersonalizedLearning:false`（这是触发华为 / 荣耀 / 小米安全键盘的主因）。
   - 终端输入类型由 `visiblePassword` 改为普通文本。
   - 所有密码框（主机密码、密钥口令、FIDO2 PIN、备份密码、速记隐藏字段）改为在 Dart
     层画圆点遮挡（新增 `SecretTextController`），不再使用系统“密码输入类型”。
   - 修复 Mosh locale、Mosh UDP ports、Tmux session name、Tmux start directory
     四个输入框的 `enableSuggestions:false`。

## 目录

| 路径 | 说明 |
|------|------|
| `source/` | 已打好补丁的完整 Conduit 源码（可直接编译） |
| `conduit_vt/` | 已打好补丁的终端包（`source/pubspec.yaml` 通过 `dependency_overrides` 指向它） |
| `patches/conduit-modifications.diff` | 相对上游的完整补丁 |
| `.github/workflows/build-apk.yml` | 云端自动编译：克隆上游 → 打补丁 → 编译 APK |
| `apk/conduit-fixed.apk` | 成品 APK |

## 重新编译

云端：在仓库 Actions 里运行 **Build Conduit APK**（或 push 触发），产物在 Artifacts。

本地（需 Flutter 3.47.5 + Android SDK）：

```bash
cd source
flutter pub get
flutter build apk --release --flavor full
# 产物：build/app/outputs/flutter-apk/app-release.apk
```

> 注意：每次云端编译使用的是临时生成的签名密钥，签名不固定，升级前需先卸载旧版。
