#require 'rails_helper'
require 'spec_helper'

#RSpec.describe Contribute, :type => :model do
describe Contribute do
  describe '#title' do
    context '空白のとき' do
      it 'validでないこと' do
        contribute = Contribute.new(title: '')
        contribute.valid?
        expect(contribute.errors[:name]).to be_present
      end
    end
  end
end
