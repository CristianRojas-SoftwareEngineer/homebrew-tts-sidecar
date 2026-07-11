cask "tts-sidecar" do
  version "0.6.0"
  sha256 "d869c25e9c135f4d0406c4540375bd3dfcb3ef0a1789744971ef0c4f921628ac"

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
