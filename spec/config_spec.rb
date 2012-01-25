# Spec for Photograb Configuration
#  This file will test the general config and the existence of api keys, 
#  though not the content therein

require './lib/photograb'

describe PhotoGrab do
  describe PhotoGrab::Config do
    it 'Should provide appropriate http endpoints' do
      PhotoGrab.config.endpoint.should == 'http://api.flickr.com/services'
    end

    it 'Should provide appropriate https endpoints' do
      PhotoGrab.config.endpoint_secure.should == 'https://secure.flickr.com/services'
    end

    it 'Should contain a string api consumer key' do
      PhotoGrab.config.consumer_key.class.should == String
    end

    it 'Should contain a string api secret to authorize the application' do
      PhotoGrab.config.secret.class.should == String
    end

    it 'Should contain a string api consumer key' do
      PhotoGrab.config.username.class.should == String
    end

    it 'Should contain a string api secret to authorize the application' do
      PhotoGrab.config.password.class.should == String
    end
  end
end
