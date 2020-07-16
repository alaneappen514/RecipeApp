require 'rails_helper'

RSpec.describe Recipe, type: :model do
subject { FactoryBot.create(:random_recipe)}

before { subject.save }

it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
end

it 'ingredients should be present' do
    subject.ingredients = nil
    expect(subject).to_not be_valid
end

it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
end

it 'title should not be too short' do
    subject.title = 'a'
    expect(subject).to_not be_valid
end

it 'title should not be too long' do
    subject.title = 'a' * 50
    expect(subject).to_not be_valid
end

it 'ingredients should not be too short' do
    subject.ingredients = 'a'
    expect(subject).to_not be_valid
end

it 'description should not be too short' do
    subject.description = 'a'
    expect(subject).to_not be_valid
end
end


