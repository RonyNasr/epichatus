require('spec_helper')

describe(User) do
  it "validates presence of username" do
    user = User.new({:username => "", :password=> "1234", :email=> "bob@bob.com"})
    expect(user.save()).to(eq(false))
  end
  it "validates presence of password" do
    user = User.new({:username => "Bob", :password=> "", :email=> "bob@bob.com"})
    expect(user.save()).to(eq(false))
  end
  it "validates presence of email" do
    user = User.new({:username => "Bob", :password=> "1234", :email=> ""})
    expect(user.save()).to(eq(false))
  end
  it "accepts user login if all information present" do
    user = User.new({:username => "bob", :password=> "1234", :email=> "bob@bob.com"})
    expect(user.save()).to(eq(true))
  end
end
