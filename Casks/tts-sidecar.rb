cask "tts-sidecar" do
  version "0.7.2"
  sha256 "03807d4e1b9c0de2fc3132d2a5c7b2b4d48de4048154d6307ffc6d084a609aca"

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

    Licencia: GPL-3.0-or-later. La oferta de codigo fuente (GPLv3 seccion 6)
    y las atribuciones de terceros viajan dentro del bundle instalado:
      #{appdir}/tts-sidecar-arm64.app/Contents/Resources/SOURCE-OFFER.md
      #{appdir}/tts-sidecar-arm64.app/Contents/Resources/THIRD-PARTY-LICENSES.md
  EOS
end
