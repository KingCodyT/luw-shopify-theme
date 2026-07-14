import AppKit
import Foundation

let arguments = CommandLine.arguments
guard arguments.count == 3 else {
  fputs("Usage: swift render_brand_hero.swift <input.png> <output.png>\n", stderr)
  exit(1)
}

let inputURL = URL(fileURLWithPath: arguments[1])
let outputURL = URL(fileURLWithPath: arguments[2])

guard let source = NSImage(contentsOf: inputURL),
      let sourceRep = source.representations.first else {
  fputs("Could not open input image.\n", stderr)
  exit(1)
}

let width = sourceRep.pixelsWide
let height = sourceRep.pixelsHigh
let size = NSSize(width: width, height: height)

guard let bitmap = NSBitmapImageRep(
  bitmapDataPlanes: nil,
  pixelsWide: width,
  pixelsHigh: height,
  bitsPerSample: 8,
  samplesPerPixel: 4,
  hasAlpha: true,
  isPlanar: false,
  colorSpaceName: .deviceRGB,
  bytesPerRow: 0,
  bitsPerPixel: 0
) else {
  fputs("Could not create output bitmap.\n", stderr)
  exit(1)
}

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmap)

NSColor.black.setFill()
NSRect(origin: .zero, size: size).fill()
source.draw(in: NSRect(origin: .zero, size: size), from: .zero, operation: .copy, fraction: 1.0)

let context = NSGraphicsContext.current!.cgContext
context.saveGState()

let leftWidth = Int(Double(width) * 0.64)
for x in 0..<leftWidth {
  let progress = Double(x) / Double(leftWidth)
  let alpha = CGFloat(0.72 * pow(1.0 - progress, 1.55))
  context.setFillColor(NSColor(calibratedRed: 0.035, green: 0.033, blue: 0.027, alpha: alpha).cgColor)
  context.fill(CGRect(x: x, y: 0, width: 1, height: height))
}

let bottomStart = Int(Double(height) * 0.46)
for y in bottomStart..<height {
  let progress = Double(y - bottomStart) / Double(height - bottomStart)
  let alpha = CGFloat(0.22 * pow(progress, 1.6))
  context.setFillColor(NSColor(calibratedRed: 0.12, green: 0.07, blue: 0.035, alpha: alpha).cgColor)
  context.fill(CGRect(x: 0, y: y, width: width, height: 1))
}

context.restoreGState()

func font(_ name: String, _ size: CGFloat, fallbackWeight: NSFont.Weight = .regular) -> NSFont {
  NSFont(name: name, size: size) ?? NSFont.systemFont(ofSize: size, weight: fallbackWeight)
}

let serif = font("NewYork-Regular", 116)
let smallSans = font("HelveticaNeue-Medium", 25, fallbackWeight: .medium)
let label = font("Menlo-Bold", 18, fallbackWeight: .bold)

let cream = NSColor(calibratedRed: 0.968, green: 0.953, blue: 0.918, alpha: 1.0)
let muted = NSColor(calibratedRed: 0.91, green: 0.84, blue: 0.77, alpha: 0.92)
let accent = NSColor(calibratedRed: 0.86, green: 0.31, blue: 0.18, alpha: 1.0)

func drawTextTop(_ text: String, x: CGFloat, top: CGFloat, attributes: [NSAttributedString.Key: Any]) -> CGFloat {
  let attributed = NSAttributedString(string: text, attributes: attributes)
  let textSize = attributed.size()
  attributed.draw(at: NSPoint(x: x, y: CGFloat(height) - top - textSize.height))
  return textSize.height
}

let left = CGFloat(width) * 0.064
var top = CGFloat(height) * 0.16

let labelAttributes: [NSAttributedString.Key: Any] = [
  .font: label,
  .foregroundColor: accent,
  .kern: 2.6
]
top += drawTextTop("ARTWORK-FIRST COMMERCE", x: left, top: top, attributes: labelAttributes) + 34

let titleAttributes: [NSAttributedString.Key: Any] = [
  .font: serif,
  .foregroundColor: cream,
  .kern: 0
]
top += drawTextTop("THE LYFE", x: left, top: top, attributes: titleAttributes) + 4
top += drawTextTop("U WANT", x: left, top: top, attributes: titleAttributes) + 22

accent.setFill()
NSBezierPath(roundedRect: NSRect(x: left, y: CGFloat(height) - top - 5, width: 188, height: 5), xRadius: 2, yRadius: 2).fill()
top += 32

let paragraph = NSMutableParagraphStyle()
paragraph.lineSpacing = 9
let copyAttributes: [NSAttributedString.Key: Any] = [
  .font: smallSans,
  .foregroundColor: muted,
  .paragraphStyle: paragraph
]
let copy = NSAttributedString(
  string: "Original artwork released as limited\nwearable and collectible canvases.",
  attributes: copyAttributes
)
copy.draw(with: NSRect(x: left, y: CGFloat(height) - top - 86, width: 520, height: 100), options: [.usesLineFragmentOrigin])

let footerAttributes: [NSAttributedString.Key: Any] = [
  .font: label,
  .foregroundColor: cream.withAlphaComponent(0.82),
  .kern: 2.1
]
_ = drawTextTop("CURRENT DROP / LIMITED CANVASES", x: left, top: CGFloat(height) - 92, attributes: footerAttributes)

NSGraphicsContext.restoreGraphicsState()

guard let pngData = bitmap.representation(using: .png, properties: [:]) else {
  fputs("Could not encode PNG.\n", stderr)
  exit(1)
}

try pngData.write(to: outputURL)
print(outputURL.path)
