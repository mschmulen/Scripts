# get it ready
git bisect start
git bisect good f52c714
git bisect bad 2c67546

# git bisect bad 

# give git a command to run against each commit
git bisect run rspec spec/features/my_broken_spec.rb

# git bisect reset 

## Bisecting: 30 revisions left to test after this (roughly 5 steps)
## [0d9e5e5309197496adbd7670ae48dd6d815f5ae7] [skip ci] Updating ./Homer/Embedded/, Embeddeds.json, and Legend-default.json


