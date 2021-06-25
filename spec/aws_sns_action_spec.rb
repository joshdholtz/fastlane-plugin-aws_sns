describe Fastlane::Actions::AwsSnsAction do
  describe '#run' do
    it 'doesn\'t smoke when you run it' do
      expect(Fastlane::UI).to receive(:important).with('Created String')

      aws_sns_client = Aws::SNS::Client.new(stub_responses: true)

      arn = Fastlane::Actions::AwsSnsAction.run({
        aws_sns_client: aws_sns_client,
        platform: 'FCM',
        platform_name: 'FCM_SNS_PLATFORM_APP',
        platform_fcm_server_key: 'PLACEHOLDER_FCM_KEY',
        attributes_override: {}
      })
      expect(arn).to eq('String')
    end
  end
end
