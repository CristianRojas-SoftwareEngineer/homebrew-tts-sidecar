cask "tts-sidecar" do
  version "0.5.0"
  sha256 "db00e96f123daf5b4004ed54bc503bc83784a2b5d3c83f4b1aa3e349aed1abe1"

  url "https://github.com/CristianRojas-SoftwareEngineer/TTS-Sidecar/releases/download/v#{version}/tts-sidecar-#{version}-arm64.dmg"
  name "TTS Sidecar"
  desc "Motor de sintesis de voz (TTS) offline con clonacion de voz en espanol latinoamericano"
  homepage "https://github.com/CristianRojas-SoftwareEngineer/TTS-Sidecar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "tts-sidecar-arm64.app"
  binary "#{appdir}/tts-sidecar-arm64.app/Contents/MacOS/tts-sidecar"

  zap trash: [
    "~/Library/Application Support/tts-sidecar",
    "~/.cache/huggingface/hub/models--ResembleAI--Chatterbox-Multilingual-es-mx-latam",
    "~/.cache/huggingface/hub/models--ResembleAI--chatterbox",
  ]

  caveats <<~EOS
    El modelo de voz (es-mx-latam, varios cientos de MB) no viene incluido:
    descargalo una sola vez con:
      tts-sidecar setup
  EOS
end
