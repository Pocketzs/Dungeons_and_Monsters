require 'rails_helper'

RSpec.describe Dungeon, type: :model do
  it {should have_many :monsters}
end