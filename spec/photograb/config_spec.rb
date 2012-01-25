# Spec for Photograb Configuration
#  This file will test the general config and the existence of api keys, 
#  though not the content therein

require './lib/photograb'

describe PhotoGrab::Config do
  it 'Should contain a string api consumer key' do
    config = PhotoGrab::Config.new
    config.consumer_key.class.should == String
  end

  it 'Should contain a string api secret to authorize the application' do
    config = PhotoGrab::Config.new
    config.secret.class.should == String
  end
end
