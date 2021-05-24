# CMake generated Testfile for 
# Source directory: /home/wuyulong/cmake-3.13.2
# Build directory: /home/wuyulong/cmake-3.13.2
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
include("/home/wuyulong/cmake-3.13.2/Tests/EnforceConfig.cmake")
add_test(SystemInformationNew "/home/wuyulong/cmake-3.13.2/bin/cmake" "--system-information" "-G" "Unix Makefiles")
subdirs("Source/kwsys")
subdirs("Utilities/KWIML")
subdirs("Utilities/cmlibrhash")
subdirs("Utilities/cmzlib")
subdirs("Utilities/cmcurl")
subdirs("Utilities/cmcompress")
subdirs("Utilities/cmexpat")
subdirs("Utilities/cmbzip2")
subdirs("Utilities/cmliblzma")
subdirs("Utilities/cmlibarchive")
subdirs("Utilities/cmjsoncpp")
subdirs("Utilities/cmlibuv")
subdirs("Source")
subdirs("Utilities")
subdirs("Tests")
subdirs("Auxiliary")
