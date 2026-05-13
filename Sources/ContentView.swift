import SwiftUI

struct ContentView: View {
    private let heightStep: CGFloat = 10
    private let minHeight: CGFloat = 40

    @State private var text = """
    第一行
    第二行
    第三行
    """
    @State private var textFieldHeight: CGFloat = 120

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Issue: 手动输入时，用 Option+Enter 换行。末行新增换行会闪；中间换行通常不闪。")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                Button("减小 height") {
                    textFieldHeight = max(minHeight, textFieldHeight - heightStep)
                }

                Button("增加 height") {
                    textFieldHeight += heightStep
                }

                Text("当前 height: \(Int(textFieldHeight))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            TextField("请输入多行内容", text: $text, axis: .vertical)
                .textFieldStyle(.plain)
                .lineLimit(1...16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: textFieldHeight, alignment: .topLeading)
                .padding(12)
                .background(Color(nsColor: .textBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary.opacity(0.35), lineWidth: 1)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
