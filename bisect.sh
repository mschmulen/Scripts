# get it ready
git bisect start
git bisect good c09c728
git bisect bad e6a0692

# give git a command to run against each commit
git bisect run rspec spec/features/my_broken_spec.rb