#!/bin/bash

echo "update_tools.sh";

echo " ---------------------- ";
echo " update Carthage via brew";
echo " brew update && brew upgrade carthage";
echo " ---------------------- ";

brew update && brew upgrade carthage

echo " ---------------------- ";
echo " update Fastlane";
echo " ---------------------- ";


echo "done";