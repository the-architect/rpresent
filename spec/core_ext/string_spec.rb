require_relative '../spec_helper'

describe String do

  describe 'underscore' do

    it { expect('MyModel'.underscore).to eql 'my_model' }
    it { expect('Namespace::MyModel'.underscore).to eql 'namespace/my_model' }
    it { expect('/my_model'.underscore).to eql '/my_model' }

  end

end