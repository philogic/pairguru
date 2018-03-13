# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  movie_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:content) }
  it do
    should validate_uniqueness_of(:movie_id).scoped_to(:user_id).
      with_message('You can submit only one comment per movie!')
  end

  it { should have_db_column(:id).of_type(:integer) }
  it { should have_db_column(:content).of_type(:text) }
  it { should have_db_column(:movie_id).of_type(:integer) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
end
