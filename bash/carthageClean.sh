#!/bin/bash

echo "carthage clean";

echo "removing: ~/Library/Developer/Xcode/DerivedData/";
rm -rf ~/Library/Developer/Xcode/DerivedData/
ls -la ~/Library/Developer/Xcode/DerivedData/

echo "removing: Carthage cache ~/Library/Caches/org.carthage.CarthageKit";
rm -rf ~/Library/Caches/org.carthage.CarthageKit/
ls -la ~/Library/Caches/org.carthage.CarthageKit/

cd Homer
echo " ---------------------- ";
echo " update Homer";
echo " ---------------------- ";

echo "removing: Carthage/ folder";
rm -rf Carthage
ls -la Carthage

# echo "removing: Cartfile.resolved";
# rm -rf Cartfile.resolved

# echo "running: bootstrap";
carthage bootstrap

echo "done";