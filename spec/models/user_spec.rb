require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tadesse', photo: 'https://image.com/01.jpg', bio: '29 years old microverse student', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'image should be present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = 2
    expect(subject).to be_valid
  end
end
