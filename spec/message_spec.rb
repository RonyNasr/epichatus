require('spec_helper')

describe(Message) do
  it "validates presence of body" do
    message = Message.new({:body => "", :user_id=> 1})
    expect(message.save()).to(eq(false))
  end
  it "validates presence of user_id" do
    message = Message.new({:body => "hey", :user_id=> nil})
    expect(message.save()).to(eq(false))
  end
  it "validates presence of user_id and body" do
    message = Message.new({:body => "hey", :user_id=> 1})
    expect(message.save()).to(eq(true))
  end
end
