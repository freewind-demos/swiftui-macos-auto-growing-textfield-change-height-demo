# SwiftUI macOS Auto-growing TextField Issue Demo

## 简介

这个 Demo 只演示 1 个 SwiftUI 原生问题：

1. 放 1 个 `TextField`
2. 它可输入多行
3. 它会沿竖向自动增长
4. 但在最后一行继续新增内容时，如果用换行扩展文本，视图会闪烁

核心做法：

1. 用 SwiftUI 原生 `TextField(axis: .vertical)`

## 快速开始

### 环境要求

1. macOS 14+
2. Xcode
3. XcodeGen

### 运行

```bash
cd /Volumes/SN550-2T/freewind-demos/swiftui-macos-auto-growing-textfield-issue-demo
./scripts/build.sh
open build/DerivedData/Build/Products/Debug/SwiftUIAutoGrowingTextFieldDemo.app
```

## 复现步骤

1. 启动 app
2. 在输入框中先输入几行文本
3. 把光标放到最后一行末尾
4. 按 `Option+Enter` 插入新行，并继续输入
5. 观察输入框在新增最后一行时会闪烁
6. 再把光标移到中间某一行，按 `Option+Enter` 换行
7. 观察中间位置换行通常不会闪烁，或明显比末行稳定

## 注意事项

1. 这是 macOS Demo，不是 iOS Demo
2. 输入变多时，输入框高度会继续向下长，直到 `lineLimit` 上限
3. 这里的“换行”不是单独按 `Enter`，而是按 `Option+Enter`
4. 重点不是“多行可用”，而是“末行新增换行会触发原生闪烁”

## 教程

1. `TextField(axis: .vertical)` 是关键。它让 `TextField` 支持多行布局。
2. 这版只保留 SwiftUI 原生能力，不再桥接 AppKit，不再监听键盘事件。
3. UI 主干只有 2 层：`AppMain.swift` 负责窗口，`ContentView.swift` 直接渲染输入框。
4. 这个 Demo 用最小结构保留问题，便于后续向 Apple 反馈或继续对比 `TextEditor` / AppKit bridge 方案。
