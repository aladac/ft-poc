require './lib/ft-poc'

describe FT::Search, ".new" do
  it "Creates a FM::Search obj" do
    search = FT::Search.new
    search.class.should eq(FT::Search)
  end
end

describe FT::Search, "#perform" do
  it "Should fail without at least @phrase" do
    search = FT::Search.new
    expect{search.perform}.to raise_error(ArgumentError)
  end
end

describe FT::Search, "#prune_links" do
  it "Should return an Array on success" do
    search = FT::Search.new
    search.phrase = "blabla"
    search.prune_links.class.should eq(Array)
  end
end

describe FT::Search, "#links" do
  it "Should return an Array on success" do
    search = FT::Search.new
    search.phrase = "blabla"
    search.links.class.should eq(Array)
  end
end