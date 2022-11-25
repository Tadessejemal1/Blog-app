require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(author_id: 133, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    # rubocop:disable Layout/LineLength
    subject.title = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    # rubocop:enable Layout/LineLength
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = -6
    expect(subject).to_not be_valid
  end
end
