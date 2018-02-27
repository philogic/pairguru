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
      with_message('You can submit only one review per movie!')
  end

end
