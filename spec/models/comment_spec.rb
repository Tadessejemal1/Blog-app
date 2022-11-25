require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 134, post_id: 90, text: 'I like this Post') }

  before { subject.save }

  it 'post id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
