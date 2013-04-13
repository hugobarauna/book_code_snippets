describe [1, 2, 3, 4] do
  it { should =~ [4, 3, 2, 1]}
  it { should  include(3, 2) }
  it { should  include(*[4, 3, 2, 1]) }
end
