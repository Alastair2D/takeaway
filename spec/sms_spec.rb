require 'sms'

describe Sms do 
subject(:sms) { described_class.new }
let(:client) { double(:client) }
# let(:client_messages { double: client_messages})

 before do
      allow(client).to receive(:messages).and_return (client)
      allow(client).to receive(:create).and_return (client)
      allow(client).to receive(:sid)
      allow(client).to receive(:time).and_return('time')
    end

    
  describe '#send' do 
    it 'sends a message' do 

      expect(subject.send).to eq "Message sent"
      end
    end

end
