const edgeTts = require('edge-tts');

async function speak(text, voice = 'en-US-AriaNeural', outputFile = '/tmp/speech.mp3') {
  const synthesize = new edgeTts.Synthesize();
  
  await synthesize.setProsody({
    rate: '+0%',
    pitch: '+0Hz',
    volume: '+0%'
  });
  
  await synthesize.connect(voice);
  await synthesize.read(text);
  await synthesize.save(outputFile);
  await synthesize.waitForFinish();
  
  console.log('Saved to:', outputFile);
  return outputFile;
}

const text = process.argv.slice(2).join(' ') || '你好，我是你的AI助手！';
speak(text).then(() => console.log('Done!')).catch(console.error);
