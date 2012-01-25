# Spec for PhotoGrab

require './lib/photograb'

describe PhotoGrab do 
    it 'Should load configuration' do
      PhotoGrab.config.class.should == PhotoGrab::Config
    end

    it 'Should load a connection' do
      PhotoGrab.conn.class.should == PhotoGrab::Conn
    end

    it 'Should generate an auth url' do 
      match = /^(http:\/\/www.flickr.com\/services\/oauth\/authorize?oauth_token=)/.match PhotoGrab.conn.preauth.to_s

      puts match
      match.class.should == MatchData

            match.class.should == MatchData
            match[1] == 'http://www.flickr.com/services/oauth/authorize?oauth_token='
      match[1].should == 'http://www.flickr.com/services/oauth/authorize?oauth_token='
    end
end
