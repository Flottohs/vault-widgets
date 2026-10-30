import AppKit

// MARK: - Pixel art

let palette: [Character: NSColor] = [
    "K": NSColor(srgbRed: 0.10, green: 0.10, blue: 0.14, alpha: 1), // outline
    "W": NSColor(srgbRed: 0.97, green: 0.95, blue: 0.90, alpha: 1), // white / paper
    "S": NSColor(srgbRed: 0.72, green: 0.77, blue: 0.84, alpha: 1), // robot silver
    "C": NSColor(srgbRed: 0.24, green: 0.88, blue: 1.00, alpha: 1), // robot eyes
    "Y": NSColor(srgbRed: 1.00, green: 0.82, blue: 0.24, alpha: 1), // gold
    "N": NSColor(srgbRed: 0.17, green: 0.24, blue: 0.55, alpha: 1), // navy cap
    "M": NSColor(srgbRed: 0.29, green: 0.39, blue: 0.78, alpha: 1), // cap highlight
    "L": NSColor(srgbRed: 0.62, green: 0.69, blue: 0.78, alpha: 1), // ruled lines
    "G": NSColor(srgbRed: 0.18, green: 0.75, blue: 0.36, alpha: 1), // green tick
    "O": NSColor(srgbRed: 1.00, green: 0.58, blue: 0.20, alpha: 1), // orange pi
    "R": NSColor(srgbRed: 1.00, green: 0.36, blue: 0.48, alpha: 1), // heart
    "V": NSColor(srgbRed: 0.53, green: 0.36, blue: 0.96, alpha: 1), // obsidian purple
    "P": NSColor(srgbRed: 0.74, green: 0.62, blue: 1.00, alpha: 1), // purple light
    "D": NSColor(srgbRed: 0.33, green: 0.20, blue: 0.68, alpha: 1), // purple dark
    "A": NSColor(srgbRed: 0.85, green: 0.47, blue: 0.34, alpha: 1), // claude orange
    "E": NSColor(srgbRed: 0.11, green: 0.16, blue: 0.25, alpha: 1), // monitor screen
]

let robot = [
    ".......KK.......",
    "......KYYK......",
    ".......KK.......",
    "..KKKKKKKKKKKK..",
    ".KSSSSSSSSSSSSK.",
    ".KSKKKSSSSKKKSK.",
    "KKSKCCKSSKCCKSKK",
    "KSSKCCKSSKCCKSSK",
    "KKSKKKKSSKKKKSKK",
    ".KSSSSSSSSSSSSK.",
    ".KSSKKKKKKKKSSK.",
    ".KSSKWKWKWKKSSK.",
    ".KSSKKKKKKKKSSK.",
    ".KSSSSSSSSSSSSK.",
    "..KKKKKKKKKKKK..",
]

let gradCap = [
    ".......KK.......",
    ".....KKMMKK.....",
    "...KKMMMMMMKK...",
    ".KKMMMMMMMMMMKK.",
    "KNNNNNNYYYYYYYYK",
    ".KKNNNNNNNNNNKY.",
    "...KKNNNNNNKK.Y.",
    "...KNKKNNKKNK.Y.",
    "...KNNNKKNNNK.Y.",
    "...KNNNNNNNNK.YY",
    "....KKNNNNKK..YY",
    "......KKKK......",
]

let testPaper = [
    "..KKKKKKKKKK....",
    "..KWWWWWWWWKK...",
    "..KWLLLLWWWKWK..",
    "..KWWWWWWWWKKKK.",
    "..KWLLLLLLWWWWK.",
    "..KWWWWWWWWWWWK.",
    "..KWLLLLLLLWWWK.",
    "..KWWWWWWWWWWWK.",
    "..KWLLLLWWWWWGK.",
    "..KWWWWWGWWWGWK.",
    "..KWWWWWWGWGWWK.",
    "..KWWWWWWWGWWWK.",
    "..KWLLLLLWWWWWK.",
    "..KWWWWWWWWWWWK.",
    "..KKKKKKKKKKKKK.",
]

let pi = [
    "..KKKKKKKKKKKK..",
    ".KOOOOOOOOOOOOK.",
    ".KOOOOOOOOOOOOK.",
    "..KKOOKKKKOOKK..",
    "...KOOK..KOOK...",
    "...KOOK..KOOK...",
    "...KOOK..KOOK...",
    "..KOOK...KOOK...",
    "..KOOK...KOOOK..",
    ".KOOK.....KOOK..",
    ".KKK.......KKK..",
]

let heart = [
    "...KKKK..KKKK...",
    "..KRRRRKKRRRRK..",
    ".KRWWRRRRRRRRRK.",
    ".KRWRRRRRRRRRRK.",
    ".KRRRRRRRRRRRRK.",
    ".KRRRRRRRRRRRRK.",
    "..KRRRRRRRRRRK..",
    "...KRRRRRRRRK...",
    "....KRRRRRRK....",
    ".....KRRRRK.....",
    "......KRRK......",
    ".......KK.......",
]

// Used for any vault without its own icon.
let gem = [
    "......KK......",
    ".....KPVK.....",
    "....KPVVVK....",
    "...KPPVVVVK...",
    "..KPPVVVVVVK..",
    "..KPVVVVVVDK..",
    "..KVVVVVVVDK..",
    "...KVVVVVDK...",
    "....KVVVDK....",
    ".....KVDK.....",
    "......KK......",
]

let claudeBurst = [
    "......KAK......",
    ".K....KAK....K.",
    "KAK...KAK...KAK",
    ".KAK..KAK..KAK.",
    "..KAK.KAK.KAK..",
    "...KAKKAKKAK...",
    "KKKKKAAAAAKKKKK",
    "KAAAAAAAAAAAAAK",
    "KKKKKAAAAAKKKKK",
    "...KAKKAKKAK...",
    "..KAK.KAK.KAK..",
    ".KAK..KAK..KAK.",
    "KAK...KAK...KAK",
    ".K....KAK....K.",
    "......KAK......",
]

let dashboard = [
    ".KKKKKKKKKKKKKK.",
    "KSSSSSSSSSSSSSSK",
    "KSEEEEEEEEEEEESK",
    "KSEEEEEEEEEEGESK",
    "KSEEEEEEEEEEGESK",
    "KSEEEEEEOEEEGESK",
    "KSEEEEEEOEEEGESK",
    "KSEECEEEOEEEGESK",
    "KSEECEEEOEREGESK",
    "KSEECEYEOEREGESK",
    "KSEEEEEEEEEEEESK",
    "KSSSSSSSSSSSSSSK",
    ".KKKKKKSSKKKKKK.",
    "......KSSK......",
    "....KKKKKKKK....",
]

// Vault folder name -> (label, icon). Matching ignores case.
let vaultStyles: [String: (String, [String])] = [
    "aivault": ("AI", robot),
    "alevelsvault": ("A-Levels", gradCap),
    "tmua": ("TMUA", testPaper),
    "furthermaths": ("Further Maths", pi),
    "therapyvault": ("Therapy", heart),
]

func pixelImage(_ rows: [String], pointSize: CGFloat) -> NSImage {
    let cols = rows.map(\.count).max() ?? 1
    let cell = (pointSize / CGFloat(max(cols, rows.count))).rounded(.down)
    let ox = ((pointSize - CGFloat(cols) * cell) / 2).rounded()
    let oy = ((pointSize - CGFloat(rows.count) * cell) / 2).rounded()
    return NSImage(size: NSSize(width: pointSize, height: pointSize), flipped: true) { _ in
        for (r, row) in rows.enumerated() {
            for (c, ch) in row.enumerated() {
                guard let color = palette[ch] else { continue }
                color.setFill()
                NSRect(x: ox + CGFloat(c) * cell, y: oy + CGFloat(r) * cell, width: cell, height: cell).fill()
            }
        }
        return true
    }
}

// MARK: - App

struct Vault {
    let name: String   // folder name, which is what Obsidian calls the vault
    let path: String
}

struct Item {
    let id: String       // key for the saved position
    let label: String
    let icon: [String]
    let tooltip: String
    let path: String?    // shown by "Show in Finder" when set
    let open: () -> Void
}

func vaultItem(_ vault: Vault) -> Item {
    let style = vaultStyles[vault.name.lowercased()]
    return Item(id: vault.name, label: style?.0 ?? vault.name, icon: style?.1 ?? gem,
                tooltip: "Open \(vault.name) in Obsidian", path: vault.path) {
        var components = URLComponents(string: "obsidian://open")!
        components.queryItems = [URLQueryItem(name: "vault", value: vault.name)]
        if let url = components.url { NSWorkspace.shared.open(url) }
    }
}

let home = FileManager.default.homeDirectoryForCurrentUser.path

func runAppleScript(_ source: String) {
    var error: NSDictionary?
    NSAppleScript(source: source)?.executeAndReturnError(&error)
    if let error { NSLog("AppleScript failed: \(error)") }
}

let claudeItem = Item(id: "claude", label: "Claude", icon: claudeBurst,
                      tooltip: "Open Claude Code in a new iTerm window", path: nil) {
    runAppleScript("""
        tell application "iTerm"
            activate
            set w to (create window with default profile)
            tell current session of w to write text "claude"
        end tell
        """)
}

let dashboardItem = Item(id: "agentdash", label: "Dashboard", icon: dashboard,
                         tooltip: "Open the agent dashboard in iTerm", path: nil) {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: home + "/.local/bin/agentdash")
    process.arguments = ["open"]
    var env = ProcessInfo.processInfo.environment
    env["PATH"] = "\(home)/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
    process.environment = env
    do { try process.run() } catch { NSLog("agentdash open failed: \(error)") }
}

func loadVaults() -> [Vault] {
    let config = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Library/Application Support/obsidian/obsidian.json")
    guard let data = try? Data(contentsOf: config),
          let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
          let vaults = json["vaults"] as? [String: [String: Any]] else { return [] }
    return vaults.values
        .compactMap { $0["path"] as? String }
        .filter { FileManager.default.fileExists(atPath: $0) }
        .map { Vault(name: ($0 as NSString).lastPathComponent, path: $0) }
        .sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
}

let tileSize = NSSize(width: 104, height: 116)

final class TileView: NSView {
    let item: Item
    private var dragStart: NSPoint?
    private var windowStart: NSPoint?
    private var dragged = false
    private let highlight = NSView()

    init(item: Item) {
        self.item = item
        super.init(frame: NSRect(origin: .zero, size: tileSize))

        let background = NSVisualEffectView(frame: bounds)
        background.material = .popover
        background.state = .active
        background.wantsLayer = true
        background.layer?.cornerRadius = 22
        background.layer?.masksToBounds = true
        background.autoresizingMask = [.width, .height]
        addSubview(background)

        highlight.frame = bounds
        highlight.wantsLayer = true
        highlight.layer?.cornerRadius = 22
        highlight.layer?.backgroundColor = NSColor.white.withAlphaComponent(0.12).cgColor
        highlight.isHidden = true
        addSubview(highlight)

        let icon = NSImageView(frame: NSRect(x: 20, y: 36, width: 64, height: 64))
        icon.image = pixelImage(item.icon, pointSize: 64)
        icon.imageScaling = .scaleNone
        addSubview(icon)

        let label = NSTextField(labelWithString: item.label)
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.alignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.frame = NSRect(x: 6, y: 12, width: tileSize.width - 12, height: 16)
        addSubview(label)

        toolTip = item.tooltip
        addTrackingArea(NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways],
                                       owner: self))
    }

    required init?(coder: NSCoder) { fatalError() }

    override func acceptsFirstMouse(for event: NSEvent?) -> Bool { true }
    override func mouseEntered(with event: NSEvent) { highlight.isHidden = false }
    override func mouseExited(with event: NSEvent) { highlight.isHidden = true }

    // A click opens the vault; a drag moves the tile and remembers where it was left.
    override func mouseDown(with event: NSEvent) {
        dragStart = NSEvent.mouseLocation
        windowStart = window?.frame.origin
        dragged = false
    }

    override func mouseDragged(with event: NSEvent) {
        guard let start = dragStart, let origin = windowStart else { return }
        let now = NSEvent.mouseLocation
        let dx = now.x - start.x, dy = now.y - start.y
        if !dragged && hypot(dx, dy) < 4 { return }
        dragged = true
        window?.setFrameOrigin(NSPoint(x: origin.x + dx, y: origin.y + dy))
    }

    override func mouseUp(with event: NSEvent) {
        if dragged, let origin = window?.frame.origin {
            UserDefaults.standard.set(NSStringFromPoint(origin), forKey: "position.\(item.id)")
        } else {
            item.open()
        }
        dragStart = nil
    }

    override func menu(for event: NSEvent) -> NSMenu? {
        let menu = NSMenu()
        menu.addItem(withTitle: "Open", action: #selector(openItem), keyEquivalent: "").target = self
        if item.path != nil {
            menu.addItem(withTitle: "Show in Finder", action: #selector(revealItem), keyEquivalent: "").target = self
        }
        menu.addItem(.separator())
        menu.addItem(withTitle: "Reset Widget Positions", action: #selector(AppDelegate.resetPositions),
                     keyEquivalent: "").target = NSApp.delegate
        return menu
    }

    @objc func openItem() { item.open() }

    @objc func revealItem() {
        guard let path = item.path else { return }
        NSWorkspace.shared.activateFileViewerSelecting([URL(fileURLWithPath: path)])
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    var panels: [NSPanel] = []

    func applicationDidFinishLaunching(_ note: Notification) {
        for item in loadVaults().map(vaultItem) + [claudeItem, dashboardItem] {
            let panel = NSPanel(contentRect: NSRect(origin: .zero, size: tileSize),
                                styleMask: [.borderless, .nonactivatingPanel], backing: .buffered, defer: false)
            panel.isOpaque = false
            panel.backgroundColor = .clear
            panel.hasShadow = true
            // Just above the desktop icons, below every normal window.
            panel.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.desktopIconWindow)) + 1)
            panel.collectionBehavior = [.canJoinAllSpaces, .stationary, .ignoresCycle]
            panel.contentView = TileView(item: item)
            panels.append(panel)
        }
        placePanels(useSaved: true)
        panels.forEach { $0.orderFrontRegardless() }
    }

    // Default layout is a row along the top-left of the main screen.
    func placePanels(useSaved: Bool) {
        guard let visible = NSScreen.screens.first?.visibleFrame else { return }
        for (i, panel) in panels.enumerated() {
            let name = (panel.contentView as! TileView).item.id
            if useSaved, let saved = UserDefaults.standard.string(forKey: "position.\(name)") {
                panel.setFrameOrigin(NSPointFromString(saved))
            } else {
                panel.setFrameOrigin(NSPoint(x: visible.minX + 24 + CGFloat(i) * (tileSize.width + 16),
                                             y: visible.maxY - 24 - tileSize.height))
            }
        }
    }

    @objc func resetPositions() {
        for panel in panels {
            UserDefaults.standard.removeObject(forKey: "position.\((panel.contentView as! TileView).item.id)")
        }
        placePanels(useSaved: false)
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.accessory)
app.run()
