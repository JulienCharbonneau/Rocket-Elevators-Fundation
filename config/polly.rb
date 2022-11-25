require 'aws-sdk-core'

Aws.config.update(
  region: 'us-east-1',
  credentials: Aws::Credentials.new('AKIAQ7JF4W2FZGIY2GVZ', 'vfQntFKRF7LflCpdCYG43J51gad+WMHwZo4aBq8R')
)

client = Aws::Polly::Client.new(region: 'us-east-1')
client.synthesize_speech("all to read")

client.synthesize_speech(output_format: 'mp3', text: 'hello there', voice_id: 'Joanna')

