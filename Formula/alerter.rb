class Alerter < Formula
  desc "Send User Alert Notification on Mac OS X from the command-line."
  homepage "https://github.com/vjeantet/alerter"
  url "https://github.com/vjeantet/alerter/archive/003.tar.gz"
  version "003"
  sha256 "864b568ac05109c283e48948f9c637420fb68c8466fb2e98e1742f8d6559affb"

  def install
        xcodebuild "-project", "alerter.xcodeproj",
               "-target", "alerter",
               "SDKROOT=",
               "SYMROOT=build",
               "CODE_SIGN_IDENTITY=",
               "CODE_SIGNING_REQUIRED=NO",
               "-verbose"
    bin.install "build/Release/alerter"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/alerter --help")
  end
end
