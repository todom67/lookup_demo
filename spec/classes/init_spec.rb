require 'spec_helper'
describe 'lookup_demo' do
  context 'with default values for all parameters' do
    it { should contain_class('lookup_demo') }
  end
end
