require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validates" do
     it { should validate_presence_of :title }
     it { should validate_presence_of :slug }
     it { should validate_presence_of :description }
     it { should validate_presence_of :author }
     it { should validate_presence_of :body }
  end
end
