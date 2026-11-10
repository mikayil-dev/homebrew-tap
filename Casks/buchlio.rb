cask "buchlio" do
  version "1.2.0"
  sha256 "9c8a50edbb101eadc006084e5ec124b909128579f5b0437d5d993b585f88f762"

  url "https://buchlio.de/updates/Buchlio-macOS.dmg"
  name "Buchlio"
  desc "Receipts, income, expenses and invoices, organised locally"
  homepage "https://buchlio.de/"

  livecheck do
    url "https://buchlio.de/updates/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Buchlio.app"

  zap trash: [
    "~/Library/Application Support/de.buchlio.organizer",
    "~/Library/Caches/de.buchlio.organizer",
    "~/Library/Preferences/de.buchlio.organizer.plist",
    "~/Library/WebKit/de.buchlio.organizer",
  ]
end
