#!/bin/sh

pwd;

# Localizable.strings
# /Users/schmulen/trees/github/learnwithhomer/apps/Homer/Homer/Base.lproj/Localizable.strings

# /Users/schmulen/tools/bin/verify-string-files
PROJECT_DIR="/Users/schmulen/tools/bin/"
SRCROOT="/Users/schmulen/trees/github/learnwithhomer/apps/Homer"

echo "Staring localize"

${PROJECT_DIR}/verify-string-files -develop ${SRCROOT}/iOSSampleApp/Resources/Base.lproj/Localizable.strings

# ${PROJECT_DIR}/support/verify-string-files -master ${SRCROOT}/iOSSampleApp/Resources/Base.lproj/Localizable.strings


# Finally
echo "🏁  Done. 🆒"

