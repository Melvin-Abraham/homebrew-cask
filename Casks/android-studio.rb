cask "android-studio" do
  version "2020.3.1.25"

  if Hardware::CPU.intel?
    sha256 "caa2a4a6adbd5ff94e0fbb9ffec798d5b24319070d7d231684ea9a458b1420ee"
    url "https://redirector.gvt1.com/edgedl/android/studio/install/#{version}/android-studio-#{version}-mac.dmg",
        verified: "redirector.gvt1.com/edgedl/android/studio/"
  else
    sha256 "05e190b6f33f4f924d69772fe149a9d697125a3be1f0b72d805b947fa4e102d4"
    url "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/#{version}/android-studio-#{version}-mac_arm.zip",
        verified: "redirector.gvt1.com/edgedl/android/studio/"
  end

  name "Android Studio"
  desc "Tools for building Android applications"
  homepage "https://developer.android.com/studio/"

  livecheck do
    url :homepage
    regex(/android-studio-(\d+(?:\.\d+)*)-mac/i)
  end

  auto_updates true

  app "Android Studio.app"

  zap trash: [
    "~/Library/Android/sdk",
    "~/Library/Application Support/AndroidStudio#{version.major_minor}",
    "~/Library/Caches/AndroidStudio#{version.major_minor}",
    "~/Library/Logs/AndroidStudio#{version.major_minor}",
    "~/Library/Preferences/AndroidStudio#{version.major_minor}",
    "~/Library/Preferences/com.android.Emulator.plist",
    "~/Library/Preferences/com.google.android.studio.plist",
    "~/Library/Saved Application State/com.google.android.studio.savedState",
    "~/.android",
  ],
      rmdir: [
        "~/AndroidStudioProjects",
        "~/Library/Android",
      ]
end
