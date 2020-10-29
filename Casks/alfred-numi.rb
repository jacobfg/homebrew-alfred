cask "alfred-numi" do
  version "3.20.4"
  sha256 "de88c986acdfc418263f1e176aabe6dc8c251f4adc9a7eff974120d2e3fd5b02"

  # github.com/nikolaeu/Numi/ was verified as official when first introduced to the cask
  url "https://github.com/nikolaeu/Numi/releases/download/mac-#{version}/Numi.alfredworkflow"
  appcast "https://github.com/nikolaeu/numi/wiki/Alfred-Integration", must_contain: url.to_s
  name "Numi"
  desc "Use #{name.first} with Alfred for quick calculations"
  homepage "https://numi.io/docs/#alfred"

  depends_on cask: "alfred"
  depends_on cask: "numi"

  plist, = Dir["#{Dir.home}/Library/Preferences/com.*.Alfred-Preferences*.plist"]
  syncfolder = File.expand_path `/usr/bin/defaults read #{plist} syncfolder`
  workflows = "#{syncfolder.chomp}/Alfred.alfredpreferences/workflows"

  artifact staged_path, target: "#{workflows}/homebrew.workflow.#{token}"
end
