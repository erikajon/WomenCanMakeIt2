require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) do
    @project = Project.new(name: 'Build a blog')
  end

  it 'has a name' do
    expect(@project.name).to eq('Build a blog')
  end

  it 'has a tutorial attachment' do
    expect(@project.tutorial.path).to eq(nil)
    File.open('./spec/fixtures/build_a_blog.txt') do |f|
      @project.tutorial = f
      @project.save
    end
    expect(@project.tutorial.path).not_to eq(nil)
    expect(Paperclip.io_adapters.for(@project.tutorial).read).to eq('Build a blog')
  end
end