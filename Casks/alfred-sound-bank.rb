cask "alfred-sound-bank" do
  version "1"
  sha256 "657c0c9f8e0278ea3b997e1998cdee71ff034dcffd92a3aed5aeda455bbf74d2"

  url "https://cachefly.alfredapp.com/labs/Alfred_Sound_Bank_Vol.#{version}.zip"
  appcast homepage.to_s
  name "Alfred Sound Bank Vol.#{version}"
  desc "Free sound bank for use in the Play Sound workflow output object"
  homepage "https://alfredapp.com/labs"

  depends_on cask: "alfred"

  artifact "#{name.first}/aif", target: "#{Dir.home}/Library/Sounds/#{name.first}"
end
