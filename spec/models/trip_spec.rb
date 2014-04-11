require 'spec_helper'

describe Trip do
  it { should have_many :errands }
end
