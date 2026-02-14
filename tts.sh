#!/bin/bash
# TTS script using ElevenLabs API

API_KEY="sk_e56135fd4730f40a12d3ef3901be9f591b363899fef1b334"
VOICE_ID="pNInz6obpgDQGcFmaJgB"  # Adam voice
OUTPUT_FILE="/tmp/tts-$(date +%s).mp3"

TEXT="$1"
if [ -z "$TEXT" ]; then
    echo "Usage: tts.sh \"text to speak\""
    exit 1
fi

# Call ElevenLabs API
curl -s "https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID" \
    -H "xi-api-key: $API_KEY" \
    -H "Content-Type: application/json" \
    -d "{\"text\":\"$TEXT\",\"model_id\":\"eleven_multilingual_v2\"}" \
    -o "$OUTPUT_FILE"

if [ -s "$OUTPUT_FILE" ]; then
    echo "Generated: $OUTPUT_FILE"
    echo "$OUTPUT_FILE"
else
    echo "Error generating audio"
    rm -f "$OUTPUT_FILE"
    exit 1
fi
