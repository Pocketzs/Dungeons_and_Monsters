require 'rails_helper'

RSpec.describe Monster, type: :model do
  it {should belong_to :dungeon}
end