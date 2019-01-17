require_relative '../lib/CoinMarketCap'

describe 'CryptoToArray' do
  describe '#CryptoToArray' do
    it 'take symbol and price => hashtable' do
      expect(coinmarketcap()).to eq({"ETC"=>4.41})
    end
  end
end
